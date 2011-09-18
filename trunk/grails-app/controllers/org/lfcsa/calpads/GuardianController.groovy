package org.lfcsa.calpads

class GuardianController {

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
        [guardianInstanceList: Guardian.list(params), guardianInstanceTotal: Guardian.count()]
    }

    def create = {
        def guardianInstance = new Guardian()
        guardianInstance.properties = params
        return [guardianInstance: guardianInstance]
    }

    def save = {
        def guardianInstance = new Guardian(params)
        if (guardianInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'guardian.label', default: 'Guardian'), guardianInstance.id])}"
            redirect(action: "show", id: guardianInstance.id)
        }
        else {
            render(view: "create", model: [guardianInstance: guardianInstance])
        }
    }

    def show = {
        def guardianInstance = Guardian.get(params.id)
        if (!guardianInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'guardian.label', default: 'Guardian'), params.id])}"
            redirect(action: "list")
        }
        else {
            [guardianInstance: guardianInstance]
        }
    }

    def edit = {
        def guardianInstance = Guardian.get(params.id)
        if (!guardianInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'guardian.label', default: 'Guardian'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [guardianInstance: guardianInstance]
        }
    }

    def update = {
        def guardianInstance = Guardian.get(params.id)
        if (guardianInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (guardianInstance.version > version) {
                    
                    guardianInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'guardian.label', default: 'Guardian')] as Object[], "Another user has updated this Guardian while you were editing")
                    render(view: "edit", model: [guardianInstance: guardianInstance])
                    return
                }
            }
            guardianInstance.properties = params
            if (!guardianInstance.hasErrors() && guardianInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'guardian.label', default: 'Guardian'), guardianInstance.id])}"
                redirect(action: "show", id: guardianInstance.id)
            }
            else {
                render(view: "edit", model: [guardianInstance: guardianInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'guardian.label', default: 'Guardian'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def guardianInstance = Guardian.get(params.id)
        if (guardianInstance) {
            try {
                guardianInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'guardian.label', default: 'Guardian'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'guardian.label', default: 'Guardian'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'guardian.label', default: 'Guardian'), params.id])}"
            redirect(action: "list")
        }
    }
}
