package org.lfcsa.calpads

class ResidenceController {

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
        [residenceInstanceList: Residence.list(params), residenceInstanceTotal: Residence.count()]
    }

    def create = {
        def residenceInstance = new Residence()
        residenceInstance.properties = params
        return [residenceInstance: residenceInstance]
    }

    def save = {
        def residenceInstance = new Residence(params)
        if (residenceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'residence.label', default: 'Residence'), residenceInstance.id])}"
            redirect(action: "show", id: residenceInstance.id)
        }
        else {
            render(view: "create", model: [residenceInstance: residenceInstance])
        }
    }

    def show = {
        def residenceInstance = Residence.get(params.id)
        if (!residenceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'residence.label', default: 'Residence'), params.id])}"
            redirect(action: "list")
        }
        else {
            [residenceInstance: residenceInstance]
        }
    }

    def edit = {
        def residenceInstance = Residence.get(params.id)
        if (!residenceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'residence.label', default: 'Residence'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [residenceInstance: residenceInstance]
        }
    }

    def update = {
        def residenceInstance = Residence.get(params.id)
        if (residenceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (residenceInstance.version > version) {
                    
                    residenceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'residence.label', default: 'Residence')] as Object[], "Another user has updated this Residence while you were editing")
                    render(view: "edit", model: [residenceInstance: residenceInstance])
                    return
                }
            }
            residenceInstance.properties = params
            if (!residenceInstance.hasErrors() && residenceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'residence.label', default: 'Residence'), residenceInstance.id])}"
                redirect(action: "show", id: residenceInstance.id)
            }
            else {
                render(view: "edit", model: [residenceInstance: residenceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'residence.label', default: 'Residence'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def residenceInstance = Residence.get(params.id)
        if (residenceInstance) {
            try {
                residenceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'residence.label', default: 'Residence'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'residence.label', default: 'Residence'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'residence.label', default: 'Residence'), params.id])}"
            redirect(action: "list")
        }
    }
}
