

<%@ page import="org.lfcsa.calpads.Classroom" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'classroom.label', default: 'Classroom')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="/header"/>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${classroomInstance}">
            <div class="errors">
                <g:renderErrors bean="${classroomInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${classroomInstance?.id}" />
                <g:hiddenField name="version" value="${classroomInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="grade"><g:message code="classroom.grade.label" default="Grade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: classroomInstance, field: 'grade', 'errors')}">
                                    <g:textField name="grade" value="${classroomInstance?.grade}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="classroom.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: classroomInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${classroomInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="room_number"><g:message code="classroom.room_number.label" default="Roomnumber" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: classroomInstance, field: 'room_number', 'errors')}">
                                    <g:textField name="room_number" value="${classroomInstance?.room_number}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="students"><g:message code="classroom.students.label" default="Students" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: classroomInstance, field: 'students', 'errors')}">
                                    <g:select name="students" from="${org.lfcsa.calpads.Student.list()}" multiple="yes" optionKey="id" size="5" value="${classroomInstance?.students*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="teacher"><g:message code="classroom.teacher.label" default="Teacher" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: classroomInstance, field: 'teacher', 'errors')}">
                                    <g:select name="teacher.id" from="${org.lfcsa.calpads.Teacher.list()}" optionKey="id" value="${classroomInstance?.teacher?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
