package org.lfcsa.calpads

class CourseGroup {
   String state_course_cd 
   String state_course_nm 
   String industry_sector_cd 
   String industry_sector_nm 
   String content_area_category_cd 
   String content_area_category_nm 
	String grade_low 
	String grade_high 
	String uc_csu_met_requirement_ind 
	String nclb_core 

   static mapping = {
      table 'course_group'
   }
}
