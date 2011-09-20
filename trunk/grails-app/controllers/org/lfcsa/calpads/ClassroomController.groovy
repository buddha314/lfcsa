package org.lfcsa.calpads

class ClassroomController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def beforeInterceptor = [action:this.&auth, 
      except:["login", "authenticate", "logout", "welcome"]] 
   
    def auth() {
      //if( !(("staff" in session?.userRoles) || ("administrator" in session?.userRoles))) {
      if( !("administrator" in session?.userRoles)) {
         def msg = "Current Roles: "
         session.userRoles.each {
            msg << "${it} "
         }
         //flash.message = "You must be an administrator to perform that task."
         flash.message = msg 
         redirect(controller:"user", action:"login")
         return false
      } else {
         return true
      }
    }

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [classroomInstanceList: Classroom.list(params), classroomInstanceTotal: Classroom.count()]
    }

    def create = {
        def classroomInstance = new Classroom()
        classroomInstance.properties = params
        return [classroomInstance: classroomInstance]
    }

    def save = {
        def classroomInstance = new Classroom(params)
        if (classroomInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'classroom.label', default: 'Classroom'), classroomInstance.id])}"
            redirect(action: "show", id: classroomInstance.id)
        }
        else {
            render(view: "create", model: [classroomInstance: classroomInstance])
        }
    }

    def show = {
        def classroomInstance = Classroom.get(params.id)
        if (!classroomInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classroom.label', default: 'Classroom'), params.id])}"
            redirect(action: "list")
        }
        else {
            [classroomInstance: classroomInstance]
        }
    }

    def edit = {
        def classroomInstance = Classroom.get(params.id)
        if (!classroomInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classroom.label', default: 'Classroom'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [classroomInstance: classroomInstance]
        }
    }

    def update = {
        def classroomInstance = Classroom.get(params.id)
        if (classroomInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (classroomInstance.version > version) {
                    
                    classroomInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'classroom.label', default: 'Classroom')] as Object[], "Another user has updated this Classroom while you were editing")
                    render(view: "edit", model: [classroomInstance: classroomInstance])
                    return
                }
            }
            classroomInstance.properties = params
            if (!classroomInstance.hasErrors() && classroomInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'classroom.label', default: 'Classroom'), classroomInstance.id])}"
                redirect(action: "show", id: classroomInstance.id)
            }
            else {
                render(view: "edit", model: [classroomInstance: classroomInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classroom.label', default: 'Classroom'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def classroomInstance = Classroom.get(params.id)
        if (classroomInstance) {
            try {
                classroomInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'classroom.label', default: 'Classroom'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'classroom.label', default: 'Classroom'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classroom.label', default: 'Classroom'), params.id])}"
            redirect(action: "list")
        }
    }
}
