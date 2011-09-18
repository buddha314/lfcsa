package org.lfcsa.calpads

class PhoneContactController {

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
        [phoneContactInstanceList: PhoneContact.list(params), phoneContactInstanceTotal: PhoneContact.count()]
    }

    def create = {
        def phoneContactInstance = new PhoneContact()
        phoneContactInstance.properties = params
        return [phoneContactInstance: phoneContactInstance]
    }

    def save = {
        def phoneContactInstance = new PhoneContact(params)
        if (phoneContactInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'phoneContact.label', default: 'PhoneContact'), phoneContactInstance.id])}"
            redirect(action: "show", id: phoneContactInstance.id)
        }
        else {
            render(view: "create", model: [phoneContactInstance: phoneContactInstance])
        }
    }

    def show = {
        def phoneContactInstance = PhoneContact.get(params.id)
        if (!phoneContactInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'phoneContact.label', default: 'PhoneContact'), params.id])}"
            redirect(action: "list")
        }
        else {
            [phoneContactInstance: phoneContactInstance]
        }
    }

    def edit = {
        def phoneContactInstance = PhoneContact.get(params.id)
        if (!phoneContactInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'phoneContact.label', default: 'PhoneContact'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [phoneContactInstance: phoneContactInstance]
        }
    }

    def update = {
        def phoneContactInstance = PhoneContact.get(params.id)
        if (phoneContactInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (phoneContactInstance.version > version) {
                    
                    phoneContactInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'phoneContact.label', default: 'PhoneContact')] as Object[], "Another user has updated this PhoneContact while you were editing")
                    render(view: "edit", model: [phoneContactInstance: phoneContactInstance])
                    return
                }
            }
            phoneContactInstance.properties = params
            if (!phoneContactInstance.hasErrors() && phoneContactInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'phoneContact.label', default: 'PhoneContact'), phoneContactInstance.id])}"
                redirect(action: "show", id: phoneContactInstance.id)
            }
            else {
                render(view: "edit", model: [phoneContactInstance: phoneContactInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'phoneContact.label', default: 'PhoneContact'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def phoneContactInstance = PhoneContact.get(params.id)
        if (phoneContactInstance) {
            try {
                phoneContactInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'phoneContact.label', default: 'PhoneContact'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'phoneContact.label', default: 'PhoneContact'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'phoneContact.label', default: 'PhoneContact'), params.id])}"
            redirect(action: "list")
        }
    }
}
