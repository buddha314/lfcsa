

<%@ page import="org.lfcsa.calpads.AttendanceSheet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'attendanceSheet.label', default: 'AttendanceSheet')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="/header"/>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${attendanceSheetInstance}">
            <div class="errors">
                <g:renderErrors bean="${attendanceSheetInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="classDate"><g:message code="attendanceSheet.classDate.label" default="Class Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: attendanceSheetInstance, field: 'classDate', 'errors')}">
                                    <g:datePicker name="classDate" precision="day" value="${attendanceSheetInstance?.classDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="classroom"><g:message code="attendanceSheet.classroom.label" default="Classroom" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: attendanceSheetInstance, field: 'classroom', 'errors')}">
                                    <g:select name="classroom.id" from="${org.lfcsa.calpads.Classroom.list()}" optionKey="id" value="${attendanceSheetInstance?.classroom?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
