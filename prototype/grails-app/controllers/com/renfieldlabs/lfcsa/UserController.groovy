package com.renfieldlabs.lfcsa

class UserController extends SecureBaseController {
   def scaffold = User

   def login = {}

   def auth = {
      def user = User.findByUseridAndPassword(params.userid, params.password)
      if (user) {
         session.user = user
         flash.message = "Hello ${user.firstName} ${user.lastName}!"
         redirect(controller:"user", action:"list")
      } else {
         flash.message = "Please log in ${params.userid}"
         redirect(action:"login")
      }
   }

   def logout = {
      flash.message = "Goodbye ${session.user.firstName}.  I miss you already"
      session.user = null
      redirect(controller:"user", action:"list")
   }
}
