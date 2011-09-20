
<%@ page import="org.lfcsa.calpads.ClassroomAssignment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'classroomAssignment.label', default: 'ClassroomAssignment')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'classroomAssignment.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="id" title="${message(code: 'classroomAssignment.classroom.label', default: 'Classroom')}" />

                        
                            <g:sortableColumn property="grade_level_cd" title="${message(code: 'classroomAssignment.grade_level_cd.label', default: 'Grade Level')}" />
                        
                            <th><g:message code="classroomAssignment.student.label" default="Student" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${classroomAssignmentInstanceList}" status="i" var="classroomAssignmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${classroomAssignmentInstance.id}">${fieldValue(bean: classroomAssignmentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: classroomAssignmentInstance, field: "classroom")}</td>
                        
                            <td>${fieldValue(bean: classroomAssignmentInstance, field: "grade_level_cd")}</td>
                        
                            <td>${fieldValue(bean: classroomAssignmentInstance, field: "student")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${classroomAssignmentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
