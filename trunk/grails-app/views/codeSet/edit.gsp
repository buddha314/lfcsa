

<%@ page import="org.lfcsa.calpads.CodeSet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'codeSet.label', default: 'CodeSet')}" />
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
            <g:hasErrors bean="${codeSetInstance}">
            <div class="errors">
                <g:renderErrors bean="${codeSetInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${codeSetInstance?.id}" />
                <g:hiddenField name="version" value="${codeSetInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="code_set_cd"><g:message code="codeSet.code_set_cd.label" default="Codesetcd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: codeSetInstance, field: 'code_set_cd', 'errors')}">
                                    <g:textField name="code_set_cd" value="${codeSetInstance?.code_set_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="code_set_nm"><g:message code="codeSet.code_set_nm.label" default="Codesetnm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: codeSetInstance, field: 'code_set_nm', 'errors')}">
                                    <g:textField name="code_set_nm" value="${codeSetInstance?.code_set_nm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="definition"><g:message code="codeSet.definition.label" default="Definition" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: codeSetInstance, field: 'definition', 'errors')}">
                                    <g:textField name="definition" value="${codeSetInstance?.definition}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="end_date"><g:message code="codeSet.end_date.label" default="Enddate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: codeSetInstance, field: 'end_date', 'errors')}">
                                    <g:datePicker name="end_date" precision="day" value="${codeSetInstance?.end_date}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="codeSet.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: codeSetInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${codeSetInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="start_date"><g:message code="codeSet.start_date.label" default="Startdate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: codeSetInstance, field: 'start_date', 'errors')}">
                                    <g:datePicker name="start_date" precision="day" value="${codeSetInstance?.start_date}"  />
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
