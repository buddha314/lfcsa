
<%@ page import="com.renfieldlabs.lfcsa.Volunteer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'volunteer.label', default: 'Volunteer')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'volunteer.id.label', default: 'Id')}" />
                        
                            <th><g:message code="volunteer.user.label" default="User" /></th>

                            <th>Skill</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${volunteerInstanceList}" status="i" var="volunteerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${volunteerInstance.id}">${fieldValue(bean: volunteerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: volunteerInstance, field: "user")}</td>
                        
                        </tr>
                        <g:each in="${volunteerInstance.skills}" status="j" var="skill">
                           <tr><td></td><td></td><td>${fieldValue(bean: skill, field:"name")}</td></tr>
                        </g:each>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${volunteerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
