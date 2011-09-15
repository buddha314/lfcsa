package org.lfcsa.calpads

class EducationProgramMembershipCategoryController {

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
        [educationProgramMembershipCategoryInstanceList: EducationProgramMembershipCategory.list(params), educationProgramMembershipCategoryInstanceTotal: EducationProgramMembershipCategory.count()]
    }

    def create = {
        def educationProgramMembershipCategoryInstance = new EducationProgramMembershipCategory()
        educationProgramMembershipCategoryInstance.properties = params
        return [educationProgramMembershipCategoryInstance: educationProgramMembershipCategoryInstance]
    }

    def save = {
        def educationProgramMembershipCategoryInstance = new EducationProgramMembershipCategory(params)
        if (educationProgramMembershipCategoryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'educationProgramMembershipCategory.label', default: 'EducationProgramMembershipCategory'), educationProgramMembershipCategoryInstance.id])}"
            redirect(action: "show", id: educationProgramMembershipCategoryInstance.id)
        }
        else {
            render(view: "create", model: [educationProgramMembershipCategoryInstance: educationProgramMembershipCategoryInstance])
        }
    }

    def show = {
        def educationProgramMembershipCategoryInstance = EducationProgramMembershipCategory.get(params.id)
        if (!educationProgramMembershipCategoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'educationProgramMembershipCategory.label', default: 'EducationProgramMembershipCategory'), params.id])}"
            redirect(action: "list")
        }
        else {
            [educationProgramMembershipCategoryInstance: educationProgramMembershipCategoryInstance]
        }
    }

    def edit = {
        def educationProgramMembershipCategoryInstance = EducationProgramMembershipCategory.get(params.id)
        if (!educationProgramMembershipCategoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'educationProgramMembershipCategory.label', default: 'EducationProgramMembershipCategory'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [educationProgramMembershipCategoryInstance: educationProgramMembershipCategoryInstance]
        }
    }

    def update = {
        def educationProgramMembershipCategoryInstance = EducationProgramMembershipCategory.get(params.id)
        if (educationProgramMembershipCategoryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (educationProgramMembershipCategoryInstance.version > version) {
                    
                    educationProgramMembershipCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'educationProgramMembershipCategory.label', default: 'EducationProgramMembershipCategory')] as Object[], "Another user has updated this EducationProgramMembershipCategory while you were editing")
                    render(view: "edit", model: [educationProgramMembershipCategoryInstance: educationProgramMembershipCategoryInstance])
                    return
                }
            }
            educationProgramMembershipCategoryInstance.properties = params
            if (!educationProgramMembershipCategoryInstance.hasErrors() && educationProgramMembershipCategoryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'educationProgramMembershipCategory.label', default: 'EducationProgramMembershipCategory'), educationProgramMembershipCategoryInstance.id])}"
                redirect(action: "show", id: educationProgramMembershipCategoryInstance.id)
            }
            else {
                render(view: "edit", model: [educationProgramMembershipCategoryInstance: educationProgramMembershipCategoryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'educationProgramMembershipCategory.label', default: 'EducationProgramMembershipCategory'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def educationProgramMembershipCategoryInstance = EducationProgramMembershipCategory.get(params.id)
        if (educationProgramMembershipCategoryInstance) {
            try {
                educationProgramMembershipCategoryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'educationProgramMembershipCategory.label', default: 'EducationProgramMembershipCategory'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'educationProgramMembershipCategory.label', default: 'EducationProgramMembershipCategory'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'educationProgramMembershipCategory.label', default: 'EducationProgramMembershipCategory'), params.id])}"
            redirect(action: "list")
        }
    }
}
