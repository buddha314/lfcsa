
<%@ page import="org.lfcsa.calpads.Offense" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'offense.label', default: 'Offense')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'offense.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="offense_category_federal_cd" title="${message(code: 'offense.offense_category_federal_cd.label', default: 'Offensecategoryfederalcd')}" />
                        
                            <g:sortableColumn property="offense_category_federal_nm" title="${message(code: 'offense.offense_category_federal_nm.label', default: 'Offensecategoryfederalnm')}" />
                        
                            <g:sortableColumn property="offense_cd" title="${message(code: 'offense.offense_cd.label', default: 'Offensecd')}" />
                        
                            <g:sortableColumn property="offense_nm" title="${message(code: 'offense.offense_nm.label', default: 'Offensenm')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${offenseInstanceList}" status="i" var="offenseInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${offenseInstance.id}">${fieldValue(bean: offenseInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: offenseInstance, field: "offense_category_federal_cd")}</td>
                        
                            <td>${fieldValue(bean: offenseInstance, field: "offense_category_federal_nm")}</td>
                        
                            <td>${fieldValue(bean: offenseInstance, field: "offense_cd")}</td>
                        
                            <td>${fieldValue(bean: offenseInstance, field: "offense_nm")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${offenseInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
