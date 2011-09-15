

<%@ page import="org.lfcsa.calpads.EmailAddress" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'emailAddress.label', default: 'EmailAddress')}" />
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
            <g:hasErrors bean="${emailAddressInstance}">
            <div class="errors">
                <g:renderErrors bean="${emailAddressInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="emailAddress.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: emailAddressInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${emailAddressInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email_note"><g:message code="emailAddress.email_note.label" default="Emailnote" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: emailAddressInstance, field: 'email_note', 'errors')}">
                                    <g:textField name="email_note" value="${emailAddressInstance?.email_note}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="is_public"><g:message code="emailAddress.is_public.label" default="Ispublic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: emailAddressInstance, field: 'is_public', 'errors')}">
                                    <g:checkBox name="is_public" value="${emailAddressInstance?.is_public}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="is_valid"><g:message code="emailAddress.is_valid.label" default="Isvalid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: emailAddressInstance, field: 'is_valid', 'errors')}">
                                    <g:checkBox name="is_valid" value="${emailAddressInstance?.is_valid}" />
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
