
<%@ page import="org.lfcsa.calpads.CourseGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'courseGroup.label', default: 'CourseGroup')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'courseGroup.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="content_area_category_cd" title="${message(code: 'courseGroup.content_area_category_cd.label', default: 'Contentareacategorycd')}" />
                        
                            <g:sortableColumn property="content_area_category_nm" title="${message(code: 'courseGroup.content_area_category_nm.label', default: 'Contentareacategorynm')}" />
                        
                            <g:sortableColumn property="grade_high" title="${message(code: 'courseGroup.grade_high.label', default: 'Gradehigh')}" />
                        
                            <g:sortableColumn property="grade_low" title="${message(code: 'courseGroup.grade_low.label', default: 'Gradelow')}" />
                        
                            <g:sortableColumn property="industry_sector_cd" title="${message(code: 'courseGroup.industry_sector_cd.label', default: 'Industrysectorcd')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${courseGroupInstanceList}" status="i" var="courseGroupInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${courseGroupInstance.id}">${fieldValue(bean: courseGroupInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: courseGroupInstance, field: "content_area_category_cd")}</td>
                        
                            <td>${fieldValue(bean: courseGroupInstance, field: "content_area_category_nm")}</td>
                        
                            <td>${fieldValue(bean: courseGroupInstance, field: "grade_high")}</td>
                        
                            <td>${fieldValue(bean: courseGroupInstance, field: "grade_low")}</td>
                        
                            <td>${fieldValue(bean: courseGroupInstance, field: "industry_sector_cd")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${courseGroupInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
