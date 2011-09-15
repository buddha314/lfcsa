package org.lfcsa.calpads

class ExitCategory {
   String exit_category_cd
   String exit_category_nm
   String completion_status_cd 
   String completion_status_nm 
   
   static mapping = {
      table 'exit_category'
   }
}
