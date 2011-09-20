package org.lfcsa.calpads

class ClassroomAssignment {
   Student student
   String grade_level_cd
   static belongsTo = [classroom:Classroom]

   String toString() {
      "${classroom} ${student}"
   }
}
