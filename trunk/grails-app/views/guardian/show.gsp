
<%@ page import="org.lfcsa.calpads.Guardian" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'guardian.label', default: 'Guardian')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="guardian.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: guardianInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="guardian.alias_name_first.label" default="Aliasnamefirst" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: guardianInstance, field: "alias_name_first")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="guardian.alias_name_last.label" default="Aliasnamelast" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: guardianInstance, field: "alias_name_last")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="guardian.alias_name_middle.label" default="Aliasnamemiddle" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: guardianInstance, field: "alias_name_middle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="guardian.emails.label" default="Emails" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${guardianInstance.emails}" var="e">
                                    <li><g:link controller="emailAddress" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="guardian.family.label" default="Family" /></td>
                            
                            <td valign="top" class="value"><g:link controller="family" action="show" id="${guardianInstance?.family?.id}">${guardianInstance?.family?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="guardian.legal_name_first.label" default="Legalnamefirst" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: guardianInstance, field: "legal_name_first")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="guardian.legal_name_last.label" default="Legalnamelast" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: guardianInstance, field: "legal_name_last")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="guardian.legal_name_middle.label" default="Legalnamemiddle" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: guardianInstance, field: "legal_name_middle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="guardian.legal_name_suffix.label" default="Legalnamesuffix" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: guardianInstance, field: "legal_name_suffix")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="guardian.phones.label" default="Phones" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${guardianInstance.phones}" var="p">
                                    <li><g:link controller="phoneContact" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="guardian.roles.label" default="Roles" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${guardianInstance.roles}" var="r">
                                    <li><g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${guardianInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
