package com.renfieldlabs.lfcsa

class WorkOffer {
   String Description
   static belongsTo = [request:WorkRequest, volunteer:Volunteer]
   static hasMany = [skills:Skill]

   String toString()  {
      request.name
   }
    static constraints = {
    }
}
