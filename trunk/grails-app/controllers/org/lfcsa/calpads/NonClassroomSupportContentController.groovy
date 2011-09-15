package org.lfcsa.calpads

class NonClassroomSupportContentController {

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
        [nonClassroomSupportContentInstanceList: NonClassroomSupportContent.list(params), nonClassroomSupportContentInstanceTotal: NonClassroomSupportContent.count()]
    }

    def create = {
        def nonClassroomSupportContentInstance = new NonClassroomSupportContent()
        nonClassroomSupportContentInstance.properties = params
        return [nonClassroomSupportContentInstance: nonClassroomSupportContentInstance]
    }

    def save = {
        def nonClassroomSupportContentInstance = new NonClassroomSupportContent(params)
        if (nonClassroomSupportContentInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'nonClassroomSupportContent.label', default: 'NonClassroomSupportContent'), nonClassroomSupportContentInstance.id])}"
            redirect(action: "show", id: nonClassroomSupportContentInstance.id)
        }
        else {
            render(view: "create", model: [nonClassroomSupportContentInstance: nonClassroomSupportContentInstance])
        }
    }

    def show = {
        def nonClassroomSupportContentInstance = NonClassroomSupportContent.get(params.id)
        if (!nonClassroomSupportContentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'nonClassroomSupportContent.label', default: 'NonClassroomSupportContent'), params.id])}"
            redirect(action: "list")
        }
        else {
            [nonClassroomSupportContentInstance: nonClassroomSupportContentInstance]
        }
    }

    def edit = {
        def nonClassroomSupportContentInstance = NonClassroomSupportContent.get(params.id)
        if (!nonClassroomSupportContentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'nonClassroomSupportContent.label', default: 'NonClassroomSupportContent'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [nonClassroomSupportContentInstance: nonClassroomSupportContentInstance]
        }
    }

    def update = {
        def nonClassroomSupportContentInstance = NonClassroomSupportContent.get(params.id)
        if (nonClassroomSupportContentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (nonClassroomSupportContentInstance.version > version) {
                    
                    nonClassroomSupportContentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'nonClassroomSupportContent.label', default: 'NonClassroomSupportContent')] as Object[], "Another user has updated this NonClassroomSupportContent while you were editing")
                    render(view: "edit", model: [nonClassroomSupportContentInstance: nonClassroomSupportContentInstance])
                    return
                }
            }
            nonClassroomSupportContentInstance.properties = params
            if (!nonClassroomSupportContentInstance.hasErrors() && nonClassroomSupportContentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'nonClassroomSupportContent.label', default: 'NonClassroomSupportContent'), nonClassroomSupportContentInstance.id])}"
                redirect(action: "show", id: nonClassroomSupportContentInstance.id)
            }
            else {
                render(view: "edit", model: [nonClassroomSupportContentInstance: nonClassroomSupportContentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'nonClassroomSupportContent.label', default: 'NonClassroomSupportContent'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def nonClassroomSupportContentInstance = NonClassroomSupportContent.get(params.id)
        if (nonClassroomSupportContentInstance) {
            try {
                nonClassroomSupportContentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'nonClassroomSupportContent.label', default: 'NonClassroomSupportContent'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'nonClassroomSupportContent.label', default: 'NonClassroomSupportContent'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'nonClassroomSupportContent.label', default: 'NonClassroomSupportContent'), params.id])}"
            redirect(action: "list")
        }
    }
}
