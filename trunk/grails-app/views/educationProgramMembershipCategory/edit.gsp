

<%@ page import="org.lfcsa.calpads.EducationProgramMembershipCategory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'educationProgramMembershipCategory.label', default: 'EducationProgramMembershipCategory')}" />
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
            <g:hasErrors bean="${educationProgramMembershipCategoryInstance}">
            <div class="errors">
                <g:renderErrors bean="${educationProgramMembershipCategoryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${educationProgramMembershipCategoryInstance?.id}" />
                <g:hiddenField name="version" value="${educationProgramMembershipCategoryInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="education_program_cd"><g:message code="educationProgramMembershipCategory.education_program_cd.label" default="Educationprogramcd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: educationProgramMembershipCategoryInstance, field: 'education_program_cd', 'errors')}">
                                    <g:textField name="education_program_cd" value="${educationProgramMembershipCategoryInstance?.education_program_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="education_program_nm"><g:message code="educationProgramMembershipCategory.education_program_nm.label" default="Educationprogramnm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: educationProgramMembershipCategoryInstance, field: 'education_program_nm', 'errors')}">
                                    <g:textField name="education_program_nm" value="${educationProgramMembershipCategoryInstance?.education_program_nm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="membership_category_cd"><g:message code="educationProgramMembershipCategory.membership_category_cd.label" default="Membershipcategorycd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: educationProgramMembershipCategoryInstance, field: 'membership_category_cd', 'errors')}">
                                    <g:textField name="membership_category_cd" value="${educationProgramMembershipCategoryInstance?.membership_category_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="membership_category_nm"><g:message code="educationProgramMembershipCategory.membership_category_nm.label" default="Membershipcategorynm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: educationProgramMembershipCategoryInstance, field: 'membership_category_nm', 'errors')}">
                                    <g:textField name="membership_category_nm" value="${educationProgramMembershipCategoryInstance?.membership_category_nm}" />
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
