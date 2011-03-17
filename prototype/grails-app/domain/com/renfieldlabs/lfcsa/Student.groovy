package com.renfieldlabs.lfcsa

class Student extends User {
   Classroom classroom
   String SSID
   String notes
   Date dateOfBirth
   String grade
   Boolean enrolled


   static belongsTo = [family:Family]

    static constraints = {
    }
}
