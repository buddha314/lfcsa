

<%@ page import="org.lfcsa.calpads.ClassroomAssignment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'classroomAssignment.label', default: 'ClassroomAssignment')}" />
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
            <g:hasErrors bean="${classroomAssignmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${classroomAssignmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${classroomAssignmentInstance?.id}" />
                <g:hiddenField name="version" value="${classroomAssignmentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="classroom"><g:message code="classroomAssignment.classroom.label" default="Classroom" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: classroomAssignmentInstance, field: 'classroom', 'errors')}">
                                    <g:select name="classroom.id" from="${org.lfcsa.calpads.Classroom.list()}" optionKey="id" value="${classroomAssignmentInstance?.classroom?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="grade_level_cd"><g:message code="classroomAssignment.grade_level_cd.label" default="Gradelevelcd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: classroomAssignmentInstance, field: 'grade_level_cd', 'errors')}">
                                    <g:textField name="grade_level_cd" value="${classroomAssignmentInstance?.grade_level_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="student"><g:message code="classroomAssignment.student.label" default="Student" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: classroomAssignmentInstance, field: 'student', 'errors')}">
                                    <g:select name="student.id" from="${org.lfcsa.calpads.Student.list()}" optionKey="id" value="${classroomAssignmentInstance?.student?.id}"  />
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
