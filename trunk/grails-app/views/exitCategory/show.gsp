
<%@ page import="org.lfcsa.calpads.ExitCategory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'exitCategory.label', default: 'ExitCategory')}" />
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
                            <td valign="top" class="name"><g:message code="exitCategory.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: exitCategoryInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="exitCategory.completion_status_cd.label" default="Completionstatuscd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: exitCategoryInstance, field: "completion_status_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="exitCategory.completion_status_nm.label" default="Completionstatusnm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: exitCategoryInstance, field: "completion_status_nm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="exitCategory.exit_category_cd.label" default="Exitcategorycd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: exitCategoryInstance, field: "exit_category_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="exitCategory.exit_category_nm.label" default="Exitcategorynm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: exitCategoryInstance, field: "exit_category_nm")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${exitCategoryInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
