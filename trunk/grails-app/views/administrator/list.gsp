
<%@ page import="org.lfcsa.calpads.Administrator" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'administrator.label', default: 'Administrator')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'administrator.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="legal_name_last" title="${message(code: 'administrator.legal_name_last.label', default: 'Legalnamelast')}" />
                        
                            <g:sortableColumn property="legal_name_first" title="${message(code: 'administrator.legal_name_first.label', default: 'Legalnamefirst')}" />
                        
                            <g:sortableColumn property="legal_name_middle" title="${message(code: 'administrator.legal_name_middle.label', default: 'Legalnamemiddle')}" />
                        
                            <g:sortableColumn property="alias_name_first" title="${message(code: 'administrator.alias_name_first.label', default: 'Aliasnamefirst')}" />
                        
                            <g:sortableColumn property="alias_name_last" title="${message(code: 'administrator.alias_name_last.label', default: 'Aliasnamelast')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${administratorInstanceList}" status="i" var="administratorInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${administratorInstance.id}">${fieldValue(bean: administratorInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: administratorInstance, field: "legal_name_last")}</td>
                        
                            <td>${fieldValue(bean: administratorInstance, field: "legal_name_first")}</td>
                        
                            <td>${fieldValue(bean: administratorInstance, field: "legal_name_middle")}</td>
                        
                            <td>${fieldValue(bean: administratorInstance, field: "alias_name_first")}</td>
                        
                            <td>${fieldValue(bean: administratorInstance, field: "alias_name_last")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${administratorInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
