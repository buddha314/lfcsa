package com.renfieldlabs.lfcsa

class User {
   String firstName
   String lastName
   String userid
   String password
   String affiliation

   String toString() {
      userid
   }

   static constraints = {
      firstName()
      lastName()
      userid(unique:true)
      password()
      affiliation(inList:["Student", "Parent", "Volunteer", "Parent-Volunteer"
            , "Faculty", "Administrator", "Staff", "Emergency Contact"
            , "Applicant"])
   }
}
