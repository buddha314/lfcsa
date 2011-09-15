
<%@ page import="org.lfcsa.calpads.StateProvince" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'stateProvince.label', default: 'StateProvince')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'stateProvince.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="country_cd" title="${message(code: 'stateProvince.country_cd.label', default: 'Countrycd')}" />
                        
                            <g:sortableColumn property="country_nm" title="${message(code: 'stateProvince.country_nm.label', default: 'Countrynm')}" />
                        
                            <g:sortableColumn property="state_province_cd" title="${message(code: 'stateProvince.state_province_cd.label', default: 'Stateprovincecd')}" />
                        
                            <g:sortableColumn property="state_province_nm" title="${message(code: 'stateProvince.state_province_nm.label', default: 'Stateprovincenm')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${stateProvinceInstanceList}" status="i" var="stateProvinceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${stateProvinceInstance.id}">${fieldValue(bean: stateProvinceInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: stateProvinceInstance, field: "country_cd")}</td>
                        
                            <td>${fieldValue(bean: stateProvinceInstance, field: "country_nm")}</td>
                        
                            <td>${fieldValue(bean: stateProvinceInstance, field: "state_province_cd")}</td>
                        
                            <td>${fieldValue(bean: stateProvinceInstance, field: "state_province_nm")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${stateProvinceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
