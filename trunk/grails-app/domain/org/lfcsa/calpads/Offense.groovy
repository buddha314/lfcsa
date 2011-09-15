package org.lfcsa.calpads

class Offense {
   String offense_cd 
   String offense_nm 
   String offense_category_federal_cd 
   String offense_category_federal_nm 

   static mapping = {
      table 'offense'
   }
}
