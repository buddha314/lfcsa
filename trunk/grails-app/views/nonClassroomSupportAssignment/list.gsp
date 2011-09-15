
<%@ page import="org.lfcsa.calpads.NonClassroomSupportAssignment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'nonClassroomSupportAssignment.label', default: 'NonClassroomSupportAssignment')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'nonClassroomSupportAssignment.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="education_service_cd" title="${message(code: 'nonClassroomSupportAssignment.education_service_cd.label', default: 'Educationservicecd')}" />
                        
                            <g:sortableColumn property="education_service_nm" title="${message(code: 'nonClassroomSupportAssignment.education_service_nm.label', default: 'Educationservicenm')}" />
                        
                            <g:sortableColumn property="non_classroom_based_job_assignment_cd" title="${message(code: 'nonClassroomSupportAssignment.non_classroom_based_job_assignment_cd.label', default: 'Nonclassroombasedjobassignmentcd')}" />
                        
                            <g:sortableColumn property="non_classroom_based_job_assignment_nm" title="${message(code: 'nonClassroomSupportAssignment.non_classroom_based_job_assignment_nm.label', default: 'Nonclassroombasedjobassignmentnm')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${nonClassroomSupportAssignmentInstanceList}" status="i" var="nonClassroomSupportAssignmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${nonClassroomSupportAssignmentInstance.id}">${fieldValue(bean: nonClassroomSupportAssignmentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: nonClassroomSupportAssignmentInstance, field: "education_service_cd")}</td>
                        
                            <td>${fieldValue(bean: nonClassroomSupportAssignmentInstance, field: "education_service_nm")}</td>
                        
                            <td>${fieldValue(bean: nonClassroomSupportAssignmentInstance, field: "non_classroom_based_job_assignment_cd")}</td>
                        
                            <td>${fieldValue(bean: nonClassroomSupportAssignmentInstance, field: "non_classroom_based_job_assignment_nm")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${nonClassroomSupportAssignmentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
