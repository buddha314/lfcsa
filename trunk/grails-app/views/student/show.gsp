
<%@ page import="org.lfcsa.calpads.Student" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
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
                            <td valign="top" class="name"><g:message code="student.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.legal_name_last.label" default="Legalnamelast" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "legal_name_last")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.legal_name_first.label" default="Legalnamefirst" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "legal_name_first")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.legal_name_middle.label" default="Legalnamemiddle" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "legal_name_middle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.english_language_acquisition_start_dt.label" default="Englishlanguageacquisitionstartdt" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${studentInstance?.english_language_acquisition_start_dt}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.initial_us_school_dt.label" default="Initialusschooldt" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${studentInstance?.initial_us_school_dt}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.race_1.label" default="Race1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "race_1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.race_2.label" default="Race2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "race_2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.race_3.label" default="Race3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "race_3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.race_4.label" default="Race4" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "race_4")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.race_5.label" default="Race5" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "race_5")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.teacher.label" default="Teacher" /></td>
                            
                            <td valign="top" class="value"><g:link controller="teacher" action="show" id="${studentInstance?.teacher?.id}">${studentInstance?.teacher?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.SSID.label" default="SSID" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "SSID")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.alias_name_first.label" default="Aliasnamefirst" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "alias_name_first")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.alias_name_last.label" default="Aliasnamelast" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "alias_name_last")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.alias_name_middle.label" default="Aliasnamemiddle" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "alias_name_middle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.allergies.label" default="Allergies" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${studentInstance.allergies}" var="a">
                                    <li><g:link controller="allergy" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.birth_country_special_circumstance_ind.label" default="Birthcountryspecialcircumstanceind" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "birth_country_special_circumstance_ind")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.birth_state_province_cd.label" default="Birthstateprovincecd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "birth_state_province_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.cte_pathway_cd.label" default="Ctepathwaycd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "cte_pathway_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.cte_pathway_completer_ind.label" default="Ctepathwaycompleterind" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "cte_pathway_completer_ind")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.district_of_geographic_residence.label" default="Districtofgeographicresidence" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "district_of_geographic_residence")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.dob.label" default="Dob" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${studentInstance?.dob}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.emails.label" default="Emails" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${studentInstance.emails}" var="e">
                                    <li><g:link controller="emailAddress" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.english_language_acquisition_status_cd.label" default="Englishlanguageacquisitionstatuscd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "english_language_acquisition_status_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.enrolled_less_than_three_years_ind.label" default="Enrolledlessthanthreeyearsind" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "enrolled_less_than_three_years_ind")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.family.label" default="Family" /></td>
                            
                            <td valign="top" class="value"><g:link controller="family" action="show" id="${studentInstance?.family?.id}">${studentInstance?.family?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.gender.label" default="Gender" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "gender")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.grade_level_cd.label" default="Gradelevelcd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "grade_level_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.hispanic_ind.label" default="Hispanicind" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "hispanic_ind")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.initial_ninth_grade_entry_year.label" default="Initialninthgradeentryyear" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "initial_ninth_grade_entry_year")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.interdistrict_transfer_cd.label" default="Interdistricttransfercd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "interdistrict_transfer_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.is_enrolled.label" default="Isenrolled" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${studentInstance?.is_enrolled}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.is_race_missing.label" default="Isracemissing" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "is_race_missing")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.is_waitlisted.label" default="Iswaitlisted" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${studentInstance?.is_waitlisted}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.legal_name_suffix.label" default="Legalnamesuffix" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "legal_name_suffix")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.local_student_id.label" default="Localstudentid" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "local_student_id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.media_release.label" default="Mediarelease" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${studentInstance?.media_release}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.missing_ethnicity_ind.label" default="Missingethnicityind" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "missing_ethnicity_ind")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.parent_education_cd.label" default="Parenteducationcd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "parent_education_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.phones.label" default="Phones" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${studentInstance.phones}" var="p">
                                    <li><g:link controller="phoneContact" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.primary_language_cd.label" default="Primarylanguagecd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "primary_language_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.primary_residence_category.label" default="Primaryresidencecategory" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "primary_residence_category")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.proficient_or_ela_cd.label" default="Proficientorelacd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "proficient_or_ela_cd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.residence.label" default="Residence" /></td>
                            
                            <td valign="top" class="value"><g:link controller="residence" action="show" id="${studentInstance?.residence?.id}">${studentInstance?.residence?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.roles.label" default="Roles" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${studentInstance.roles}" var="r">
                                    <li><g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.user.label" default="User" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${studentInstance?.user?.id}">${studentInstance?.user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${studentInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
