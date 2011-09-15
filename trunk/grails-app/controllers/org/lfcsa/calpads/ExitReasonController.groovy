package org.lfcsa.calpads

class ExitReasonController {

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
        [exitReasonInstanceList: ExitReason.list(params), exitReasonInstanceTotal: ExitReason.count()]
    }

    def create = {
        def exitReasonInstance = new ExitReason()
        exitReasonInstance.properties = params
        return [exitReasonInstance: exitReasonInstance]
    }

    def save = {
        def exitReasonInstance = new ExitReason(params)
        if (exitReasonInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'exitReason.label', default: 'ExitReason'), exitReasonInstance.id])}"
            redirect(action: "show", id: exitReasonInstance.id)
        }
        else {
            render(view: "create", model: [exitReasonInstance: exitReasonInstance])
        }
    }

    def show = {
        def exitReasonInstance = ExitReason.get(params.id)
        if (!exitReasonInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'exitReason.label', default: 'ExitReason'), params.id])}"
            redirect(action: "list")
        }
        else {
            [exitReasonInstance: exitReasonInstance]
        }
    }

    def edit = {
        def exitReasonInstance = ExitReason.get(params.id)
        if (!exitReasonInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'exitReason.label', default: 'ExitReason'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [exitReasonInstance: exitReasonInstance]
        }
    }

    def update = {
        def exitReasonInstance = ExitReason.get(params.id)
        if (exitReasonInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (exitReasonInstance.version > version) {
                    
                    exitReasonInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'exitReason.label', default: 'ExitReason')] as Object[], "Another user has updated this ExitReason while you were editing")
                    render(view: "edit", model: [exitReasonInstance: exitReasonInstance])
                    return
                }
            }
            exitReasonInstance.properties = params
            if (!exitReasonInstance.hasErrors() && exitReasonInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'exitReason.label', default: 'ExitReason'), exitReasonInstance.id])}"
                redirect(action: "show", id: exitReasonInstance.id)
            }
            else {
                render(view: "edit", model: [exitReasonInstance: exitReasonInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'exitReason.label', default: 'ExitReason'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def exitReasonInstance = ExitReason.get(params.id)
        if (exitReasonInstance) {
            try {
                exitReasonInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'exitReason.label', default: 'ExitReason'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'exitReason.label', default: 'ExitReason'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'exitReason.label', default: 'ExitReason'), params.id])}"
            redirect(action: "list")
        }
    }
}
