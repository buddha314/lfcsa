import grails.util.GrailsUtil
import org.lfcsa.calpads.Person
import org.lfcsa.calpads.Role
import org.lfcsa.calpads.User

class BootStrap {

    def init = { servletContext ->
       switch(GrailsUtil.environment){
          case "development":
          def adrole = new Role(role:"administrator")
          def vdrole = new Role(role:"volunteer")
          def srole = new Role(role:"staff")
          /*
          adrole.save()
          vdrole.save()
          srole.save()
           */

        

          def kking = new User(login:"kking", password:"kking")
          kking.addToRoles(adrole)
          kking.save()

          def pkking = new Person(legal_name_first:"Kaitlin", legal_name_last:"King"
             , class:"administrator" ,user:kking)
          pkking.save()

          def bdolan = new User(login:"bdolan", password:";lkjfd", 
             , class:"administrator")
          bdolan.addToRoles(adrole)
          bdolan.addToRoles(vdrole)
          bdolan.addToRoles(srole)
          bdolan.save()

          def pbdolan = new Person(legal_name_first:"Brian", legal_name_last:"Dolan"
             , class:"administrator" , user:bdolan )
          pbdolan.save()

          def jdoe = new User(login:"guest", password:"welcome")
          jdoe.addToRoles(vdrole)
          jdoe.save()
          def pjdoe = new Person(legal_name_first:"Guest", legal_name_last:"Lobby"
             , legal_name_middle:"User", user:jdoe )
          pjdoe.save()

        
               
      break

      case "production":
      break
    }
    }
    def destroy = {
    }
}
