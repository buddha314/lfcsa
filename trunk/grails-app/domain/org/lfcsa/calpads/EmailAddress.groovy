package org.lfcsa.calpads

class EmailAddress {
   String email
   String email_note
   Boolean is_valid = 't'
   Boolean is_public = 't'
   
   static constraints = {
   }

   static mapping = {
      table 'email_address'
      sort 'email'
   }

   String toString() {
      "${email}"
   }
}
