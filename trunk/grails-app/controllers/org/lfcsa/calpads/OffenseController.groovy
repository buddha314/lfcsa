package org.lfcsa.calpads

class OffenseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def beforeInterceptor = [action:this.&auth, 
      except:["login", "authenticate", "logout", "show_directory"]] 
   
    def auth() {
      if( !(("staff" in session.userRoles) || ("administrator" in session.userRoles))) {
         flash.message = "You must be an administrator to perform that task."
         redirect(controller:"user", action:"login")
         return false
      } else {
         return true
      }
    }
 
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [offenseInstanceList: Offense.list(params), offenseInstanceTotal: Offense.count()]
    }

    def create = {
        def offenseInstance = new Offense()
        offenseInstance.properties = params
        return [offenseInstance: offenseInstance]
    }

    def save = {
        def offenseInstance = new Offense(params)
        if (offenseInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'offense.label', default: 'Offense'), offenseInstance.id])}"
            redirect(action: "show", id: offenseInstance.id)
        }
        else {
            render(view: "create", model: [offenseInstance: offenseInstance])
        }
    }

    def show = {
        def offenseInstance = Offense.get(params.id)
        if (!offenseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'offense.label', default: 'Offense'), params.id])}"
            redirect(action: "list")
        }
        else {
            [offenseInstance: offenseInstance]
        }
    }

    def edit = {
        def offenseInstance = Offense.get(params.id)
        if (!offenseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'offense.label', default: 'Offense'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [offenseInstance: offenseInstance]
        }
    }

    def update = {
        def offenseInstance = Offense.get(params.id)
        if (offenseInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (offenseInstance.version > version) {
                    
                    offenseInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'offense.label', default: 'Offense')] as Object[], "Another user has updated this Offense while you were editing")
                    render(view: "edit", model: [offenseInstance: offenseInstance])
                    return
                }
            }
            offenseInstance.properties = params
            if (!offenseInstance.hasErrors() && offenseInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'offense.label', default: 'Offense'), offenseInstance.id])}"
                redirect(action: "show", id: offenseInstance.id)
            }
            else {
                render(view: "edit", model: [offenseInstance: offenseInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'offense.label', default: 'Offense'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def offenseInstance = Offense.get(params.id)
        if (offenseInstance) {
            try {
                offenseInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'offense.label', default: 'Offense'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'offense.label', default: 'Offense'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'offense.label', default: 'Offense'), params.id])}"
            redirect(action: "list")
        }
    }
}
