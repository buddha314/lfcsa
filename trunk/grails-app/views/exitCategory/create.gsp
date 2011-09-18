

<%@ page import="org.lfcsa.calpads.ExitCategory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'exitCategory.label', default: 'ExitCategory')}" />
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
            <g:hasErrors bean="${exitCategoryInstance}">
            <div class="errors">
                <g:renderErrors bean="${exitCategoryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="completion_status_cd"><g:message code="exitCategory.completion_status_cd.label" default="Completionstatuscd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: exitCategoryInstance, field: 'completion_status_cd', 'errors')}">
                                    <g:textField name="completion_status_cd" value="${exitCategoryInstance?.completion_status_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="completion_status_nm"><g:message code="exitCategory.completion_status_nm.label" default="Completionstatusnm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: exitCategoryInstance, field: 'completion_status_nm', 'errors')}">
                                    <g:textField name="completion_status_nm" value="${exitCategoryInstance?.completion_status_nm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exit_category_cd"><g:message code="exitCategory.exit_category_cd.label" default="Exitcategorycd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: exitCategoryInstance, field: 'exit_category_cd', 'errors')}">
                                    <g:textField name="exit_category_cd" value="${exitCategoryInstance?.exit_category_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exit_category_nm"><g:message code="exitCategory.exit_category_nm.label" default="Exitcategorynm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: exitCategoryInstance, field: 'exit_category_nm', 'errors')}">
                                    <g:textField name="exit_category_nm" value="${exitCategoryInstance?.exit_category_nm}" />
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
