

<%@ page import="org.lfcsa.calpads.PhoneContact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'phoneContact.label', default: 'PhoneContact')}" />
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
            <g:hasErrors bean="${phoneContactInstance}">
            <div class="errors">
                <g:renderErrors bean="${phoneContactInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${phoneContactInstance?.id}" />
                <g:hiddenField name="version" value="${phoneContactInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="is_public"><g:message code="phoneContact.is_public.label" default="Ispublic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: phoneContactInstance, field: 'is_public', 'errors')}">
                                    <g:checkBox name="is_public" value="${phoneContactInstance?.is_public}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="is_valid"><g:message code="phoneContact.is_valid.label" default="Isvalid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: phoneContactInstance, field: 'is_valid', 'errors')}">
                                    <g:checkBox name="is_valid" value="${phoneContactInstance?.is_valid}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phone_note"><g:message code="phoneContact.phone_note.label" default="Phonenote" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: phoneContactInstance, field: 'phone_note', 'errors')}">
                                    <g:textField name="phone_note" value="${phoneContactInstance?.phone_note}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phone_number"><g:message code="phoneContact.phone_number.label" default="Phonenumber" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: phoneContactInstance, field: 'phone_number', 'errors')}">
                                    <g:textField name="phone_number" value="${phoneContactInstance?.phone_number}" />
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
