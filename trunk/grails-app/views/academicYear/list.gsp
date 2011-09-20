
<%@ page import="org.lfcsa.calpads.AcademicYear" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'academicYear.label', default: 'AcademicYear')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'academicYear.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'academicYear.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="endDate" title="${message(code: 'academicYear.endDate.label', default: 'End Date')}" />
                        
                            <g:sortableColumn property="startDate" title="${message(code: 'academicYear.startDate.label', default: 'Start Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${academicYearInstanceList}" status="i" var="academicYearInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${academicYearInstance.id}">${fieldValue(bean: academicYearInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: academicYearInstance, field: "description")}</td>
                        
                            <td><g:formatDate date="${academicYearInstance.endDate}" /></td>
                        
                            <td><g:formatDate date="${academicYearInstance.startDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${academicYearInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
