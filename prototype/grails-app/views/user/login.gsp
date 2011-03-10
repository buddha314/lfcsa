
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Los Feliz Charter School for the Arts Community Login</title>
  </head>
  <body>
    <h1>How do you like this line?</h1>
    <div class="body">
       <h1>Login</h1>
       <g:if test="flash.message">
          <div class="message">${flash.message}</div>
       </g:if>
       <g:form action="auth" method="post">
          <div class="dialog">
             <table>
                <tr class="prop">
                   <td class="name">
                      <label for="login">Login:</label>
                   </td>
                   <td>
                      <input type="text" id="login" name="userid"/>
                   </td>
                </tr>

                <tr>
                   <td class="name">
                      <label for="password">Password:</label>
                   </td>
                   <td>
                      <input type="text" id="password" name="password"/>
                   </td>
                </tr>

             </table>
          </div>
          <div class="buttons">
             <span class="button">
                <input class="save" type="submit" value="Login"/>
             </span>
          </div>
       </g:form>
    </div>
  </body>
</html>
