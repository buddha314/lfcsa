package org.lfcsa.calpads

class AttendanceSheetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def beforeInterceptor = [action:this.&auth, 
      except:["login", "authenticate", "logout", "show_directory"]] 
   
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
        [attendanceSheetInstanceList: AttendanceSheet.list(params), attendanceSheetInstanceTotal: AttendanceSheet.count()]
    }

    def create = {
        def attendanceSheetInstance = new AttendanceSheet()
        attendanceSheetInstance.properties = params
        return [attendanceSheetInstance: attendanceSheetInstance]
    }

    def save = {
        def attendanceSheetInstance = new AttendanceSheet(params)
        if (attendanceSheetInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'attendanceSheet.label', default: 'AttendanceSheet'), attendanceSheetInstance.id])}"
            redirect(action: "show", id: attendanceSheetInstance.id)
        }
        else {
            render(view: "create", model: [attendanceSheetInstance: attendanceSheetInstance])
        }
    }

    def show = {
        def attendanceSheetInstance = AttendanceSheet.get(params.id)
        if (!attendanceSheetInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'attendanceSheet.label', default: 'AttendanceSheet'), params.id])}"
            redirect(action: "list")
        }
        else {
            [attendanceSheetInstance: attendanceSheetInstance]
        }
    }

    def edit = {
        def attendanceSheetInstance = AttendanceSheet.get(params.id)
        if (!attendanceSheetInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'attendanceSheet.label', default: 'AttendanceSheet'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [attendanceSheetInstance: attendanceSheetInstance]
        }
    }

    def update = {
        def attendanceSheetInstance = AttendanceSheet.get(params.id)
        if (attendanceSheetInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (attendanceSheetInstance.version > version) {
                    
                    attendanceSheetInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'attendanceSheet.label', default: 'AttendanceSheet')] as Object[], "Another user has updated this AttendanceSheet while you were editing")
                    render(view: "edit", model: [attendanceSheetInstance: attendanceSheetInstance])
                    return
                }
            }
            attendanceSheetInstance.properties = params
            if (!attendanceSheetInstance.hasErrors() && attendanceSheetInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'attendanceSheet.label', default: 'AttendanceSheet'), attendanceSheetInstance.id])}"
                redirect(action: "show", id: attendanceSheetInstance.id)
            }
            else {
                render(view: "edit", model: [attendanceSheetInstance: attendanceSheetInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'attendanceSheet.label', default: 'AttendanceSheet'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def attendanceSheetInstance = AttendanceSheet.get(params.id)
        if (attendanceSheetInstance) {
            try {
                attendanceSheetInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'attendanceSheet.label', default: 'AttendanceSheet'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'attendanceSheet.label', default: 'AttendanceSheet'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'attendanceSheet.label', default: 'AttendanceSheet'), params.id])}"
            redirect(action: "list")
        }
    }
}
