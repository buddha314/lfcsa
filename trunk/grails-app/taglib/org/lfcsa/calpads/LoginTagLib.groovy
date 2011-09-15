package org.lfcsa.calpads

class LoginTagLib {
   def authenticationService
   def loginControl = {

      if(session.user){
         /*
         List<Role> roleList = session.user.person.roles.toList()
         List<String> userRoleList = []

         def adrole = "administrator"
         roleList.each {
            userRoleList.add(it.role)
         }
         out << "<br> User Roles: "

         userRoleList.each {
            out << it << "  "
         }

         def adrole = "administrator"
         //if (adrole in session?.userRoles) {
         if ("administrator" in session?.userRoles) {
            out << "Administrator <br>"
         } else {
            out << "Just a guy! <br>"
         }
          */

         out << "Hello ${session.user.person} <br> " 
         session.userRoles.each {
            out << "${it} "
         }
         out << "<br>" << """[${link(action:"logout", controller:"user"){"Logout"}}]"""
      } else {
         out << """[${link(action:"login", controller:"user"){"Login"}}]"""      
      }
   }

}
