package org.lfcsa.calpads

class User {
   String login
   String password
   static belongsTo = [person:Person] 
   static hasMany = [roles:Role]
   
   static mapping = {
      table 'user'
      person lazy: false
   }
   static constraints = {
     login(unique:true)
   }

   String toString() {
      "${login}"
   }

}
