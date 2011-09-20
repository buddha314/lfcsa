
<%@ page import="org.lfcsa.calpads.Semester" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'semester.label', default: 'Semester')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="/header"/>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'semester.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="semester" title="${message(code: 'semester.semester.label', default: 'Semester')}" />
                        
                            <th><g:message code="semester.year.label" default="Year" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${semesterInstanceList}" status="i" var="semesterInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${semesterInstance.id}">${fieldValue(bean: semesterInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: semesterInstance, field: "semester")}</td>
                        
                            <td>${fieldValue(bean: semesterInstance, field: "year")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${semesterInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
