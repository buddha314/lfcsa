package com.renfieldlabs.lfcsa

class WorkRequest  {
   String name
   String description
   Date datePosted
   Date startDate
   Date endDate
   Boolean complete = false
   Set requirements
   static hasMany = [requirements:Skill]


    static constraints = {
    }
}
