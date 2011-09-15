

<%@ page import="org.lfcsa.calpads.Family" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'family.label', default: 'Family')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
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
            <g:hasErrors bean="${familyInstance}">
            <div class="errors">
                <g:renderErrors bean="${familyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${familyInstance?.id}" />
                <g:hiddenField name="version" value="${familyInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="guardians"><g:message code="family.guardians.label" default="Guardians" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: familyInstance, field: 'guardians', 'errors')}">
                                    
<ul>
<g:each in="${familyInstance?.guardians?}" var="g">
    <li><g:link controller="guardian" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="guardian" action="create" params="['family.id': familyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'guardian.label', default: 'Guardian')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="headOfHousehold"><g:message code="family.headOfHousehold.label" default="Head Of Household" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: familyInstance, field: 'headOfHousehold', 'errors')}">
                                    <g:select name="headOfHousehold.id" from="${org.lfcsa.calpads.Person.list()}" optionKey="id" value="${familyInstance?.headOfHousehold?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="is_public"><g:message code="family.is_public.label" default="Ispublic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: familyInstance, field: 'is_public', 'errors')}">
                                    <g:checkBox name="is_public" value="${familyInstance?.is_public}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="family.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: familyInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${familyInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="note"><g:message code="family.note.label" default="Note" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: familyInstance, field: 'note', 'errors')}">
                                    <g:textField name="note" value="${familyInstance?.note}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pickups"><g:message code="family.pickups.label" default="Pickups" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: familyInstance, field: 'pickups', 'errors')}">
                                    <g:select name="pickups" from="${org.lfcsa.calpads.Person.list()}" multiple="yes" optionKey="id" size="5" value="${familyInstance?.pickups*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="residence"><g:message code="family.residence.label" default="Residence" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: familyInstance, field: 'residence', 'errors')}">
                                    <g:select name="residence.id" from="${org.lfcsa.calpads.Residence.list()}" optionKey="id" value="${familyInstance?.residence?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="students"><g:message code="family.students.label" default="Students" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: familyInstance, field: 'students', 'errors')}">
                                    
<ul>
<g:each in="${familyInstance?.students?}" var="s">
    <li><g:link controller="student" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="student" action="create" params="['family.id': familyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'student.label', default: 'Student')])}</g:link>

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
