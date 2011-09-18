<%@ page import="org.lfcsa.calpads.Student" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

    </head>
    <body>
        <g:render template="/header"/>
        <h1><g:link class="list" action="list">LFCSA Student List (Access Controlled)</g:link> </h1>
        <h1>Student Directory</h1>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="show_directory">
               <table>
                  <thead>
                     <tr> 
                       <g:sortableColumn property="legal_name_last" title="${message(code: 'student.id.label', default: 'Student Name / Family')}" /> 
                       <g:sortableColumn property="legal_name_last" title="${message(code: 'student.id.label', default: 'Teacher')}" /> 
                     </tr>
                  </thead>

                  <g:each in="${studentInstanceList}" status="i" var="studentInstance">
                     <g:if test="${studentInstance?.family.is_public}" >
                     <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td>
                         <li><g:link action="show" id="${studentInstance.id}">${studentInstance?.encodeAsHTML()}</g:link>
                         <li><g:link controller="family" action="show" id="${studentInstance.family.id}">${studentInstance?.family?.encodeAsHTML()}</g:link>
                        </td>
                        <td>
                           <g:if test="${studentInstance?.teacher}" >
                             <g:link controller="teacher" action="show" id="${studentInstance.teacher.id}">${studentInstance?.teacher?.encodeAsHTML()}</g:link>
                           </g:if>
                        </td>
                     </tr>
                     </g:if>
                  </g:each>

  

                  
               </table>
            </div>


                  

                  <div class="paginateButtons">
                <g:paginate total="${studentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
