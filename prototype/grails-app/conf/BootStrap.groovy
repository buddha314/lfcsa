import com.renfieldlabs.lfcsa.Comment
import com.renfieldlabs.lfcsa.Entry
import com.renfieldlabs.lfcsa.Family
import com.renfieldlabs.lfcsa.Parent
import com.renfieldlabs.lfcsa.Skill
import com.renfieldlabs.lfcsa.User
import com.renfieldlabs.lfcsa.WorkRequest
import com.renfieldlabs.lfcsa.Volunteer


class BootStrap {

    def init = { servletContext ->
       if (!User.count()) {

          User admin = new User(userid:"admin", password:"admin", firstName:"LFCSA"
             , lastName:"Adminstrator", affiliation:"Administrator").save(failOnError:true)

          User bdolan = new User(userid:"bdolan", password:"brian", firstName:"Brian"
             , lastName:"Dolan", affiliation:"Administrator").save(failOnError:true)

          User jdolan = new User(userid:"jdolan", password:"jane", firstName:"Jane"
             , lastName:"Dolan", affiliation:"Parent").save(failOnError:true)

          User cdolan = new User(userid:"cdolan", password:"connor", firstName:"Connor"
             , lastName:"Dolan", affiliation:"Student").save(failOnError:true)

          Family dolan = new Family(familyName:"dolan", streetAddress:"5110 Almanden"
            , city:"Highland Park", primaryPhone:"(323) 478-2676"
            , parents:[bdolan, jdolan]
            , students:[cdolan]
            , notes:"Not much").save(failOnError:true)

          Skill writer = new Skill(name:'Writer', description:"Writes stuff").save(failOnError:true)
          Skill carpenter = new Skill(name:'Carpenter', description:"Light construction of internal structures").save(failOnError:true)
          Skill dev = new Skill(name:'Software Developer', description:"Development of web applications").save(failOnError:true)
          Skill organizer = new Skill(name:'Organizer', description:"Puts things together").save(failOnError:true)

          Volunteer v1 = new Volunteer(user:bdolan, skills:[carpenter, dev]).save(failOnError:true)
          Volunteer v2 = new Volunteer(user:jdolan, skills:[writer, dev]).save(failOnError:true)
          Volunteer v3 = new Volunteer(user:admin, skills:[organizer]).save(failOnError:true)

          Entry e1 = new Entry(user:bdolan, title:"Need Student Database", summary:"Wish we had one").save(failOnError:true)
          Entry e2 = new Entry(user:jdolan, title:"Sushi?", summary:"Life is better with it").save(failOnError:true)

          Comment c1 = new Comment(user:jdolan, parent:e1, title:"That sounds like work", summary:"Do we have to?").save(failOnError:true)
          Comment c2 = new Comment(user:bdolan, parent:e1, title:"That sounds like work", summary:"Yes we do").save(failOnError:true)



       }
    }

    def destroy = {
    }
}
