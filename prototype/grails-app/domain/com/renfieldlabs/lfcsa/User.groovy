package com.renfieldlabs.lfcsa

class User {
   String firstName
   String lastName
   String userid
   String password
   String affiliation

   String toString() {
      lastName + ", " + firstName
   }

    static mapping = {
      sort 'lastName':'ascending'
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
