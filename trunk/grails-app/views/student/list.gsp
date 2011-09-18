
<%@ page import="org.lfcsa.calpads.Student" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'student.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="legal_name_last" title="${message(code: 'student.legal_name_last.label', default: 'Legalnamelast')}" />
                        
                            <g:sortableColumn property="legal_name_first" title="${message(code: 'student.legal_name_first.label', default: 'Legalnamefirst')}" />
                        
                            <g:sortableColumn property="legal_name_middle" title="${message(code: 'student.legal_name_middle.label', default: 'Legalnamemiddle')}" />
                        
                            <g:sortableColumn property="english_language_acquisition_start_dt" title="${message(code: 'student.english_language_acquisition_start_dt.label', default: 'Englishlanguageacquisitionstartdt')}" />
                        
                            <g:sortableColumn property="initial_us_school_dt" title="${message(code: 'student.initial_us_school_dt.label', default: 'Initialusschooldt')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${studentInstanceList}" status="i" var="studentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${studentInstance.id}">${fieldValue(bean: studentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: studentInstance, field: "legal_name_last")}</td>
                        
                            <td>${fieldValue(bean: studentInstance, field: "legal_name_first")}</td>
                        
                            <td>${fieldValue(bean: studentInstance, field: "legal_name_middle")}</td>
                        
                            <td><g:formatDate date="${studentInstance.english_language_acquisition_start_dt}" /></td>
                        
                            <td><g:formatDate date="${studentInstance.initial_us_school_dt}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${studentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
