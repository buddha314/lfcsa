

<%@ page import="com.renfieldlabs.lfcsa.Volunteer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'volunteer.label', default: 'Volunteer')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
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
            <g:hasErrors bean="${volunteerInstance}">
            <div class="errors">
                <g:renderErrors bean="${volunteerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${volunteerInstance?.id}" />
                <g:hiddenField name="version" value="${volunteerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="skill"><g:message code="volunteer.skill.label" default="Skill" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: volunteerInstance, field: 'skill', 'errors')}">
                                    <g:select name="skill" from="${com.renfieldlabs.lfcsa.Skill.list()}" multiple="yes" optionKey="id" size="5" value="${volunteerInstance?.skill*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="user"><g:message code="volunteer.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: volunteerInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${com.renfieldlabs.lfcsa.User.list()}" optionKey="id" value="${volunteerInstance?.user?.id}"  />
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
