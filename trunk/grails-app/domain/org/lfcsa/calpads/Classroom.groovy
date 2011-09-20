package org.lfcsa.calpads

class Classroom {
   String name
   String room_number
   Teacher teacher
   static belongsTo = [semester:Semester]

   static mapping = {
      table 'classroom'
   }

   String toString() {
      "${name}"
   }
}
