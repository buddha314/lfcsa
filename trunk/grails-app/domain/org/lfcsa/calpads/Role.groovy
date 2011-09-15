package org.lfcsa.calpads

class Role {
   String role
   
   static constraints = {
   //   role(inList:['teacher', 'student', 'volunteer', 'administrator'
   //      , 'guardian', 'user', 'authorized_pickup', 'grandparent'
   //      , 'babysitter', 'aunt_uncle'])
   }

   static mapping = {
      
      table 'role'
   }
   String toString() {
      "${role}"
   }
}
