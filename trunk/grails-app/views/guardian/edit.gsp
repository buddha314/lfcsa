

<%@ page import="org.lfcsa.calpads.Guardian" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'guardian.label', default: 'Guardian')}" />
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
            <g:hasErrors bean="${guardianInstance}">
            <div class="errors">
                <g:renderErrors bean="${guardianInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${guardianInstance?.id}" />
                <g:hiddenField name="version" value="${guardianInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="alias_name_first"><g:message code="guardian.alias_name_first.label" default="Aliasnamefirst" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: guardianInstance, field: 'alias_name_first', 'errors')}">
                                    <g:textField name="alias_name_first" value="${guardianInstance?.alias_name_first}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="alias_name_last"><g:message code="guardian.alias_name_last.label" default="Aliasnamelast" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: guardianInstance, field: 'alias_name_last', 'errors')}">
                                    <g:textField name="alias_name_last" value="${guardianInstance?.alias_name_last}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="alias_name_middle"><g:message code="guardian.alias_name_middle.label" default="Aliasnamemiddle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: guardianInstance, field: 'alias_name_middle', 'errors')}">
                                    <g:textField name="alias_name_middle" value="${guardianInstance?.alias_name_middle}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="emails"><g:message code="guardian.emails.label" default="Emails" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: guardianInstance, field: 'emails', 'errors')}">
                                    <g:select name="emails" from="${org.lfcsa.calpads.EmailAddress.list()}" multiple="yes" optionKey="id" size="5" value="${guardianInstance?.emails*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="family"><g:message code="guardian.family.label" default="Family" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: guardianInstance, field: 'family', 'errors')}">
                                    <g:select name="family.id" from="${org.lfcsa.calpads.Family.list()}" optionKey="id" value="${guardianInstance?.family?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="legal_name_first"><g:message code="guardian.legal_name_first.label" default="Legalnamefirst" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: guardianInstance, field: 'legal_name_first', 'errors')}">
                                    <g:textField name="legal_name_first" value="${guardianInstance?.legal_name_first}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="legal_name_last"><g:message code="guardian.legal_name_last.label" default="Legalnamelast" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: guardianInstance, field: 'legal_name_last', 'errors')}">
                                    <g:textField name="legal_name_last" value="${guardianInstance?.legal_name_last}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="legal_name_middle"><g:message code="guardian.legal_name_middle.label" default="Legalnamemiddle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: guardianInstance, field: 'legal_name_middle', 'errors')}">
                                    <g:textField name="legal_name_middle" value="${guardianInstance?.legal_name_middle}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="legal_name_suffix"><g:message code="guardian.legal_name_suffix.label" default="Legalnamesuffix" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: guardianInstance, field: 'legal_name_suffix', 'errors')}">
                                    <g:textField name="legal_name_suffix" value="${guardianInstance?.legal_name_suffix}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phones"><g:message code="guardian.phones.label" default="Phones" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: guardianInstance, field: 'phones', 'errors')}">
                                    <g:select name="phones" from="${org.lfcsa.calpads.PhoneContact.list()}" multiple="yes" optionKey="id" size="5" value="${guardianInstance?.phones*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="roles"><g:message code="guardian.roles.label" default="Roles" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: guardianInstance, field: 'roles', 'errors')}">
                                    <g:select name="roles" from="${org.lfcsa.calpads.Role.list()}" multiple="yes" optionKey="id" size="5" value="${guardianInstance?.roles*.id}" />
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
