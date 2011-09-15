<html>
  <head>
    <meta name="layout" content="main" />
    <title>Login</title>         
  </head>
  <body>
    <div class="body">
      <h1>Login</h1>
      <h2>Welcome to the Los Feliz Charter School for the Arts Central Database
         Platform</h2>
            <P>If you do not have a log in or do not have sufficient privileges
            , please contact an administrator
            for assistance.  Otherwise, feel free to log
            in as the Guest user.
            </P>
        <ul>
        <li>Administrators
        <ul>  
        <li> Kaitlin King, kking@losfelizarts.org
        <li> Brian Dolan, brian@discovix.com.  +1 (323) 485-8005
        </ul>
        <li> Guest Login
        <ul>
        <li>Login: guest
        <li>Password: welcome
        </ul>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:form action="authenticate" method="post" >
        <div class="dialog">
          <table>
            <tbody>            
              <tr class="prop">
                <td class="name">
                  <label for="login">Login:</label>
                </td>
                <td>
                  <input type="text" id="login" name="login"/>
                </td>
              </tr> 
          
              <tr class="prop">
                <td class="name">
                  <label for="password">Password:</label>
                </td>
                <td>
                  <input type="password" id="password" name="password"/>
                </td>
              </tr> 
            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button">
            <input class="save" type="submit" value="Login" />
          </span>
        </div>
      </g:form>
    </div>
  </body>
</html>