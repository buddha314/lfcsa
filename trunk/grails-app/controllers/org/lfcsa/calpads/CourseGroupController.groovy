package org.lfcsa.calpads

class CourseGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def beforeInterceptor = [action:this.&auth, 
      except:["login", "authenticate", "logout", "show_directory", "index"]] 
   
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
        [courseGroupInstanceList: CourseGroup.list(params), courseGroupInstanceTotal: CourseGroup.count()]
    }

    def create = {
        def courseGroupInstance = new CourseGroup()
        courseGroupInstance.properties = params
        return [courseGroupInstance: courseGroupInstance]
    }

    def save = {
        def courseGroupInstance = new CourseGroup(params)
        if (courseGroupInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'courseGroup.label', default: 'CourseGroup'), courseGroupInstance.id])}"
            redirect(action: "show", id: courseGroupInstance.id)
        }
        else {
            render(view: "create", model: [courseGroupInstance: courseGroupInstance])
        }
    }

    def show = {
        def courseGroupInstance = CourseGroup.get(params.id)
        if (!courseGroupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'courseGroup.label', default: 'CourseGroup'), params.id])}"
            redirect(action: "list")
        }
        else {
            [courseGroupInstance: courseGroupInstance]
        }
    }

    def edit = {
        def courseGroupInstance = CourseGroup.get(params.id)
        if (!courseGroupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'courseGroup.label', default: 'CourseGroup'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [courseGroupInstance: courseGroupInstance]
        }
    }

    def update = {
        def courseGroupInstance = CourseGroup.get(params.id)
        if (courseGroupInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (courseGroupInstance.version > version) {
                    
                    courseGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'courseGroup.label', default: 'CourseGroup')] as Object[], "Another user has updated this CourseGroup while you were editing")
                    render(view: "edit", model: [courseGroupInstance: courseGroupInstance])
                    return
                }
            }
            courseGroupInstance.properties = params
            if (!courseGroupInstance.hasErrors() && courseGroupInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'courseGroup.label', default: 'CourseGroup'), courseGroupInstance.id])}"
                redirect(action: "show", id: courseGroupInstance.id)
            }
            else {
                render(view: "edit", model: [courseGroupInstance: courseGroupInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'courseGroup.label', default: 'CourseGroup'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def courseGroupInstance = CourseGroup.get(params.id)
        if (courseGroupInstance) {
            try {
                courseGroupInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'courseGroup.label', default: 'CourseGroup'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'courseGroup.label', default: 'CourseGroup'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'courseGroup.label', default: 'CourseGroup'), params.id])}"
            redirect(action: "list")
        }
    }
}
