
<%@ page import="org.lfcsa.calpads.CodeSet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'codeSet.label', default: 'CodeSet')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="/header"/>
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
                            <td valign="top" class="name"><g:message code="codeSet.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: codeSetInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="codeSet.code_set_cd.label" default="Codesetcd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: codeSetInstance, field: "code_set_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="codeSet.code_set_nm.label" default="Codesetnm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: codeSetInstance, field: "code_set_nm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="codeSet.definition.label" default="Definition" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: codeSetInstance, field: "definition")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="codeSet.end_date.label" default="Enddate" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${codeSetInstance?.end_date}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="codeSet.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: codeSetInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="codeSet.start_date.label" default="Startdate" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${codeSetInstance?.start_date}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${codeSetInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
