package org.lfcsa.calpads

class StateProvinceController {

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
        [stateProvinceInstanceList: StateProvince.list(params), stateProvinceInstanceTotal: StateProvince.count()]
    }

    def create = {
        def stateProvinceInstance = new StateProvince()
        stateProvinceInstance.properties = params
        return [stateProvinceInstance: stateProvinceInstance]
    }

    def save = {
        def stateProvinceInstance = new StateProvince(params)
        if (stateProvinceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'stateProvince.label', default: 'StateProvince'), stateProvinceInstance.id])}"
            redirect(action: "show", id: stateProvinceInstance.id)
        }
        else {
            render(view: "create", model: [stateProvinceInstance: stateProvinceInstance])
        }
    }

    def show = {
        def stateProvinceInstance = StateProvince.get(params.id)
        if (!stateProvinceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'stateProvince.label', default: 'StateProvince'), params.id])}"
            redirect(action: "list")
        }
        else {
            [stateProvinceInstance: stateProvinceInstance]
        }
    }

    def edit = {
        def stateProvinceInstance = StateProvince.get(params.id)
        if (!stateProvinceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'stateProvince.label', default: 'StateProvince'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [stateProvinceInstance: stateProvinceInstance]
        }
    }

    def update = {
        def stateProvinceInstance = StateProvince.get(params.id)
        if (stateProvinceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (stateProvinceInstance.version > version) {
                    
                    stateProvinceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'stateProvince.label', default: 'StateProvince')] as Object[], "Another user has updated this StateProvince while you were editing")
                    render(view: "edit", model: [stateProvinceInstance: stateProvinceInstance])
                    return
                }
            }
            stateProvinceInstance.properties = params
            if (!stateProvinceInstance.hasErrors() && stateProvinceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'stateProvince.label', default: 'StateProvince'), stateProvinceInstance.id])}"
                redirect(action: "show", id: stateProvinceInstance.id)
            }
            else {
                render(view: "edit", model: [stateProvinceInstance: stateProvinceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'stateProvince.label', default: 'StateProvince'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def stateProvinceInstance = StateProvince.get(params.id)
        if (stateProvinceInstance) {
            try {
                stateProvinceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'stateProvince.label', default: 'StateProvince'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'stateProvince.label', default: 'StateProvince'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'stateProvince.label', default: 'StateProvince'), params.id])}"
            redirect(action: "list")
        }
    }
}
