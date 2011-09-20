package org.lfcsa.calpads

class SemesterController {

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
        [semesterInstanceList: Semester.list(params), semesterInstanceTotal: Semester.count()]
    }

    def create = {
        def semesterInstance = new Semester()
        semesterInstance.properties = params
        return [semesterInstance: semesterInstance]
    }

    def save = {
        def semesterInstance = new Semester(params)
        if (semesterInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'semester.label', default: 'Semester'), semesterInstance.id])}"
            redirect(action: "show", id: semesterInstance.id)
        }
        else {
            render(view: "create", model: [semesterInstance: semesterInstance])
        }
    }

    def show = {
        def semesterInstance = Semester.get(params.id)
        if (!semesterInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'semester.label', default: 'Semester'), params.id])}"
            redirect(action: "list")
        }
        else {
            [semesterInstance: semesterInstance]
        }
    }

    def edit = {
        def semesterInstance = Semester.get(params.id)
        if (!semesterInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'semester.label', default: 'Semester'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [semesterInstance: semesterInstance]
        }
    }

    def update = {
        def semesterInstance = Semester.get(params.id)
        if (semesterInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (semesterInstance.version > version) {
                    
                    semesterInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'semester.label', default: 'Semester')] as Object[], "Another user has updated this Semester while you were editing")
                    render(view: "edit", model: [semesterInstance: semesterInstance])
                    return
                }
            }
            semesterInstance.properties = params
            if (!semesterInstance.hasErrors() && semesterInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'semester.label', default: 'Semester'), semesterInstance.id])}"
                redirect(action: "show", id: semesterInstance.id)
            }
            else {
                render(view: "edit", model: [semesterInstance: semesterInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'semester.label', default: 'Semester'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def semesterInstance = Semester.get(params.id)
        if (semesterInstance) {
            try {
                semesterInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'semester.label', default: 'Semester'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'semester.label', default: 'Semester'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'semester.label', default: 'Semester'), params.id])}"
            redirect(action: "list")
        }
    }
}
