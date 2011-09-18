

<%@ page import="org.lfcsa.calpads.ExitReason" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'exitReason.label', default: 'ExitReason')}" />
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
            <g:hasErrors bean="${exitReasonInstance}">
            <div class="errors">
                <g:renderErrors bean="${exitReasonInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exit_reason_cd"><g:message code="exitReason.exit_reason_cd.label" default="Exitreasoncd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: exitReasonInstance, field: 'exit_reason_cd', 'errors')}">
                                    <g:textField name="exit_reason_cd" value="${exitReasonInstance?.exit_reason_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exit_reason_nm"><g:message code="exitReason.exit_reason_nm.label" default="Exitreasonnm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: exitReasonInstance, field: 'exit_reason_nm', 'errors')}">
                                    <g:textField name="exit_reason_nm" value="${exitReasonInstance?.exit_reason_nm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="grade_level_cd"><g:message code="exitReason.grade_level_cd.label" default="Gradelevelcd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: exitReasonInstance, field: 'grade_level_cd', 'errors')}">
                                    <g:textField name="grade_level_cd" value="${exitReasonInstance?.grade_level_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="grade_level_nm"><g:message code="exitReason.grade_level_nm.label" default="Gradelevelnm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: exitReasonInstance, field: 'grade_level_nm', 'errors')}">
                                    <g:textField name="grade_level_nm" value="${exitReasonInstance?.grade_level_nm}" />
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
