
<%@ page import="org.lfcsa.calpads.NonClassroomSupportContent" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'nonClassroomSupportContent.label', default: 'NonClassroomSupportContent')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'nonClassroomSupportContent.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="content_area_category_assignment_cd" title="${message(code: 'nonClassroomSupportContent.content_area_category_assignment_cd.label', default: 'Contentareacategoryassignmentcd')}" />
                        
                            <g:sortableColumn property="content_area_category_assignment_nm" title="${message(code: 'nonClassroomSupportContent.content_area_category_assignment_nm.label', default: 'Contentareacategoryassignmentnm')}" />
                        
                            <g:sortableColumn property="non_classroom_support_assignment_cd" title="${message(code: 'nonClassroomSupportContent.non_classroom_support_assignment_cd.label', default: 'Nonclassroomsupportassignmentcd')}" />
                        
                            <g:sortableColumn property="non_classroom_support_assignment_nm" title="${message(code: 'nonClassroomSupportContent.non_classroom_support_assignment_nm.label', default: 'Nonclassroomsupportassignmentnm')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${nonClassroomSupportContentInstanceList}" status="i" var="nonClassroomSupportContentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${nonClassroomSupportContentInstance.id}">${fieldValue(bean: nonClassroomSupportContentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: nonClassroomSupportContentInstance, field: "content_area_category_assignment_cd")}</td>
                        
                            <td>${fieldValue(bean: nonClassroomSupportContentInstance, field: "content_area_category_assignment_nm")}</td>
                        
                            <td>${fieldValue(bean: nonClassroomSupportContentInstance, field: "non_classroom_support_assignment_cd")}</td>
                        
                            <td>${fieldValue(bean: nonClassroomSupportContentInstance, field: "non_classroom_support_assignment_nm")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${nonClassroomSupportContentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
