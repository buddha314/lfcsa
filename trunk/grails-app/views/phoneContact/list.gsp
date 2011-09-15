
<%@ page import="org.lfcsa.calpads.PhoneContact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'phoneContact.label', default: 'PhoneContact')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'phoneContact.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="is_public" title="${message(code: 'phoneContact.is_public.label', default: 'Ispublic')}" />
                        
                            <g:sortableColumn property="is_valid" title="${message(code: 'phoneContact.is_valid.label', default: 'Isvalid')}" />
                        
                            <g:sortableColumn property="phone_note" title="${message(code: 'phoneContact.phone_note.label', default: 'Phonenote')}" />
                        
                            <g:sortableColumn property="phone_number" title="${message(code: 'phoneContact.phone_number.label', default: 'Phonenumber')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${phoneContactInstanceList}" status="i" var="phoneContactInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${phoneContactInstance.id}">${fieldValue(bean: phoneContactInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatBoolean boolean="${phoneContactInstance.is_public}" /></td>
                        
                            <td><g:formatBoolean boolean="${phoneContactInstance.is_valid}" /></td>
                        
                            <td>${fieldValue(bean: phoneContactInstance, field: "phone_note")}</td>
                        
                            <td>${fieldValue(bean: phoneContactInstance, field: "phone_number")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${phoneContactInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
