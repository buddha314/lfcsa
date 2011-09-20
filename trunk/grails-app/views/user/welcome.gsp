<html>
    <head>
        <title>LFCSA Database Access</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #pageBody {
            margin-left:280px;
            margin-right:20px;
        }
        </style>
    </head>
    <body>
       <g:render template="/header"/>
        <div id="nav"/>
            <div class="homePagePanel">
                <div class="panelTop"></div>
                <div class="panelBody">
                    <h1>Application Status</h1>
                    <ul>
                        <li>App version: <g:meta name="app.version"></g:meta></li>
                        <li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
                        <li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
                        <li>JVM version: ${System.getProperty('java.version')}</li>
                        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                        <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                        <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                    </ul>
                    <h1>Installed Plugins</h1>
                    <ul>
                        <g:set var="pluginManager"
                               value="${applicationContext.getBean('pluginManager')}"></g:set>

                        <g:each var="plugin" in="${pluginManager.allPlugins}">
                            <li>${plugin.name} - ${plugin.version}</li>
                        </g:each>

                    </ul>
                </div>
                <div class="panelBtm"></div>
            </div>
        </div>
        <div id="pageBody">
            <h1>Welcome to Los Feliz Charter School For the Arts Database</h1>
            <p>Howdy!  We are attempting to bring several data systems under one roof.  We appreciate your patience while we put it together, but we also want to hear your suggestions!</p>
            <P>For questions on this application and the data contained within it, please contact</P>
            <ul>
               <li>Kaitlin King: kking@losfelizarts.org</li>
               <li>Brian Dolan: brian@discovix.com, +1 (323) 485-8005</li>
            </ul>

            <div id="controllerList" class="dialog">
                <h2>Database Access</h2>
                <ul>
                   <li><h3>For Parents / Volunteers</h3></li>
                   <ul>
                      <li class="controller"><g:link controller="family" action="show_directory">Family Directory</g:link></li>
                      <li class="controller"><g:link controller="student" action="show_directory">Student Directory</g:link></li>
                   </ul>
                   <li><h3>For Administrators</h3></li>
                      <ul>
                         <li class="controller"><g:link controller="family" action="list">Family Listing</g:link></li>
                         <li class="controller"><g:link controller="student" action="list">Student Listing</g:link></li>
                         <li class="controller"><g:link controller="guardian" action="list">Guardians</g:link></li>
                         <li class="controller"><g:link controller="teacher" action="list">Teacher Listing</g:link></li>
                         <li class="controller"><g:link controller="administrator" action="list">Administrators</g:link></li>
                         <li class="controller"><g:link controller="person" action="list">All Contacts</g:link></li>
                         <ul>
                           <li class="controller"><g:link controller="phoneContact" action="list">Phone Numbers</g:link></li>
                           <li class="controller"><g:link controller="emailAddress" action="list">Email Addresses</g:link></li>
                           <li class="controller"><g:link controller="residence" action="list">Residences</g:link></li>
                           <li class="allergy"><g:link controller="allergy" action="list">Allergies</g:link></li>
                         </ul>
                      </ul>
                   <li><h3>For Teachers</h3></li>
                     <ul>
                         <li class="controller"><g:link controller="classroom" action="list">Classroom</g:link></li>
                         <li class="controller"><g:link controller="classroomAssignment" action="list">Classroom Assignments</g:link></li>
                         <li class="controller"><g:link controller="attendanceSheet" action="list">Attendance Sheets</g:link></li>
                     </ul>
                   <li><h3>Staff Information</h3></li>
                     <ul>
                         <li class="controller"><g:link controller="user" action="list">Users</g:link></li>
                         <li class="controller"><g:link controller="role" action="list">Roles</g:link></li>
                     </ul>
                   <li><h3>CALPADS Information</h3></li>
                     <ul>
                        <li class="controller"><g:link controller="CTEPathway" action="list">CTE Pathways</g:link></li> 
                        <li class="controller"><g:link controller="courseGroup" action="list">Course Groups</g:link></li> 
                        <li class="controller"><g:link controller="educationProgramMembershipCategory" action="list">Education Program Membership Categories</g:link></li> 
                        <li class="controller"><g:link controller="exitCategory" action="list">Exit Categories</g:link></li> 
                        <li class="controller"><g:link controller="exitReason" action="list">Exit Reasons</g:link></li> 
                        <li class="controller"><g:link controller="nonClassroomSupportContent" action="list">Non-Classroom Support Content</g:link></li> 
                        <li class="controller"><g:link controller="nonClassroomSupportAssignment" action="list">Non-Classroom Support Assignments</g:link></li> 
                        <li class="controller"><g:link controller="offense" action="list">Offenses</g:link></li> 
                        <li class="controller"><g:link controller="stateProvince" action="list">States / Provinces</g:link></li> 
                     </ul>
                   <!--
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                   -->
                </ul>
            </div>
        </div>
    </body>
</html>
