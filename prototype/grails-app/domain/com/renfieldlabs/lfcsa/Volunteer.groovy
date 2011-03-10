package com.renfieldlabs.lfcsa

class Volunteer extends User {
   static hasMany = [skill:Skill]
    static constraints = {

    }
}
