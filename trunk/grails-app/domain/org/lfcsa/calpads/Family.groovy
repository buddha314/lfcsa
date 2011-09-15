package org.lfcsa.calpads

class Family {
   String name = 'blank'
   String note
   Person HeadOfHousehold
   static hasMany = [guardians:Guardian, students:Student, pickups:Person]
   Boolean is_public
   Residence residence

   static mapping = {
      table 'family'
   }

   String toString() {
      "${name}"
   }
}
