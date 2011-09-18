package org.lfcsa.calpads

class StateProvince {
   String state_province_cd
   String state_province_nm
   String country_cd
   String country_nm

   static mapping = {
      table 'state_province'
   }
}
