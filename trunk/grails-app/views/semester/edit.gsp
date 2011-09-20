

<%@ page import="org.lfcsa.calpads.Semester" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'semester.label', default: 'Semester')}" />
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
            <g:hasErrors bean="${semesterInstance}">
            <div class="errors">
                <g:renderErrors bean="${semesterInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${semesterInstance?.id}" />
                <g:hiddenField name="version" value="${semesterInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="classes"><g:message code="semester.classes.label" default="Classes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: semesterInstance, field: 'classes', 'errors')}">
                                    
<ul>
<g:each in="${semesterInstance?.classes?}" var="c">
    <li><g:link controller="classroom" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="classroom" action="create" params="['semester.id': semesterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'classroom.label', default: 'Classroom')])}</g:link>

                                </td>
                            </tr>
                        
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
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
