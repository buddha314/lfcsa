package org.lfcsa.calpads

class CTEPathwayController {

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
        [CTEPathwayInstanceList: CTEPathway.list(params), CTEPathwayInstanceTotal: CTEPathway.count()]
    }

    def create = {
        def CTEPathwayInstance = new CTEPathway()
        CTEPathwayInstance.properties = params
        return [CTEPathwayInstance: CTEPathwayInstance]
    }

    def save = {
        def CTEPathwayInstance = new CTEPathway(params)
        if (CTEPathwayInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'CTEPathway.label', default: 'CTEPathway'), CTEPathwayInstance.id])}"
            redirect(action: "show", id: CTEPathwayInstance.id)
        }
        else {
            render(view: "create", model: [CTEPathwayInstance: CTEPathwayInstance])
        }
    }

    def show = {
        def CTEPathwayInstance = CTEPathway.get(params.id)
        if (!CTEPathwayInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'CTEPathway.label', default: 'CTEPathway'), params.id])}"
            redirect(action: "list")
        }
        else {
            [CTEPathwayInstance: CTEPathwayInstance]
        }
    }

    def edit = {
        def CTEPathwayInstance = CTEPathway.get(params.id)
        if (!CTEPathwayInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'CTEPathway.label', default: 'CTEPathway'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [CTEPathwayInstance: CTEPathwayInstance]
        }
    }

    def update = {
        def CTEPathwayInstance = CTEPathway.get(params.id)
        if (CTEPathwayInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (CTEPathwayInstance.version > version) {
                    
                    CTEPathwayInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'CTEPathway.label', default: 'CTEPathway')] as Object[], "Another user has updated this CTEPathway while you were editing")
                    render(view: "edit", model: [CTEPathwayInstance: CTEPathwayInstance])
                    return
                }
            }
            CTEPathwayInstance.properties = params
            if (!CTEPathwayInstance.hasErrors() && CTEPathwayInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'CTEPathway.label', default: 'CTEPathway'), CTEPathwayInstance.id])}"
                redirect(action: "show", id: CTEPathwayInstance.id)
            }
            else {
                render(view: "edit", model: [CTEPathwayInstance: CTEPathwayInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'CTEPathway.label', default: 'CTEPathway'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def CTEPathwayInstance = CTEPathway.get(params.id)
        if (CTEPathwayInstance) {
            try {
                CTEPathwayInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'CTEPathway.label', default: 'CTEPathway'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'CTEPathway.label', default: 'CTEPathway'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'CTEPathway.label', default: 'CTEPathway'), params.id])}"
            redirect(action: "list")
        }
    }
}
