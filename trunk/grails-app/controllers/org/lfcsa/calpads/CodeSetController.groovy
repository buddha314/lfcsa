package org.lfcsa.calpads

class CodeSetController {

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
        [codeSetInstanceList: CodeSet.list(params), codeSetInstanceTotal: CodeSet.count()]
    }

    def create = {
        def codeSetInstance = new CodeSet()
        codeSetInstance.properties = params
        return [codeSetInstance: codeSetInstance]
    }

    def save = {
        def codeSetInstance = new CodeSet(params)
        if (codeSetInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'codeSet.label', default: 'CodeSet'), codeSetInstance.id])}"
            redirect(action: "show", id: codeSetInstance.id)
        }
        else {
            render(view: "create", model: [codeSetInstance: codeSetInstance])
        }
    }

    def show = {
        def codeSetInstance = CodeSet.get(params.id)
        if (!codeSetInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'codeSet.label', default: 'CodeSet'), params.id])}"
            redirect(action: "list")
        }
        else {
            [codeSetInstance: codeSetInstance]
        }
    }

    def edit = {
        def codeSetInstance = CodeSet.get(params.id)
        if (!codeSetInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'codeSet.label', default: 'CodeSet'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [codeSetInstance: codeSetInstance]
        }
    }

    def update = {
        def codeSetInstance = CodeSet.get(params.id)
        if (codeSetInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (codeSetInstance.version > version) {
                    
                    codeSetInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'codeSet.label', default: 'CodeSet')] as Object[], "Another user has updated this CodeSet while you were editing")
                    render(view: "edit", model: [codeSetInstance: codeSetInstance])
                    return
                }
            }
            codeSetInstance.properties = params
            if (!codeSetInstance.hasErrors() && codeSetInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'codeSet.label', default: 'CodeSet'), codeSetInstance.id])}"
                redirect(action: "show", id: codeSetInstance.id)
            }
            else {
                render(view: "edit", model: [codeSetInstance: codeSetInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'codeSet.label', default: 'CodeSet'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def codeSetInstance = CodeSet.get(params.id)
        if (codeSetInstance) {
            try {
                codeSetInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'codeSet.label', default: 'CodeSet'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'codeSet.label', default: 'CodeSet'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'codeSet.label', default: 'CodeSet'), params.id])}"
            redirect(action: "list")
        }
    }
}
