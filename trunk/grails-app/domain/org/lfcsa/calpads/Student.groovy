package org.lfcsa.calpads

class Student extends Person {
   /*
	String legal_name_first 
	String legal_name_middle 
	String legal_name_last 
	String legal_name_suffix 
	String alias_name_first 
	String alias_name_middle 
	String alias_name_last 
    */
   String SSID
   String local_student_id
	Date dob 
	String gender 
	String birth_state_province_cd 
	String primary_language_cd 
	String hispanic_ind 
	String missing_ethnicity_ind 
	String race_1 
	String race_2
	String race_3
	String race_4
	String race_5
	String is_race_missing 
	String grade_level_cd 
	String primary_residence_category 
	String interdistrict_transfer_cd 
	String district_of_geographic_residence 
	String english_language_acquisition_status_cd 
	Date english_language_acquisition_start_dt 
	String proficient_or_ela_cd 
	String birth_country_special_circumstance_ind 
	Date initial_us_school_dt 
	String enrolled_less_than_three_years_ind
	String initial_ninth_grade_entry_year 
	String cte_pathway_cd 
	String cte_pathway_completer_ind 
   String parent_education_cd
   Residence residence 
   Family family
   Teacher teacher
   Boolean is_enrolled
   Boolean is_waitlisted
   Boolean media_release
   static hasMany = [allergies:Allergy]
   
   static mapping = {
      sort "legal_name_last"
      discriminator 'student'
   }

   static constraints = {
      legal_name_last()
      legal_name_first()
      legal_name_middle()
      english_language_acquisition_start_dt(nullable:true)
      initial_us_school_dt(nullable:true)
      race_1(nullable:true)
      race_2(nullable:true)
      race_3(nullable:true)
      race_4(nullable:true)
      race_5(nullable:true)
      teacher(nullable:true)
   } 
   
   String toString() {
      "${legal_name_last}, ${legal_name_first} ${legal_name_middle}"
   }

}
