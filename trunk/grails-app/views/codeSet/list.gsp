
<%@ page import="org.lfcsa.calpads.CodeSet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'codeSet.label', default: 'CodeSet')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'codeSet.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="code_set_cd" title="${message(code: 'codeSet.code_set_cd.label', default: 'Codesetcd')}" />
                        
                            <g:sortableColumn property="code_set_nm" title="${message(code: 'codeSet.code_set_nm.label', default: 'Codesetnm')}" />
                        
                            <g:sortableColumn property="definition" title="${message(code: 'codeSet.definition.label', default: 'Definition')}" />
                        
                            <g:sortableColumn property="end_date" title="${message(code: 'codeSet.end_date.label', default: 'Enddate')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'codeSet.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${codeSetInstanceList}" status="i" var="codeSetInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${codeSetInstance.id}">${fieldValue(bean: codeSetInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: codeSetInstance, field: "code_set_cd")}</td>
                        
                            <td>${fieldValue(bean: codeSetInstance, field: "code_set_nm")}</td>
                        
                            <td>${fieldValue(bean: codeSetInstance, field: "definition")}</td>
                        
                            <td><g:formatDate date="${codeSetInstance.end_date}" /></td>
                        
                            <td>${fieldValue(bean: codeSetInstance, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${codeSetInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
