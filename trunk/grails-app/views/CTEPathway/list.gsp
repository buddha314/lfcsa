
<%@ page import="org.lfcsa.calpads.CTEPathway" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'CTEPathway.label', default: 'CTEPathway')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'CTEPathway.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="cte_industry_sector_cd" title="${message(code: 'CTEPathway.cte_industry_sector_cd.label', default: 'Cteindustrysectorcd')}" />
                        
                            <g:sortableColumn property="cte_industry_sector_nm" title="${message(code: 'CTEPathway.cte_industry_sector_nm.label', default: 'Cteindustrysectornm')}" />
                        
                            <g:sortableColumn property="cte_pathway_cd" title="${message(code: 'CTEPathway.cte_pathway_cd.label', default: 'Ctepathwaycd')}" />
                        
                            <g:sortableColumn property="cte_pathway_nm" title="${message(code: 'CTEPathway.cte_pathway_nm.label', default: 'Ctepathwaynm')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${CTEPathwayInstanceList}" status="i" var="CTEPathwayInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${CTEPathwayInstance.id}">${fieldValue(bean: CTEPathwayInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: CTEPathwayInstance, field: "cte_industry_sector_cd")}</td>
                        
                            <td>${fieldValue(bean: CTEPathwayInstance, field: "cte_industry_sector_nm")}</td>
                        
                            <td>${fieldValue(bean: CTEPathwayInstance, field: "cte_pathway_cd")}</td>
                        
                            <td>${fieldValue(bean: CTEPathwayInstance, field: "cte_pathway_nm")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${CTEPathwayInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
