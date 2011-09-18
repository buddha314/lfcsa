
<%@ page import="org.lfcsa.calpads.Person" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'person.id.label', default: 'Id')}" />
                        
                            <!--
                            <g:sortableColumn property="alias_name_first" title="${message(code: 'person.alias_name_first.label', default: 'Aliasnamefirst')}" />
                        
                            <g:sortableColumn property="alias_name_last" title="${message(code: 'person.alias_name_last.label', default: 'Aliasnamelast')}" />
                        
                            <g:sortableColumn property="alias_name_middle" title="${message(code: 'person.alias_name_middle.label', default: 'Aliasnamemiddle')}" />
                        
                            <g:sortableColumn property="legal_name_first" title="${message(code: 'person.legal_name_first.label', default: 'Legalnamefirst')}" />
                            -->
                        
                            <g:sortableColumn property="legal_name_last" title="${message(code: 'person.legal_name_last.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personInstanceList}" status="i" var="personInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "id")}</g:link></td>
                        
                           <!--
                            <td>${fieldValue(bean: personInstance, field: "alias_name_first")}</td>
                        
                            <td>${fieldValue(bean: personInstance, field: "alias_name_last")}</td>
                        
                            <td>${fieldValue(bean: personInstance, field: "alias_name_middle")}</td>
                        
                            <td>${fieldValue(bean: personInstance, field: "legal_name_first")}</td>
                           --> 
                            <td><g:link action="show" id="${personInstance.id}">${personInstance?.encodeAsHTML()}</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
