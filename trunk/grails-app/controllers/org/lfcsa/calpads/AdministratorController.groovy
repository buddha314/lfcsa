package org.lfcsa.calpads

class AdministratorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [administratorInstanceList: Administrator.list(params), administratorInstanceTotal: Administrator.count()]
    }

    def create = {
        def administratorInstance = new Administrator()
        administratorInstance.properties = params
        return [administratorInstance: administratorInstance]
    }

    def save = {
        def administratorInstance = new Administrator(params)
        if (administratorInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'administrator.label', default: 'Administrator'), administratorInstance.id])}"
            redirect(action: "show", id: administratorInstance.id)
        }
        else {
            render(view: "create", model: [administratorInstance: administratorInstance])
        }
    }

    def show = {
        def administratorInstance = Administrator.get(params.id)
        if (!administratorInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrator.label', default: 'Administrator'), params.id])}"
            redirect(action: "list")
        }
        else {
            [administratorInstance: administratorInstance]
        }
    }

    def edit = {
        def administratorInstance = Administrator.get(params.id)
        if (!administratorInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrator.label', default: 'Administrator'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [administratorInstance: administratorInstance]
        }
    }

    def update = {
        def administratorInstance = Administrator.get(params.id)
        if (administratorInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (administratorInstance.version > version) {
                    
                    administratorInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'administrator.label', default: 'Administrator')] as Object[], "Another user has updated this Administrator while you were editing")
                    render(view: "edit", model: [administratorInstance: administratorInstance])
                    return
                }
            }
            administratorInstance.properties = params
            if (!administratorInstance.hasErrors() && administratorInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'administrator.label', default: 'Administrator'), administratorInstance.id])}"
                redirect(action: "show", id: administratorInstance.id)
            }
            else {
                render(view: "edit", model: [administratorInstance: administratorInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrator.label', default: 'Administrator'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def administratorInstance = Administrator.get(params.id)
        if (administratorInstance) {
            try {
                administratorInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'administrator.label', default: 'Administrator'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'administrator.label', default: 'Administrator'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrator.label', default: 'Administrator'), params.id])}"
            redirect(action: "list")
        }
    }
}
