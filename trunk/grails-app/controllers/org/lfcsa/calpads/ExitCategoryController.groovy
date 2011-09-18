package org.lfcsa.calpads

class ExitCategoryController {

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
        [exitCategoryInstanceList: ExitCategory.list(params), exitCategoryInstanceTotal: ExitCategory.count()]
    }

    def create = {
        def exitCategoryInstance = new ExitCategory()
        exitCategoryInstance.properties = params
        return [exitCategoryInstance: exitCategoryInstance]
    }

    def save = {
        def exitCategoryInstance = new ExitCategory(params)
        if (exitCategoryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'exitCategory.label', default: 'ExitCategory'), exitCategoryInstance.id])}"
            redirect(action: "show", id: exitCategoryInstance.id)
        }
        else {
            render(view: "create", model: [exitCategoryInstance: exitCategoryInstance])
        }
    }

    def show = {
        def exitCategoryInstance = ExitCategory.get(params.id)
        if (!exitCategoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'exitCategory.label', default: 'ExitCategory'), params.id])}"
            redirect(action: "list")
        }
        else {
            [exitCategoryInstance: exitCategoryInstance]
        }
    }

    def edit = {
        def exitCategoryInstance = ExitCategory.get(params.id)
        if (!exitCategoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'exitCategory.label', default: 'ExitCategory'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [exitCategoryInstance: exitCategoryInstance]
        }
    }

    def update = {
        def exitCategoryInstance = ExitCategory.get(params.id)
        if (exitCategoryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (exitCategoryInstance.version > version) {
                    
                    exitCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'exitCategory.label', default: 'ExitCategory')] as Object[], "Another user has updated this ExitCategory while you were editing")
                    render(view: "edit", model: [exitCategoryInstance: exitCategoryInstance])
                    return
                }
            }
            exitCategoryInstance.properties = params
            if (!exitCategoryInstance.hasErrors() && exitCategoryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'exitCategory.label', default: 'ExitCategory'), exitCategoryInstance.id])}"
                redirect(action: "show", id: exitCategoryInstance.id)
            }
            else {
                render(view: "edit", model: [exitCategoryInstance: exitCategoryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'exitCategory.label', default: 'ExitCategory'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def exitCategoryInstance = ExitCategory.get(params.id)
        if (exitCategoryInstance) {
            try {
                exitCategoryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'exitCategory.label', default: 'ExitCategory'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'exitCategory.label', default: 'ExitCategory'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'exitCategory.label', default: 'ExitCategory'), params.id])}"
            redirect(action: "list")
        }
    }
}
