package com.renfieldlabs.lfcsa

class SecureBaseController {
   def beforeInterceptor = [action:this.&auth, except:["index", "list", "show", "discombobulate", "login", "logout", "auth"]]

   def auth() {
      if(!session.user) {
         redirect(controller:"user", action:"login")
         return false
      }
   }
}
