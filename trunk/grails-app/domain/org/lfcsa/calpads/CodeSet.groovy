package org.lfcsa.calpads

class CodeSet {
   String code_set_nm
   String code_set_cd
   String name
   String definition
   Date start_date
   Date end_date
   
   static mapping = {
      table 'code_sets'
   }
}
