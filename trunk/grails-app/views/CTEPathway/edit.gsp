

<%@ page import="org.lfcsa.calpads.CTEPathway" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'CTEPathway.label', default: 'CTEPathway')}" />
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
            <g:hasErrors bean="${CTEPathwayInstance}">
            <div class="errors">
                <g:renderErrors bean="${CTEPathwayInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${CTEPathwayInstance?.id}" />
                <g:hiddenField name="version" value="${CTEPathwayInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cte_industry_sector_cd"><g:message code="CTEPathway.cte_industry_sector_cd.label" default="Cteindustrysectorcd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: CTEPathwayInstance, field: 'cte_industry_sector_cd', 'errors')}">
                                    <g:textField name="cte_industry_sector_cd" value="${CTEPathwayInstance?.cte_industry_sector_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cte_industry_sector_nm"><g:message code="CTEPathway.cte_industry_sector_nm.label" default="Cteindustrysectornm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: CTEPathwayInstance, field: 'cte_industry_sector_nm', 'errors')}">
                                    <g:textField name="cte_industry_sector_nm" value="${CTEPathwayInstance?.cte_industry_sector_nm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cte_pathway_cd"><g:message code="CTEPathway.cte_pathway_cd.label" default="Ctepathwaycd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: CTEPathwayInstance, field: 'cte_pathway_cd', 'errors')}">
                                    <g:textField name="cte_pathway_cd" value="${CTEPathwayInstance?.cte_pathway_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cte_pathway_nm"><g:message code="CTEPathway.cte_pathway_nm.label" default="Ctepathwaynm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: CTEPathwayInstance, field: 'cte_pathway_nm', 'errors')}">
                                    <g:textField name="cte_pathway_nm" value="${CTEPathwayInstance?.cte_pathway_nm}" />
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
