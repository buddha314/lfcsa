
<%@ page import="org.lfcsa.calpads.Classroom" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'classroom.label', default: 'Classroom')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'classroom.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="grade" title="${message(code: 'classroom.grade.label', default: 'Grade')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'classroom.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="room_number" title="${message(code: 'classroom.room_number.label', default: 'Roomnumber')}" />
                        
                            <th><g:message code="classroom.teacher.label" default="Teacher" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${classroomInstanceList}" status="i" var="classroomInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${classroomInstance.id}">${fieldValue(bean: classroomInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: classroomInstance, field: "grade")}</td>
                        
                            <td>${fieldValue(bean: classroomInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: classroomInstance, field: "room_number")}</td>
                        
                            <td>${fieldValue(bean: classroomInstance, field: "teacher")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${classroomInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
