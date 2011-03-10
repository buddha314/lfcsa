package com.renfieldlabs.lfcsa

class Entry {
   String title
   String summary
   static belongsTo = [user:User]
   Date dateCreated
   Date lastUpdated

   static constraints = {
      title()
      summary(maxsize:1000)
      dateCreated()
      lastUpdated()
   }

   static mapping = {
      sort 'lastUpdated':'descending'
   }
}
