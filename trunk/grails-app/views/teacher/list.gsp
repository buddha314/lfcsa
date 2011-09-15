
<%@ page import="org.lfcsa.calpads.Teacher" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'teacher.label', default: 'Teacher')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'teacher.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="alias_name_first" title="${message(code: 'teacher.alias_name_first.label', default: 'Aliasnamefirst')}" />
                        
                            <g:sortableColumn property="alias_name_last" title="${message(code: 'teacher.alias_name_last.label', default: 'Aliasnamelast')}" />
                        
                            <g:sortableColumn property="alias_name_middle" title="${message(code: 'teacher.alias_name_middle.label', default: 'Aliasnamemiddle')}" />
                        
                            <g:sortableColumn property="legal_name_first" title="${message(code: 'teacher.legal_name_first.label', default: 'Legalnamefirst')}" />
                        
                            <g:sortableColumn property="legal_name_last" title="${message(code: 'teacher.legal_name_last.label', default: 'Legalnamelast')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${teacherInstanceList}" status="i" var="teacherInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${teacherInstance.id}">${fieldValue(bean: teacherInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: teacherInstance, field: "alias_name_first")}</td>
                        
                            <td>${fieldValue(bean: teacherInstance, field: "alias_name_last")}</td>
                        
                            <td>${fieldValue(bean: teacherInstance, field: "alias_name_middle")}</td>
                        
                            <td>${fieldValue(bean: teacherInstance, field: "legal_name_first")}</td>
                        
                            <td>${fieldValue(bean: teacherInstance, field: "legal_name_last")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${teacherInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
