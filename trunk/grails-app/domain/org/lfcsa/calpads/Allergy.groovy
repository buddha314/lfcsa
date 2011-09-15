package org.lfcsa.calpads

class Allergy {
   String description

   static mapping = {
      table 'allergy'
   }

   String toString() {
      "${description}"
   }
}
