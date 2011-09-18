package org.lfcsa.calpads

class TeacherController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def beforeInterceptor = [action:this.&auth, 
      except:["login", "authenticate", "logout", "show_directory"]] 
   
    def auth() {
      if( !(("staff" in session?.userRoles) || ("administrator" in session?.userRoles))) {
         flash.message = "You must be an administrator to perform that task."
         redirect(controller:"user", action:"login")
         return false
      }
    }
   
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [teacherInstanceList: Teacher.list(params), teacherInstanceTotal: Teacher.count()]
    }

    def create = {
        def teacherInstance = new Teacher()
        teacherInstance.properties = params
        return [teacherInstance: teacherInstance]
    }

    def save = {
        def teacherInstance = new Teacher(params)
        if (teacherInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'teacher.label', default: 'Teacher'), teacherInstance.id])}"
            redirect(action: "show", id: teacherInstance.id)
        }
        else {
            render(view: "create", model: [teacherInstance: teacherInstance])
        }
    }

    def show = {
        def teacherInstance = Teacher.get(params.id)
        if (!teacherInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'teacher.label', default: 'Teacher'), params.id])}"
            redirect(action: "list")
        }
        else {
            [teacherInstance: teacherInstance]
        }
    }

    def edit = {
        def teacherInstance = Teacher.get(params.id)
        if (!teacherInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'teacher.label', default: 'Teacher'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [teacherInstance: teacherInstance]
        }
    }

    def update = {
        def teacherInstance = Teacher.get(params.id)
        if (teacherInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (teacherInstance.version > version) {
                    
                    teacherInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'teacher.label', default: 'Teacher')] as Object[], "Another user has updated this Teacher while you were editing")
                    render(view: "edit", model: [teacherInstance: teacherInstance])
                    return
                }
            }
            teacherInstance.properties = params
            if (!teacherInstance.hasErrors() && teacherInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'teacher.label', default: 'Teacher'), teacherInstance.id])}"
                redirect(action: "show", id: teacherInstance.id)
            }
            else {
                render(view: "edit", model: [teacherInstance: teacherInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'teacher.label', default: 'Teacher'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def teacherInstance = Teacher.get(params.id)
        if (teacherInstance) {
            try {
                teacherInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'teacher.label', default: 'Teacher'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'teacher.label', default: 'Teacher'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'teacher.label', default: 'Teacher'), params.id])}"
            redirect(action: "list")
        }
    }
}
