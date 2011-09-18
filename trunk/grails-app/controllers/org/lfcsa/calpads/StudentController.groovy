package org.lfcsa.calpads

class StudentController {

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
        [studentInstanceList: Student.list(params), studentInstanceTotal: Student.count()]
    }

   def show_directory = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [studentInstanceList: Student.list(params), studentInstanceTotal: Student.count()]
    }
    
   
    def create = {
        def studentInstance = new Student()
        studentInstance.properties = params
        return [studentInstance: studentInstance]
    }

    def save = {
        def studentInstance = new Student(params)
        if (studentInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'student.label', default: 'Student'), studentInstance.id])}"
            redirect(action: "show", id: studentInstance.id)
        }
        else {
            render(view: "create", model: [studentInstance: studentInstance])
        }
    }

    def show = {
        def studentInstance = Student.get(params.id)
        if (!studentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'student.label', default: 'Student'), params.id])}"
            redirect(action: "list")
        }
        else {
            [studentInstance: studentInstance]
        }
    }

    def edit = {
        def studentInstance = Student.get(params.id)
        if (!studentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'student.label', default: 'Student'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [studentInstance: studentInstance]
        }
    }

    def update = {
        def studentInstance = Student.get(params.id)
        if (studentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (studentInstance.version > version) {
                    
                    studentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'student.label', default: 'Student')] as Object[], "Another user has updated this Student while you were editing")
                    render(view: "edit", model: [studentInstance: studentInstance])
                    return
                }
            }
            studentInstance.properties = params
            if (!studentInstance.hasErrors() && studentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'student.label', default: 'Student'), studentInstance.id])}"
                redirect(action: "show", id: studentInstance.id)
            }
            else {
                render(view: "edit", model: [studentInstance: studentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'student.label', default: 'Student'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def studentInstance = Student.get(params.id)
        if (studentInstance) {
            try {
                studentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'student.label', default: 'Student'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'student.label', default: 'Student'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'student.label', default: 'Student'), params.id])}"
            redirect(action: "list")
        }
    }
}
