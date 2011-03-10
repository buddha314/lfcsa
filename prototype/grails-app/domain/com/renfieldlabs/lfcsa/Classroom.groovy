package com.renfieldlabs.lfcsa

class Classroom {
   User teacher
   static hasMany = [student:Student]

    static constraints = {
    }
}
