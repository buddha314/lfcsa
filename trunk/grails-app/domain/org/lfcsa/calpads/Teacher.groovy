package org.lfcsa.calpads

class Teacher extends Person {
   String prefix
   
   static mapping = {
      table 'teacher'
      discriminator 'teacher'
   }
}
