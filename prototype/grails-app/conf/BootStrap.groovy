import com.renfieldlabs.lfcsa.Family
import com.renfieldlabs.lfcsa.Parent
import com.renfieldlabs.lfcsa.Skill
import com.renfieldlabs.lfcsa.User
import com.renfieldlabs.lfcsa.WorkRequest


class BootStrap {

    def init = { servletContext ->
       if (!User.count()) {
          User bdolan = new User(userid:"bdolan", password:"brian", firstName:"Brian"
             , lastName:"Dolan", affiliation:"Administrator").save(failOnError:true)

          User jdolan = new User(userid:"jdolan", password:"jane", firstName:"Jane"
             , lastName:"Dolan", affiliation:"Parent").save(failOnError:true) 
          
         User cdolan = new User(userid:"cdolan", password:"connor", firstName:"Connor"
             , lastName:"Dolan", affiliation:"Student").save(failOnError:true)



          Family dolan = new Family(familyName:"dolan", streetAddress:"5110 Almanden"
            , city:"Highland Park", primaryPhone:"(323) 478-2676"
            , member:[bdolan, jdolan, cdolan]
            , notes:"Not much").save(failOnError:true)

          Skill carpenter = new Skill(name:'Carpenter', description:"Light construction of internal structures").save(failOnError:true)
          Skill dev = new Skill(name:'Software Developer', description:"Development of web applications").save(failOnError:true)


       }
    }

    def destroy = {
    }
}
