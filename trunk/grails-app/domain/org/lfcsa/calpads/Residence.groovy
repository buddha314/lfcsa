package org.lfcsa.calpads

class Residence {
   String residential_address_1
   String residential_address_city_nm
   String residential_address_state_province_cd = 'US-CA'
   String residential_address_zip_cd
   Boolean is_public = 't'
   
   static mapping = {
      table 'residence'
   }

   String toString() {
      "${residential_address_1}, ${residential_address_city_nm}, ${residential_address_state_province_cd} ${residential_address_zip_cd}"
   }
}
