package org.lfcsa.calpads

class Person {
   
   String legal_name_first = ''
	String legal_name_middle = ''
	String legal_name_last = ''
	String legal_name_suffix = ''
	String alias_name_first = ''
	String alias_name_middle = ''
	String alias_name_last = ''
   User user = null
   List<Role> roles
   //List phones
   //List emails
   static hasMany = [emails:EmailAddress, phones:PhoneContact]
    
   
   static mapping = {
      table 'person'
      sort 'legal_name_last'
      discriminator column: [name:'access_class', length:50]
      roles cascade: "all-delete-orphan"
      roles lazy: false
   } 
   
   static constraints = {
      legal_name_last()
      legal_name_first()
      legal_name_middle(nullable:true)
      alias_name_first(nullable:true)
      alias_name_last(nullable:true)
      alias_name_middle(nullable:true)
      user(nullable:true)
      phones(nullable:true)
      emails(nullable:true)
   } 
   
   String toString() {
      "${legal_name_last}, ${legal_name_first} ${legal_name_middle}"
   }
}
