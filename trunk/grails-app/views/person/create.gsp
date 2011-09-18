

<%@ page import="org.lfcsa.calpads.Person" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
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
            <g:hasErrors bean="${personInstance}">
            <div class="errors">
                <g:renderErrors bean="${personInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="alias_name_first"><g:message code="person.alias_name_first.label" default="Aliasnamefirst" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'alias_name_first', 'errors')}">
                                    <g:textField name="alias_name_first" value="${personInstance?.alias_name_first}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="alias_name_last"><g:message code="person.alias_name_last.label" default="Aliasnamelast" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'alias_name_last', 'errors')}">
                                    <g:textField name="alias_name_last" value="${personInstance?.alias_name_last}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="alias_name_middle"><g:message code="person.alias_name_middle.label" default="Aliasnamemiddle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'alias_name_middle', 'errors')}">
                                    <g:textField name="alias_name_middle" value="${personInstance?.alias_name_middle}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="legal_name_first"><g:message code="person.legal_name_first.label" default="Legalnamefirst" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'legal_name_first', 'errors')}">
                                    <g:textField name="legal_name_first" value="${personInstance?.legal_name_first}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="legal_name_last"><g:message code="person.legal_name_last.label" default="Legalnamelast" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'legal_name_last', 'errors')}">
                                    <g:textField name="legal_name_last" value="${personInstance?.legal_name_last}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="legal_name_middle"><g:message code="person.legal_name_middle.label" default="Legalnamemiddle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'legal_name_middle', 'errors')}">
                                    <g:textField name="legal_name_middle" value="${personInstance?.legal_name_middle}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="legal_name_suffix"><g:message code="person.legal_name_suffix.label" default="Legalnamesuffix" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'legal_name_suffix', 'errors')}">
                                    <g:textField name="legal_name_suffix" value="${personInstance?.legal_name_suffix}" />
                                </td>
                            </tr>
                        
                            <!-- 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="person.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${org.lfcsa.calpads.User.list()}" optionKey="id" value="${personInstance?.user?.id}"  />
                                </td>
                            </tr>
                            -->
                        
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
