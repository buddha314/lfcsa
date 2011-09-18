
<%@ page import="org.lfcsa.calpads.CourseGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'courseGroup.label', default: 'CourseGroup')}" />
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
                            <td valign="top" class="name"><g:message code="courseGroup.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseGroupInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseGroup.content_area_category_cd.label" default="Contentareacategorycd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseGroupInstance, field: "content_area_category_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseGroup.content_area_category_nm.label" default="Contentareacategorynm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseGroupInstance, field: "content_area_category_nm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseGroup.grade_high.label" default="Gradehigh" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseGroupInstance, field: "grade_high")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseGroup.grade_low.label" default="Gradelow" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseGroupInstance, field: "grade_low")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseGroup.industry_sector_cd.label" default="Industrysectorcd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseGroupInstance, field: "industry_sector_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseGroup.industry_sector_nm.label" default="Industrysectornm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseGroupInstance, field: "industry_sector_nm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseGroup.nclb_core.label" default="Nclbcore" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseGroupInstance, field: "nclb_core")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseGroup.state_course_cd.label" default="Statecoursecd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseGroupInstance, field: "state_course_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseGroup.state_course_nm.label" default="Statecoursenm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseGroupInstance, field: "state_course_nm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseGroup.uc_csu_met_requirement_ind.label" default="Uccsumetrequirementind" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseGroupInstance, field: "uc_csu_met_requirement_ind")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${courseGroupInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
