package org.lfcsa.calpads

class EducationProgramMembershipCategory {
   String education_program_cd 
   String education_program_nm
   String membership_category_cd 
   String membership_category_nm 
   
   static mapping = {
      table 'education_program_membership_category'
   }
}
