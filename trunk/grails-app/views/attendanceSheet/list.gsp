
<%@ page import="org.lfcsa.calpads.AttendanceSheet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'attendanceSheet.label', default: 'AttendanceSheet')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'attendanceSheet.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="classDate" title="${message(code: 'attendanceSheet.classDate.label', default: 'Class Date')}" />
                        
                            <th><g:message code="attendanceSheet.classroom.label" default="Classroom" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${attendanceSheetInstanceList}" status="i" var="attendanceSheetInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${attendanceSheetInstance.id}">${fieldValue(bean: attendanceSheetInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${attendanceSheetInstance.classDate}" /></td>
                        
                            <td>${fieldValue(bean: attendanceSheetInstance, field: "classroom")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${attendanceSheetInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
