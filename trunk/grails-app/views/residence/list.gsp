
<%@ page import="org.lfcsa.calpads.Residence" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'residence.label', default: 'Residence')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="/header"/>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'residence.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="is_public" title="${message(code: 'residence.is_public.label', default: 'Ispublic')}" />
                        
                            <g:sortableColumn property="residential_address_1" title="${message(code: 'residence.residential_address_1.label', default: 'Residentialaddress1')}" />
                        
                            <g:sortableColumn property="residential_address_city_nm" title="${message(code: 'residence.residential_address_city_nm.label', default: 'Residentialaddresscitynm')}" />
                        
                            <g:sortableColumn property="residential_address_state_province_cd" title="${message(code: 'residence.residential_address_state_province_cd.label', default: 'Residentialaddressstateprovincecd')}" />
                        
                            <g:sortableColumn property="residential_address_zip_cd" title="${message(code: 'residence.residential_address_zip_cd.label', default: 'Residentialaddresszipcd')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${residenceInstanceList}" status="i" var="residenceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${residenceInstance.id}">${fieldValue(bean: residenceInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatBoolean boolean="${residenceInstance.is_public}" /></td>
                        
                            <td>${fieldValue(bean: residenceInstance, field: "residential_address_1")}</td>
                        
                            <td>${fieldValue(bean: residenceInstance, field: "residential_address_city_nm")}</td>
                        
                            <td>${fieldValue(bean: residenceInstance, field: "residential_address_state_province_cd")}</td>
                        
                            <td>${fieldValue(bean: residenceInstance, field: "residential_address_zip_cd")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${residenceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
