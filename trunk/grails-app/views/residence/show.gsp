
<%@ page import="org.lfcsa.calpads.Residence" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'residence.label', default: 'Residence')}" />
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
                            <td valign="top" class="name"><g:message code="residence.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: residenceInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="residence.is_public.label" default="Ispublic" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${residenceInstance?.is_public}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="residence.residential_address_1.label" default="Residentialaddress1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: residenceInstance, field: "residential_address_1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="residence.residential_address_city_nm.label" default="Residentialaddresscitynm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: residenceInstance, field: "residential_address_city_nm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="residence.residential_address_state_province_cd.label" default="Residentialaddressstateprovincecd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: residenceInstance, field: "residential_address_state_province_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="residence.residential_address_zip_cd.label" default="Residentialaddresszipcd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: residenceInstance, field: "residential_address_zip_cd")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${residenceInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
