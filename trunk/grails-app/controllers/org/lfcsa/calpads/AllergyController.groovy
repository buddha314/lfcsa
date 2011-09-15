package org.lfcsa.calpads

class AllergyController {

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
        [allergyInstanceList: Allergy.list(params), allergyInstanceTotal: Allergy.count()]
    }

    def create = {
        def allergyInstance = new Allergy()
        allergyInstance.properties = params
        return [allergyInstance: allergyInstance]
    }

    def save = {
        def allergyInstance = new Allergy(params)
        if (allergyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'allergy.label', default: 'Allergy'), allergyInstance.id])}"
            redirect(action: "show", id: allergyInstance.id)
        }
        else {
            render(view: "create", model: [allergyInstance: allergyInstance])
        }
    }

    def show = {
        def allergyInstance = Allergy.get(params.id)
        if (!allergyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'allergy.label', default: 'Allergy'), params.id])}"
            redirect(action: "list")
        }
        else {
            [allergyInstance: allergyInstance]
        }
    }

    def edit = {
        def allergyInstance = Allergy.get(params.id)
        if (!allergyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'allergy.label', default: 'Allergy'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [allergyInstance: allergyInstance]
        }
    }

    def update = {
        def allergyInstance = Allergy.get(params.id)
        if (allergyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (allergyInstance.version > version) {
                    
                    allergyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'allergy.label', default: 'Allergy')] as Object[], "Another user has updated this Allergy while you were editing")
                    render(view: "edit", model: [allergyInstance: allergyInstance])
                    return
                }
            }
            allergyInstance.properties = params
            if (!allergyInstance.hasErrors() && allergyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'allergy.label', default: 'Allergy'), allergyInstance.id])}"
                redirect(action: "show", id: allergyInstance.id)
            }
            else {
                render(view: "edit", model: [allergyInstance: allergyInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'allergy.label', default: 'Allergy'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def allergyInstance = Allergy.get(params.id)
        if (allergyInstance) {
            try {
                allergyInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'allergy.label', default: 'Allergy'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'allergy.label', default: 'Allergy'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'allergy.label', default: 'Allergy'), params.id])}"
            redirect(action: "list")
        }
    }
}
