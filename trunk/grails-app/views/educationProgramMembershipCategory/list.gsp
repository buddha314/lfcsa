
<%@ page import="org.lfcsa.calpads.EducationProgramMembershipCategory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'educationProgramMembershipCategory.label', default: 'EducationProgramMembershipCategory')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'educationProgramMembershipCategory.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="education_program_cd" title="${message(code: 'educationProgramMembershipCategory.education_program_cd.label', default: 'Educationprogramcd')}" />
                        
                            <g:sortableColumn property="education_program_nm" title="${message(code: 'educationProgramMembershipCategory.education_program_nm.label', default: 'Educationprogramnm')}" />
                        
                            <g:sortableColumn property="membership_category_cd" title="${message(code: 'educationProgramMembershipCategory.membership_category_cd.label', default: 'Membershipcategorycd')}" />
                        
                            <g:sortableColumn property="membership_category_nm" title="${message(code: 'educationProgramMembershipCategory.membership_category_nm.label', default: 'Membershipcategorynm')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${educationProgramMembershipCategoryInstanceList}" status="i" var="educationProgramMembershipCategoryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${educationProgramMembershipCategoryInstance.id}">${fieldValue(bean: educationProgramMembershipCategoryInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: educationProgramMembershipCategoryInstance, field: "education_program_cd")}</td>
                        
                            <td>${fieldValue(bean: educationProgramMembershipCategoryInstance, field: "education_program_nm")}</td>
                        
                            <td>${fieldValue(bean: educationProgramMembershipCategoryInstance, field: "membership_category_cd")}</td>
                        
                            <td>${fieldValue(bean: educationProgramMembershipCategoryInstance, field: "membership_category_nm")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${educationProgramMembershipCategoryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
