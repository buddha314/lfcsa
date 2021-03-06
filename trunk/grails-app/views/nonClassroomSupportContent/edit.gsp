

<%@ page import="org.lfcsa.calpads.NonClassroomSupportContent" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'nonClassroomSupportContent.label', default: 'NonClassroomSupportContent')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="/header"/>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${nonClassroomSupportContentInstance}">
            <div class="errors">
                <g:renderErrors bean="${nonClassroomSupportContentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${nonClassroomSupportContentInstance?.id}" />
                <g:hiddenField name="version" value="${nonClassroomSupportContentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="content_area_category_assignment_cd"><g:message code="nonClassroomSupportContent.content_area_category_assignment_cd.label" default="Contentareacategoryassignmentcd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nonClassroomSupportContentInstance, field: 'content_area_category_assignment_cd', 'errors')}">
                                    <g:textField name="content_area_category_assignment_cd" value="${nonClassroomSupportContentInstance?.content_area_category_assignment_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="content_area_category_assignment_nm"><g:message code="nonClassroomSupportContent.content_area_category_assignment_nm.label" default="Contentareacategoryassignmentnm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nonClassroomSupportContentInstance, field: 'content_area_category_assignment_nm', 'errors')}">
                                    <g:textField name="content_area_category_assignment_nm" value="${nonClassroomSupportContentInstance?.content_area_category_assignment_nm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="non_classroom_support_assignment_cd"><g:message code="nonClassroomSupportContent.non_classroom_support_assignment_cd.label" default="Nonclassroomsupportassignmentcd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nonClassroomSupportContentInstance, field: 'non_classroom_support_assignment_cd', 'errors')}">
                                    <g:textField name="non_classroom_support_assignment_cd" value="${nonClassroomSupportContentInstance?.non_classroom_support_assignment_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="non_classroom_support_assignment_nm"><g:message code="nonClassroomSupportContent.non_classroom_support_assignment_nm.label" default="Nonclassroomsupportassignmentnm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nonClassroomSupportContentInstance, field: 'non_classroom_support_assignment_nm', 'errors')}">
                                    <g:textField name="non_classroom_support_assignment_nm" value="${nonClassroomSupportContentInstance?.non_classroom_support_assignment_nm}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
