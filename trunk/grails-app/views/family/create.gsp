

<%@ page import="org.lfcsa.calpads.Family" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'family.label', default: 'Family')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${familyInstance}">
            <div class="errors">
                <g:renderErrors bean="${familyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="headOfHousehold"><g:message code="family.headOfHousehold.label" default="Head Of Household" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: familyInstance, field: 'headOfHousehold', 'errors')}">
                                    <g:select name="headOfHousehold.id" from="${org.lfcsa.calpads.Person.list()}" optionKey="id" value="${familyInstance?.headOfHousehold?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="is_public"><g:message code="family.is_public.label" default="Ispublic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: familyInstance, field: 'is_public', 'errors')}">
                                    <g:checkBox name="is_public" value="${familyInstance?.is_public}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="family.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: familyInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${familyInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="note"><g:message code="family.note.label" default="Note" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: familyInstance, field: 'note', 'errors')}">
                                    <g:textField name="note" value="${familyInstance?.note}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="residence"><g:message code="family.residence.label" default="Residence" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: familyInstance, field: 'residence', 'errors')}">
                                    <g:select name="residence.id" from="${org.lfcsa.calpads.Residence.list()}" optionKey="id" value="${familyInstance?.residence?.id}"  />
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
