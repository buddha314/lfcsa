
<%@ page import="org.lfcsa.calpads.ExitCategory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'exitCategory.label', default: 'ExitCategory')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'exitCategory.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="completion_status_cd" title="${message(code: 'exitCategory.completion_status_cd.label', default: 'Completionstatuscd')}" />
                        
                            <g:sortableColumn property="completion_status_nm" title="${message(code: 'exitCategory.completion_status_nm.label', default: 'Completionstatusnm')}" />
                        
                            <g:sortableColumn property="exit_category_cd" title="${message(code: 'exitCategory.exit_category_cd.label', default: 'Exitcategorycd')}" />
                        
                            <g:sortableColumn property="exit_category_nm" title="${message(code: 'exitCategory.exit_category_nm.label', default: 'Exitcategorynm')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${exitCategoryInstanceList}" status="i" var="exitCategoryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${exitCategoryInstance.id}">${fieldValue(bean: exitCategoryInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: exitCategoryInstance, field: "completion_status_cd")}</td>
                        
                            <td>${fieldValue(bean: exitCategoryInstance, field: "completion_status_nm")}</td>
                        
                            <td>${fieldValue(bean: exitCategoryInstance, field: "exit_category_cd")}</td>
                        
                            <td>${fieldValue(bean: exitCategoryInstance, field: "exit_category_nm")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${exitCategoryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
