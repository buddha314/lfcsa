package org.lfcsa.calpads

class ExitReason {
   String exit_reason_cd
   String exit_reason_nm
   String grade_level_cd
   String grade_level_nm

   static mapping = {
      table 'exit_reason'
   }
}
