package com.renfieldlabs.lfcsa

class Parent {
   static belongsTo = [family:Family]
   String primaryPhone
   Boolean isPrimaryParent
   String streetAddress
   String city
   String zipCode
   User coParent

    static constraints = {
    }
}
