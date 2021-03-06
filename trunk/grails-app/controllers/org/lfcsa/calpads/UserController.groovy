package org.lfcsa.calpads

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "welcome", params: params)
    }

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

    def login = {}

    def authenticate = {
       def user = User.findByLoginAndPassword(params.login, params.password)
       //if(user){
       if(user != null){
          session.user = user
          flash.message = "Hello ${user.person}!"
          //List userRoleList = []
          List<String> userRoleList = []
          def upl
          if (user.roles != null) {
             upl = user.roles
          } else {
             upl = []
          }
          //user.person.roles.each {
          upl.each {
             userRoleList.add(new String("${it}"))
          }

          //def adrole = "administrator"
          //userRoleList.add(adrole)
          session["userRoles"] = userRoleList
          redirect(controller:"user", action:"welcome")      
          //redirect(controller:"user", action:"list", params: params)
       } else {
          flash.message = "Sorry, ${params.login}. Please try again."
          redirect(action:"login")
       }
    } 
    
    def logout = {
       flash.message = "Goodbye ${session.user.person}"
       session.user = null
       redirect(controller:"user", action:"welcome")      
    }  

    def welcome = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create = {
        def userInstance = new User()
        userInstance.properties = params
        return [userInstance: userInstance]
    }

    def save = {
        def userInstance = new User(params)
        if (userInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
            redirect(action: "show", id: userInstance.id)
        }
        else {
            render(view: "create", model: [userInstance: userInstance])
        }
    }

    def show = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userInstance: userInstance]
        }
    }

    def edit = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userInstance: userInstance]
        }
    }

    def update = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    
                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.properties = params
            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "edit", model: [userInstance: userInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            try {
                userInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }
}
