

<%@ page import="org.lfcsa.calpads.Residence" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'residence.label', default: 'Residence')}" />
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
            <g:hasErrors bean="${residenceInstance}">
            <div class="errors">
                <g:renderErrors bean="${residenceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${residenceInstance?.id}" />
                <g:hiddenField name="version" value="${residenceInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="is_public"><g:message code="residence.is_public.label" default="Ispublic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: residenceInstance, field: 'is_public', 'errors')}">
                                    <g:checkBox name="is_public" value="${residenceInstance?.is_public}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="residential_address_1"><g:message code="residence.residential_address_1.label" default="Residentialaddress1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: residenceInstance, field: 'residential_address_1', 'errors')}">
                                    <g:textField name="residential_address_1" value="${residenceInstance?.residential_address_1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="residential_address_city_nm"><g:message code="residence.residential_address_city_nm.label" default="Residentialaddresscitynm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: residenceInstance, field: 'residential_address_city_nm', 'errors')}">
                                    <g:textField name="residential_address_city_nm" value="${residenceInstance?.residential_address_city_nm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="residential_address_state_province_cd"><g:message code="residence.residential_address_state_province_cd.label" default="Residentialaddressstateprovincecd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: residenceInstance, field: 'residential_address_state_province_cd', 'errors')}">
                                    <g:textField name="residential_address_state_province_cd" value="${residenceInstance?.residential_address_state_province_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="residential_address_zip_cd"><g:message code="residence.residential_address_zip_cd.label" default="Residentialaddresszipcd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: residenceInstance, field: 'residential_address_zip_cd', 'errors')}">
                                    <g:textField name="residential_address_zip_cd" value="${residenceInstance?.residential_address_zip_cd}" />
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
