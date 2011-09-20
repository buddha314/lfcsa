package org.lfcsa.calpads

class Semester {

   String semester
   static belongsTo = [year:AcademicYear]
   static hasMany = [classes:Classroom] 
   
   String toString() {
      "${semester}"
   }

   static constraints = {
   }
}
