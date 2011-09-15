package org.lfcsa.calpads

class AttendanceSheet {
   Date ClassDate
   static hasMany = [students:Student]
   static belongsTo = [classroom:Classroom]
   
   static mapping = {
      table 'attendance_sheet'
   }
    static constraints = {
    }
}
