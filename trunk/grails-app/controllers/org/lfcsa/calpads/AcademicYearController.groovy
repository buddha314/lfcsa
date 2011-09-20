package org.lfcsa.calpads

class AcademicYearController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def beforeInterceptor = [action:this.&auth, 
      except:["login", "authenticate", "logout", "welcome"]] 
   
    def auth() {
      //if( !(("staff" in session?.userRoles) || ("administrator" in session?.userRoles))) {
      if( !("administrator" in session?.userRoles)) {
         def msg = "Current Roles: "
         session.userRoles.each {
            msg << "${it} "
         }
         //flash.message = "You must be an administrator to perform that task."
         flash.message = msg 
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
        [academicYearInstanceList: AcademicYear.list(params), academicYearInstanceTotal: AcademicYear.count()]
    }

    def create = {
        def academicYearInstance = new AcademicYear()
        academicYearInstance.properties = params
        return [academicYearInstance: academicYearInstance]
    }

    def save = {
        def academicYearInstance = new AcademicYear(params)
        if (academicYearInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'academicYear.label', default: 'AcademicYear'), academicYearInstance.id])}"
            redirect(action: "show", id: academicYearInstance.id)
        }
        else {
            render(view: "create", model: [academicYearInstance: academicYearInstance])
        }
    }

    def show = {
        def academicYearInstance = AcademicYear.get(params.id)
        if (!academicYearInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'academicYear.label', default: 'AcademicYear'), params.id])}"
            redirect(action: "list")
        }
        else {
            [academicYearInstance: academicYearInstance]
        }
    }

    def edit = {
        def academicYearInstance = AcademicYear.get(params.id)
        if (!academicYearInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'academicYear.label', default: 'AcademicYear'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [academicYearInstance: academicYearInstance]
        }
    }

    def update = {
        def academicYearInstance = AcademicYear.get(params.id)
        if (academicYearInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (academicYearInstance.version > version) {
                    
                    academicYearInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'academicYear.label', default: 'AcademicYear')] as Object[], "Another user has updated this AcademicYear while you were editing")
                    render(view: "edit", model: [academicYearInstance: academicYearInstance])
                    return
                }
            }
            academicYearInstance.properties = params
            if (!academicYearInstance.hasErrors() && academicYearInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'academicYear.label', default: 'AcademicYear'), academicYearInstance.id])}"
                redirect(action: "show", id: academicYearInstance.id)
            }
            else {
                render(view: "edit", model: [academicYearInstance: academicYearInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'academicYear.label', default: 'AcademicYear'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def academicYearInstance = AcademicYear.get(params.id)
        if (academicYearInstance) {
            try {
                academicYearInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'academicYear.label', default: 'AcademicYear'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'academicYear.label', default: 'AcademicYear'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'academicYear.label', default: 'AcademicYear'), params.id])}"
            redirect(action: "list")
        }
    }
}
