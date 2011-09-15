package org.lfcsa.calpads

class PhoneContact {
   String phone_number
   String phone_note
   Boolean is_valid
   Boolean is_public 
   
   static mapping = {
      table 'phone_contact'
   }

   String toString() {
      "${phone_number}"
   }
}
