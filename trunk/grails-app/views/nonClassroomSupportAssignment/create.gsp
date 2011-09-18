

<%@ page import="org.lfcsa.calpads.NonClassroomSupportAssignment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'nonClassroomSupportAssignment.label', default: 'NonClassroomSupportAssignment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="/header"/>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${nonClassroomSupportAssignmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${nonClassroomSupportAssignmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="education_service_cd"><g:message code="nonClassroomSupportAssignment.education_service_cd.label" default="Educationservicecd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nonClassroomSupportAssignmentInstance, field: 'education_service_cd', 'errors')}">
                                    <g:textField name="education_service_cd" value="${nonClassroomSupportAssignmentInstance?.education_service_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="education_service_nm"><g:message code="nonClassroomSupportAssignment.education_service_nm.label" default="Educationservicenm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nonClassroomSupportAssignmentInstance, field: 'education_service_nm', 'errors')}">
                                    <g:textField name="education_service_nm" value="${nonClassroomSupportAssignmentInstance?.education_service_nm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="non_classroom_based_job_assignment_cd"><g:message code="nonClassroomSupportAssignment.non_classroom_based_job_assignment_cd.label" default="Nonclassroombasedjobassignmentcd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nonClassroomSupportAssignmentInstance, field: 'non_classroom_based_job_assignment_cd', 'errors')}">
                                    <g:textField name="non_classroom_based_job_assignment_cd" value="${nonClassroomSupportAssignmentInstance?.non_classroom_based_job_assignment_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="non_classroom_based_job_assignment_nm"><g:message code="nonClassroomSupportAssignment.non_classroom_based_job_assignment_nm.label" default="Nonclassroombasedjobassignmentnm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nonClassroomSupportAssignmentInstance, field: 'non_classroom_based_job_assignment_nm', 'errors')}">
                                    <g:textField name="non_classroom_based_job_assignment_nm" value="${nonClassroomSupportAssignmentInstance?.non_classroom_based_job_assignment_nm}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
