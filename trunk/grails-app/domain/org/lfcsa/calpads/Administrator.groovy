package org.lfcsa.calpads

class Administrator extends Person  {
   String title

   static mapping = {
      sort "legal_name_last"
      discriminator 'administrator'
   }
}
