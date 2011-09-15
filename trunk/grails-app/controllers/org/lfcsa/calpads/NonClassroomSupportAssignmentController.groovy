package org.lfcsa.calpads

class NonClassroomSupportAssignmentController {

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
        [nonClassroomSupportAssignmentInstanceList: NonClassroomSupportAssignment.list(params), nonClassroomSupportAssignmentInstanceTotal: NonClassroomSupportAssignment.count()]
    }

    def create = {
        def nonClassroomSupportAssignmentInstance = new NonClassroomSupportAssignment()
        nonClassroomSupportAssignmentInstance.properties = params
        return [nonClassroomSupportAssignmentInstance: nonClassroomSupportAssignmentInstance]
    }

    def save = {
        def nonClassroomSupportAssignmentInstance = new NonClassroomSupportAssignment(params)
        if (nonClassroomSupportAssignmentInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'nonClassroomSupportAssignment.label', default: 'NonClassroomSupportAssignment'), nonClassroomSupportAssignmentInstance.id])}"
            redirect(action: "show", id: nonClassroomSupportAssignmentInstance.id)
        }
        else {
            render(view: "create", model: [nonClassroomSupportAssignmentInstance: nonClassroomSupportAssignmentInstance])
        }
    }

    def show = {
        def nonClassroomSupportAssignmentInstance = NonClassroomSupportAssignment.get(params.id)
        if (!nonClassroomSupportAssignmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'nonClassroomSupportAssignment.label', default: 'NonClassroomSupportAssignment'), params.id])}"
            redirect(action: "list")
        }
        else {
            [nonClassroomSupportAssignmentInstance: nonClassroomSupportAssignmentInstance]
        }
    }

    def edit = {
        def nonClassroomSupportAssignmentInstance = NonClassroomSupportAssignment.get(params.id)
        if (!nonClassroomSupportAssignmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'nonClassroomSupportAssignment.label', default: 'NonClassroomSupportAssignment'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [nonClassroomSupportAssignmentInstance: nonClassroomSupportAssignmentInstance]
        }
    }

    def update = {
        def nonClassroomSupportAssignmentInstance = NonClassroomSupportAssignment.get(params.id)
        if (nonClassroomSupportAssignmentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (nonClassroomSupportAssignmentInstance.version > version) {
                    
                    nonClassroomSupportAssignmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'nonClassroomSupportAssignment.label', default: 'NonClassroomSupportAssignment')] as Object[], "Another user has updated this NonClassroomSupportAssignment while you were editing")
                    render(view: "edit", model: [nonClassroomSupportAssignmentInstance: nonClassroomSupportAssignmentInstance])
                    return
                }
            }
            nonClassroomSupportAssignmentInstance.properties = params
            if (!nonClassroomSupportAssignmentInstance.hasErrors() && nonClassroomSupportAssignmentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'nonClassroomSupportAssignment.label', default: 'NonClassroomSupportAssignment'), nonClassroomSupportAssignmentInstance.id])}"
                redirect(action: "show", id: nonClassroomSupportAssignmentInstance.id)
            }
            else {
                render(view: "edit", model: [nonClassroomSupportAssignmentInstance: nonClassroomSupportAssignmentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'nonClassroomSupportAssignment.label', default: 'NonClassroomSupportAssignment'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def nonClassroomSupportAssignmentInstance = NonClassroomSupportAssignment.get(params.id)
        if (nonClassroomSupportAssignmentInstance) {
            try {
                nonClassroomSupportAssignmentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'nonClassroomSupportAssignment.label', default: 'NonClassroomSupportAssignment'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'nonClassroomSupportAssignment.label', default: 'NonClassroomSupportAssignment'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'nonClassroomSupportAssignment.label', default: 'NonClassroomSupportAssignment'), params.id])}"
            redirect(action: "list")
        }
    }
}
