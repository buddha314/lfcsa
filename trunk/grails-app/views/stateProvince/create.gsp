

<%@ page import="org.lfcsa.calpads.StateProvince" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'stateProvince.label', default: 'StateProvince')}" />
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
            <g:hasErrors bean="${stateProvinceInstance}">
            <div class="errors">
                <g:renderErrors bean="${stateProvinceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="country_cd"><g:message code="stateProvince.country_cd.label" default="Countrycd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateProvinceInstance, field: 'country_cd', 'errors')}">
                                    <g:textField name="country_cd" value="${stateProvinceInstance?.country_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="country_nm"><g:message code="stateProvince.country_nm.label" default="Countrynm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateProvinceInstance, field: 'country_nm', 'errors')}">
                                    <g:textField name="country_nm" value="${stateProvinceInstance?.country_nm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state_province_cd"><g:message code="stateProvince.state_province_cd.label" default="Stateprovincecd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateProvinceInstance, field: 'state_province_cd', 'errors')}">
                                    <g:textField name="state_province_cd" value="${stateProvinceInstance?.state_province_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state_province_nm"><g:message code="stateProvince.state_province_nm.label" default="Stateprovincenm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateProvinceInstance, field: 'state_province_nm', 'errors')}">
                                    <g:textField name="state_province_nm" value="${stateProvinceInstance?.state_province_nm}" />
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
