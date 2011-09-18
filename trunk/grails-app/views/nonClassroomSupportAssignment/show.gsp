
<%@ page import="org.lfcsa.calpads.NonClassroomSupportAssignment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'nonClassroomSupportAssignment.label', default: 'NonClassroomSupportAssignment')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="/header"/>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="nonClassroomSupportAssignment.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: nonClassroomSupportAssignmentInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="nonClassroomSupportAssignment.education_service_cd.label" default="Educationservicecd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: nonClassroomSupportAssignmentInstance, field: "education_service_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="nonClassroomSupportAssignment.education_service_nm.label" default="Educationservicenm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: nonClassroomSupportAssignmentInstance, field: "education_service_nm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="nonClassroomSupportAssignment.non_classroom_based_job_assignment_cd.label" default="Nonclassroombasedjobassignmentcd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: nonClassroomSupportAssignmentInstance, field: "non_classroom_based_job_assignment_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="nonClassroomSupportAssignment.non_classroom_based_job_assignment_nm.label" default="Nonclassroombasedjobassignmentnm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: nonClassroomSupportAssignmentInstance, field: "non_classroom_based_job_assignment_nm")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${nonClassroomSupportAssignmentInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
