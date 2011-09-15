package org.lfcsa.calpads

//class Guardian extends Person {
class Guardian extends Person {
   /*
   String legal_name_first 
	String legal_name_middle
	String legal_name_last 
	String legal_name_suffix 
	String alias_name_first 
	String alias_name_middle
	String alias_name_last 
   static hasMany = [emails:EmailAddress, phones:PhoneContact, roles:Role]
    */
   Family family

   static mapping = {
      table 'guardian'
      discriminator 'guardian'
   } 
   
   String toString() {
      "${legal_name_last}, ${legal_name_first} ${legal_name_middle}"
   }
}
