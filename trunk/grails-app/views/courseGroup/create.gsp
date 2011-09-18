

<%@ page import="org.lfcsa.calpads.CourseGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'courseGroup.label', default: 'CourseGroup')}" />
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
            <g:hasErrors bean="${courseGroupInstance}">
            <div class="errors">
                <g:renderErrors bean="${courseGroupInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="content_area_category_cd"><g:message code="courseGroup.content_area_category_cd.label" default="Contentareacategorycd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseGroupInstance, field: 'content_area_category_cd', 'errors')}">
                                    <g:textField name="content_area_category_cd" value="${courseGroupInstance?.content_area_category_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="content_area_category_nm"><g:message code="courseGroup.content_area_category_nm.label" default="Contentareacategorynm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseGroupInstance, field: 'content_area_category_nm', 'errors')}">
                                    <g:textField name="content_area_category_nm" value="${courseGroupInstance?.content_area_category_nm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="grade_high"><g:message code="courseGroup.grade_high.label" default="Gradehigh" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseGroupInstance, field: 'grade_high', 'errors')}">
                                    <g:textField name="grade_high" value="${courseGroupInstance?.grade_high}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="grade_low"><g:message code="courseGroup.grade_low.label" default="Gradelow" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseGroupInstance, field: 'grade_low', 'errors')}">
                                    <g:textField name="grade_low" value="${courseGroupInstance?.grade_low}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="industry_sector_cd"><g:message code="courseGroup.industry_sector_cd.label" default="Industrysectorcd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseGroupInstance, field: 'industry_sector_cd', 'errors')}">
                                    <g:textField name="industry_sector_cd" value="${courseGroupInstance?.industry_sector_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="industry_sector_nm"><g:message code="courseGroup.industry_sector_nm.label" default="Industrysectornm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseGroupInstance, field: 'industry_sector_nm', 'errors')}">
                                    <g:textField name="industry_sector_nm" value="${courseGroupInstance?.industry_sector_nm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nclb_core"><g:message code="courseGroup.nclb_core.label" default="Nclbcore" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseGroupInstance, field: 'nclb_core', 'errors')}">
                                    <g:textField name="nclb_core" value="${courseGroupInstance?.nclb_core}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state_course_cd"><g:message code="courseGroup.state_course_cd.label" default="Statecoursecd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseGroupInstance, field: 'state_course_cd', 'errors')}">
                                    <g:textField name="state_course_cd" value="${courseGroupInstance?.state_course_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state_course_nm"><g:message code="courseGroup.state_course_nm.label" default="Statecoursenm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseGroupInstance, field: 'state_course_nm', 'errors')}">
                                    <g:textField name="state_course_nm" value="${courseGroupInstance?.state_course_nm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uc_csu_met_requirement_ind"><g:message code="courseGroup.uc_csu_met_requirement_ind.label" default="Uccsumetrequirementind" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseGroupInstance, field: 'uc_csu_met_requirement_ind', 'errors')}">
                                    <g:textField name="uc_csu_met_requirement_ind" value="${courseGroupInstance?.uc_csu_met_requirement_ind}" />
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
