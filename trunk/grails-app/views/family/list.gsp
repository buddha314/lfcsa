
<%@ page import="org.lfcsa.calpads.Family" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'family.label', default: 'Family')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
           <h1><g:link class="show_directory" action="show_directory">LFCSA Family Directory</g:link> </h1>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'family.id.label', default: 'Id')}" />
                        
                            <th><g:message code="family.headOfHousehold.label" default="Head Of Household" /></th>
                        
                            <g:sortableColumn property="is_public" title="${message(code: 'family.is_public.label', default: 'Ispublic')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'family.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="note" title="${message(code: 'family.note.label', default: 'Note')}" />
                        
                            <th><g:message code="family.residence.label" default="Residence" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${familyInstanceList}" status="i" var="familyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${familyInstance.id}">${fieldValue(bean: familyInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: familyInstance, field: "headOfHousehold")}</td>
                        
                            <td><g:formatBoolean boolean="${familyInstance.is_public}" /></td>
                        
                            <td>${fieldValue(bean: familyInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: familyInstance, field: "note")}</td>
                        
                            <td>${fieldValue(bean: familyInstance, field: "residence")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${familyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
