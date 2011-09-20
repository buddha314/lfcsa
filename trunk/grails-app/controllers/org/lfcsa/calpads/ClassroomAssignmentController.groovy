package org.lfcsa.calpads

class ClassroomAssignmentController {

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
        [classroomAssignmentInstanceList: ClassroomAssignment.list(params), classroomAssignmentInstanceTotal: ClassroomAssignment.count()]
    }

    def create = {
        def classroomAssignmentInstance = new ClassroomAssignment()
        classroomAssignmentInstance.properties = params
        return [classroomAssignmentInstance: classroomAssignmentInstance]
    }

    def save = {
        def classroomAssignmentInstance = new ClassroomAssignment(params)
        if (classroomAssignmentInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'classroomAssignment.label', default: 'ClassroomAssignment'), classroomAssignmentInstance.id])}"
            redirect(action: "show", id: classroomAssignmentInstance.id)
        }
        else {
            render(view: "create", model: [classroomAssignmentInstance: classroomAssignmentInstance])
        }
    }

    def show = {
        def classroomAssignmentInstance = ClassroomAssignment.get(params.id)
        if (!classroomAssignmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classroomAssignment.label', default: 'ClassroomAssignment'), params.id])}"
            redirect(action: "list")
        }
        else {
            [classroomAssignmentInstance: classroomAssignmentInstance]
        }
    }

    def edit = {
        def classroomAssignmentInstance = ClassroomAssignment.get(params.id)
        if (!classroomAssignmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classroomAssignment.label', default: 'ClassroomAssignment'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [classroomAssignmentInstance: classroomAssignmentInstance]
        }
    }

    def update = {
        def classroomAssignmentInstance = ClassroomAssignment.get(params.id)
        if (classroomAssignmentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (classroomAssignmentInstance.version > version) {
                    
                    classroomAssignmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'classroomAssignment.label', default: 'ClassroomAssignment')] as Object[], "Another user has updated this ClassroomAssignment while you were editing")
                    render(view: "edit", model: [classroomAssignmentInstance: classroomAssignmentInstance])
                    return
                }
            }
            classroomAssignmentInstance.properties = params
            if (!classroomAssignmentInstance.hasErrors() && classroomAssignmentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'classroomAssignment.label', default: 'ClassroomAssignment'), classroomAssignmentInstance.id])}"
                redirect(action: "show", id: classroomAssignmentInstance.id)
            }
            else {
                render(view: "edit", model: [classroomAssignmentInstance: classroomAssignmentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classroomAssignment.label', default: 'ClassroomAssignment'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def classroomAssignmentInstance = ClassroomAssignment.get(params.id)
        if (classroomAssignmentInstance) {
            try {
                classroomAssignmentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'classroomAssignment.label', default: 'ClassroomAssignment'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'classroomAssignment.label', default: 'ClassroomAssignment'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classroomAssignment.label', default: 'ClassroomAssignment'), params.id])}"
            redirect(action: "list")
        }
    }
}
