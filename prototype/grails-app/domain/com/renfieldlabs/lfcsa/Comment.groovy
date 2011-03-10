package com.renfieldlabs.lfcsa

class Comment extends Entry {
   static belongsTo = [parent:Entry]

   static mapping = {
      sort 'lastUpdated':'descending'
   }
    static constraints = {
    }
}
