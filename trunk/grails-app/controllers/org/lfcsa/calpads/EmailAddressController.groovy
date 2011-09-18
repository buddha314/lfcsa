package org.lfcsa.calpads

class EmailAddressController {

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
        [emailAddressInstanceList: EmailAddress.list(params), emailAddressInstanceTotal: EmailAddress.count()]
    }

    def create = {
        def emailAddressInstance = new EmailAddress()
        emailAddressInstance.properties = params
        return [emailAddressInstance: emailAddressInstance]
    }

    def save = {
        def emailAddressInstance = new EmailAddress(params)
        if (emailAddressInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), emailAddressInstance.id])}"
            redirect(action: "show", id: emailAddressInstance.id)
        }
        else {
            render(view: "create", model: [emailAddressInstance: emailAddressInstance])
        }
    }

    def show = {
        def emailAddressInstance = EmailAddress.get(params.id)
        if (!emailAddressInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), params.id])}"
            redirect(action: "list")
        }
        else {
            [emailAddressInstance: emailAddressInstance]
        }
    }

    def edit = {
        def emailAddressInstance = EmailAddress.get(params.id)
        if (!emailAddressInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [emailAddressInstance: emailAddressInstance]
        }
    }

    def update = {
        def emailAddressInstance = EmailAddress.get(params.id)
        if (emailAddressInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (emailAddressInstance.version > version) {
                    
                    emailAddressInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'emailAddress.label', default: 'EmailAddress')] as Object[], "Another user has updated this EmailAddress while you were editing")
                    render(view: "edit", model: [emailAddressInstance: emailAddressInstance])
                    return
                }
            }
            emailAddressInstance.properties = params
            if (!emailAddressInstance.hasErrors() && emailAddressInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), emailAddressInstance.id])}"
                redirect(action: "show", id: emailAddressInstance.id)
            }
            else {
                render(view: "edit", model: [emailAddressInstance: emailAddressInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def emailAddressInstance = EmailAddress.get(params.id)
        if (emailAddressInstance) {
            try {
                emailAddressInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), params.id])}"
            redirect(action: "list")
        }
    }
}
