

<%@ page import="org.lfcsa.calpads.Offense" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'offense.label', default: 'Offense')}" />
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
            <g:hasErrors bean="${offenseInstance}">
            <div class="errors">
                <g:renderErrors bean="${offenseInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="offense_category_federal_cd"><g:message code="offense.offense_category_federal_cd.label" default="Offensecategoryfederalcd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: offenseInstance, field: 'offense_category_federal_cd', 'errors')}">
                                    <g:textField name="offense_category_federal_cd" value="${offenseInstance?.offense_category_federal_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="offense_category_federal_nm"><g:message code="offense.offense_category_federal_nm.label" default="Offensecategoryfederalnm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: offenseInstance, field: 'offense_category_federal_nm', 'errors')}">
                                    <g:textField name="offense_category_federal_nm" value="${offenseInstance?.offense_category_federal_nm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="offense_cd"><g:message code="offense.offense_cd.label" default="Offensecd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: offenseInstance, field: 'offense_cd', 'errors')}">
                                    <g:textField name="offense_cd" value="${offenseInstance?.offense_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="offense_nm"><g:message code="offense.offense_nm.label" default="Offensenm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: offenseInstance, field: 'offense_nm', 'errors')}">
                                    <g:textField name="offense_nm" value="${offenseInstance?.offense_nm}" />
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
