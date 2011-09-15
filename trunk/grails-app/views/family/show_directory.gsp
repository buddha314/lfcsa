<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'family.label', default: 'Family')}" />
        <title><g:message code="default.show_directory.label" args="[entityName]" /></title>
    </head>
    <body>
       
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
           <h1><g:link class="list" action="list">LFCSA Family List (Access Controlled)</g:link> </h1>
        </div>
        <div class="body">
            <h1><g:message code="default.show_directory.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="show_directory">
               <table>
                  <thead>
                     <tr> 
                  <g:sortableColumn property="id" title="${message(code: 'family.id.label', default: 'Family Name / Address')}" /> 
                  <th><g:message code="family.students.label" default="Students" /></th> 
                  <g:sortableColumn property="name" title="${message(code: 'family.name.label', default: 'Guardians')}" /> 
                  </tr> 
                  </thead>
                  <tbody>
                     
                  <g:each in="${familyInstanceList}" status="i" var="familyInstance">
                     <g:if test="${familyInstance?.is_public}" >
                     <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td>
                           <ul>
                           <li><g:link action="show" id="${familyInstance.id}">${fieldValue(bean: familyInstance, field: "name")}</g:link>
                           <li><g:link action="show" id="${familyInstance.residence.id}">${fieldValue(bean: familyInstance, field: "residence")}</g:link>
                           </ul>
                        </td>
                  <td>
                  <g:each in="${familyInstance.students}" var="s">
                     <li><g:link controller="student" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                  </g:each> 
                  </td>
                  <td>
                  <g:each in="${familyInstance.guardians}" var="g">
                     <li><g:link controller="guardian" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
                     <g:each in="${g.phones}" var="p">
                        &nbsp&nbsp&nbsp P: <g:link controller="phoneContact" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link>
                     </g:each>
                     <g:each in="${g.emails}" var="e">
                        &nbsp&nbsp&nbsp E: <g:link controller="emailContact" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link>
                     </g:each>
                  </g:each>
                  </td>
                  </tr> </g:if>
                  </g:each>
                  </tbody>
               </table>
               <div class="paginateButtons">
                  <g:paginate total="${familyInstanceTotal}" />
               </div>
        </div>
   </body>
</html>
