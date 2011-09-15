
<%@ page import="org.lfcsa.calpads.EmailAddress" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'emailAddress.label', default: 'EmailAddress')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'emailAddress.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'emailAddress.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="email_note" title="${message(code: 'emailAddress.email_note.label', default: 'Emailnote')}" />
                        
                            <g:sortableColumn property="is_public" title="${message(code: 'emailAddress.is_public.label', default: 'Ispublic')}" />
                        
                            <g:sortableColumn property="is_valid" title="${message(code: 'emailAddress.is_valid.label', default: 'Isvalid')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${emailAddressInstanceList}" status="i" var="emailAddressInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${emailAddressInstance.id}">${fieldValue(bean: emailAddressInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: emailAddressInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: emailAddressInstance, field: "email_note")}</td>
                        
                            <td><g:formatBoolean boolean="${emailAddressInstance.is_public}" /></td>
                        
                            <td><g:formatBoolean boolean="${emailAddressInstance.is_valid}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${emailAddressInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
