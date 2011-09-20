

<%@ page import="org.lfcsa.calpads.Semester" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'semester.label', default: 'Semester')}" />
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
            <g:hasErrors bean="${semesterInstance}">
            <div class="errors">
                <g:renderErrors bean="${semesterInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="semester"><g:message code="semester.semester.label" default="Semester" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: semesterInstance, field: 'semester', 'errors')}">
                                    <g:textField name="semester" value="${semesterInstance?.semester}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="year"><g:message code="semester.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: semesterInstance, field: 'year', 'errors')}">
                                    <g:select name="year.id" from="${org.lfcsa.calpads.AcademicYear.list()}" optionKey="id" value="${semesterInstance?.year?.id}"  />
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
