package com.renfieldlabs.lfcsa

class Volunteer {
   static belongsTo = [user:User]
   static hasMany = [skills:Skill]

   static constraints = {
   }
   String toString() {
      user.toString()
   }
}
