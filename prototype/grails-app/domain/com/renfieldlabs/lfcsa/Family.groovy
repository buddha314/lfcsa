package com.renfieldlabs.lfcsa

class Family {
   String familyName
   String streetAddress
   String city
   String primaryPhone
   String notes

   static hasMany = [member:User]

   String toString() {
      familyName
   }

   static constraints = {
      familyName()
      streetAddress()
      city()
      primaryPhone()
      notes()
   }
}
