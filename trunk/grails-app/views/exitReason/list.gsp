
<%@ page import="org.lfcsa.calpads.ExitReason" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'exitReason.label', default: 'ExitReason')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'exitReason.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="exit_reason_cd" title="${message(code: 'exitReason.exit_reason_cd.label', default: 'Exitreasoncd')}" />
                        
                            <g:sortableColumn property="exit_reason_nm" title="${message(code: 'exitReason.exit_reason_nm.label', default: 'Exitreasonnm')}" />
                        
                            <g:sortableColumn property="grade_level_cd" title="${message(code: 'exitReason.grade_level_cd.label', default: 'Gradelevelcd')}" />
                        
                            <g:sortableColumn property="grade_level_nm" title="${message(code: 'exitReason.grade_level_nm.label', default: 'Gradelevelnm')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${exitReasonInstanceList}" status="i" var="exitReasonInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${exitReasonInstance.id}">${fieldValue(bean: exitReasonInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: exitReasonInstance, field: "exit_reason_cd")}</td>
                        
                            <td>${fieldValue(bean: exitReasonInstance, field: "exit_reason_nm")}</td>
                        
                            <td>${fieldValue(bean: exitReasonInstance, field: "grade_level_cd")}</td>
                        
                            <td>${fieldValue(bean: exitReasonInstance, field: "grade_level_nm")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${exitReasonInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
