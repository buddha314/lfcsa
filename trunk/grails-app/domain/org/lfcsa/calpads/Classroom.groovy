package org.lfcsa.calpads

class Classroom {
   String name
   String grade
   String room_number
   static belongsTo = [teacher:Teacher]
   static hasMany = [students:Student]

   static mapping = {
      table 'classroom'
   }
}
