

<%@ page import="org.lfcsa.calpads.Student" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
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
            <g:hasErrors bean="${studentInstance}">
            <div class="errors">
                <g:renderErrors bean="${studentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${studentInstance?.id}" />
                <g:hiddenField name="version" value="${studentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="legal_name_last"><g:message code="student.legal_name_last.label" default="Legalnamelast" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'legal_name_last', 'errors')}">
                                    <g:textField name="legal_name_last" value="${studentInstance?.legal_name_last}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="legal_name_first"><g:message code="student.legal_name_first.label" default="Legalnamefirst" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'legal_name_first', 'errors')}">
                                    <g:textField name="legal_name_first" value="${studentInstance?.legal_name_first}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="legal_name_middle"><g:message code="student.legal_name_middle.label" default="Legalnamemiddle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'legal_name_middle', 'errors')}">
                                    <g:textField name="legal_name_middle" value="${studentInstance?.legal_name_middle}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="english_language_acquisition_start_dt"><g:message code="student.english_language_acquisition_start_dt.label" default="Englishlanguageacquisitionstartdt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'english_language_acquisition_start_dt', 'errors')}">
                                    <g:datePicker name="english_language_acquisition_start_dt" precision="day" value="${studentInstance?.english_language_acquisition_start_dt}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="initial_us_school_dt"><g:message code="student.initial_us_school_dt.label" default="Initialusschooldt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'initial_us_school_dt', 'errors')}">
                                    <g:datePicker name="initial_us_school_dt" precision="day" value="${studentInstance?.initial_us_school_dt}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="race_1"><g:message code="student.race_1.label" default="Race1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'race_1', 'errors')}">
                                    <g:textField name="race_1" value="${studentInstance?.race_1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="race_2"><g:message code="student.race_2.label" default="Race2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'race_2', 'errors')}">
                                    <g:textField name="race_2" value="${studentInstance?.race_2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="race_3"><g:message code="student.race_3.label" default="Race3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'race_3', 'errors')}">
                                    <g:textField name="race_3" value="${studentInstance?.race_3}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="race_4"><g:message code="student.race_4.label" default="Race4" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'race_4', 'errors')}">
                                    <g:textField name="race_4" value="${studentInstance?.race_4}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="race_5"><g:message code="student.race_5.label" default="Race5" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'race_5', 'errors')}">
                                    <g:textField name="race_5" value="${studentInstance?.race_5}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="teacher"><g:message code="student.teacher.label" default="Teacher" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'teacher', 'errors')}">
                                    <g:select name="teacher.id" from="${org.lfcsa.calpads.Teacher.list()}" optionKey="id" value="${studentInstance?.teacher?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="SSID"><g:message code="student.SSID.label" default="SSID" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'SSID', 'errors')}">
                                    <g:textField name="SSID" value="${studentInstance?.SSID}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="alias_name_first"><g:message code="student.alias_name_first.label" default="Aliasnamefirst" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'alias_name_first', 'errors')}">
                                    <g:textField name="alias_name_first" value="${studentInstance?.alias_name_first}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="alias_name_last"><g:message code="student.alias_name_last.label" default="Aliasnamelast" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'alias_name_last', 'errors')}">
                                    <g:textField name="alias_name_last" value="${studentInstance?.alias_name_last}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="alias_name_middle"><g:message code="student.alias_name_middle.label" default="Aliasnamemiddle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'alias_name_middle', 'errors')}">
                                    <g:textField name="alias_name_middle" value="${studentInstance?.alias_name_middle}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="allergies"><g:message code="student.allergies.label" default="Allergies" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'allergies', 'errors')}">
                                    <g:select name="allergies" from="${org.lfcsa.calpads.Allergy.list()}" multiple="yes" optionKey="id" size="5" value="${studentInstance?.allergies*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="birth_country_special_circumstance_ind"><g:message code="student.birth_country_special_circumstance_ind.label" default="Birthcountryspecialcircumstanceind" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'birth_country_special_circumstance_ind', 'errors')}">
                                    <g:textField name="birth_country_special_circumstance_ind" value="${studentInstance?.birth_country_special_circumstance_ind}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="birth_state_province_cd"><g:message code="student.birth_state_province_cd.label" default="Birthstateprovincecd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'birth_state_province_cd', 'errors')}">
                                    <g:textField name="birth_state_province_cd" value="${studentInstance?.birth_state_province_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cte_pathway_cd"><g:message code="student.cte_pathway_cd.label" default="Ctepathwaycd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'cte_pathway_cd', 'errors')}">
                                    <g:textField name="cte_pathway_cd" value="${studentInstance?.cte_pathway_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cte_pathway_completer_ind"><g:message code="student.cte_pathway_completer_ind.label" default="Ctepathwaycompleterind" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'cte_pathway_completer_ind', 'errors')}">
                                    <g:textField name="cte_pathway_completer_ind" value="${studentInstance?.cte_pathway_completer_ind}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="district_of_geographic_residence"><g:message code="student.district_of_geographic_residence.label" default="Districtofgeographicresidence" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'district_of_geographic_residence', 'errors')}">
                                    <g:textField name="district_of_geographic_residence" value="${studentInstance?.district_of_geographic_residence}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dob"><g:message code="student.dob.label" default="Dob" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'dob', 'errors')}">
                                    <g:datePicker name="dob" precision="day" value="${studentInstance?.dob}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="emails"><g:message code="student.emails.label" default="Emails" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'emails', 'errors')}">
                                    <g:select name="emails" from="${org.lfcsa.calpads.EmailAddress.list()}" multiple="yes" optionKey="id" size="5" value="${studentInstance?.emails*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="english_language_acquisition_status_cd"><g:message code="student.english_language_acquisition_status_cd.label" default="Englishlanguageacquisitionstatuscd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'english_language_acquisition_status_cd', 'errors')}">
                                    <g:textField name="english_language_acquisition_status_cd" value="${studentInstance?.english_language_acquisition_status_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="enrolled_less_than_three_years_ind"><g:message code="student.enrolled_less_than_three_years_ind.label" default="Enrolledlessthanthreeyearsind" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'enrolled_less_than_three_years_ind', 'errors')}">
                                    <g:textField name="enrolled_less_than_three_years_ind" value="${studentInstance?.enrolled_less_than_three_years_ind}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="family"><g:message code="student.family.label" default="Family" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'family', 'errors')}">
                                    <g:select name="family.id" from="${org.lfcsa.calpads.Family.list()}" optionKey="id" value="${studentInstance?.family?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gender"><g:message code="student.gender.label" default="Gender" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'gender', 'errors')}">
                                    <g:textField name="gender" value="${studentInstance?.gender}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="grade_level_cd"><g:message code="student.grade_level_cd.label" default="Gradelevelcd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'grade_level_cd', 'errors')}">
                                    <g:textField name="grade_level_cd" value="${studentInstance?.grade_level_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="hispanic_ind"><g:message code="student.hispanic_ind.label" default="Hispanicind" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'hispanic_ind', 'errors')}">
                                    <g:textField name="hispanic_ind" value="${studentInstance?.hispanic_ind}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="initial_ninth_grade_entry_year"><g:message code="student.initial_ninth_grade_entry_year.label" default="Initialninthgradeentryyear" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'initial_ninth_grade_entry_year', 'errors')}">
                                    <g:textField name="initial_ninth_grade_entry_year" value="${studentInstance?.initial_ninth_grade_entry_year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="interdistrict_transfer_cd"><g:message code="student.interdistrict_transfer_cd.label" default="Interdistricttransfercd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'interdistrict_transfer_cd', 'errors')}">
                                    <g:textField name="interdistrict_transfer_cd" value="${studentInstance?.interdistrict_transfer_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="is_enrolled"><g:message code="student.is_enrolled.label" default="Isenrolled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'is_enrolled', 'errors')}">
                                    <g:checkBox name="is_enrolled" value="${studentInstance?.is_enrolled}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="is_race_missing"><g:message code="student.is_race_missing.label" default="Isracemissing" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'is_race_missing', 'errors')}">
                                    <g:textField name="is_race_missing" value="${studentInstance?.is_race_missing}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="is_waitlisted"><g:message code="student.is_waitlisted.label" default="Iswaitlisted" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'is_waitlisted', 'errors')}">
                                    <g:checkBox name="is_waitlisted" value="${studentInstance?.is_waitlisted}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="legal_name_suffix"><g:message code="student.legal_name_suffix.label" default="Legalnamesuffix" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'legal_name_suffix', 'errors')}">
                                    <g:textField name="legal_name_suffix" value="${studentInstance?.legal_name_suffix}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="local_student_id"><g:message code="student.local_student_id.label" default="Localstudentid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'local_student_id', 'errors')}">
                                    <g:textField name="local_student_id" value="${studentInstance?.local_student_id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="media_release"><g:message code="student.media_release.label" default="Mediarelease" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'media_release', 'errors')}">
                                    <g:checkBox name="media_release" value="${studentInstance?.media_release}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="missing_ethnicity_ind"><g:message code="student.missing_ethnicity_ind.label" default="Missingethnicityind" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'missing_ethnicity_ind', 'errors')}">
                                    <g:textField name="missing_ethnicity_ind" value="${studentInstance?.missing_ethnicity_ind}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="parent_education_cd"><g:message code="student.parent_education_cd.label" default="Parenteducationcd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'parent_education_cd', 'errors')}">
                                    <g:textField name="parent_education_cd" value="${studentInstance?.parent_education_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phones"><g:message code="student.phones.label" default="Phones" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'phones', 'errors')}">
                                    <g:select name="phones" from="${org.lfcsa.calpads.PhoneContact.list()}" multiple="yes" optionKey="id" size="5" value="${studentInstance?.phones*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="primary_language_cd"><g:message code="student.primary_language_cd.label" default="Primarylanguagecd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'primary_language_cd', 'errors')}">
                                    <g:textField name="primary_language_cd" value="${studentInstance?.primary_language_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="primary_residence_category"><g:message code="student.primary_residence_category.label" default="Primaryresidencecategory" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'primary_residence_category', 'errors')}">
                                    <g:textField name="primary_residence_category" value="${studentInstance?.primary_residence_category}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="proficient_or_ela_cd"><g:message code="student.proficient_or_ela_cd.label" default="Proficientorelacd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'proficient_or_ela_cd', 'errors')}">
                                    <g:textField name="proficient_or_ela_cd" value="${studentInstance?.proficient_or_ela_cd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="residence"><g:message code="student.residence.label" default="Residence" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'residence', 'errors')}">
                                    <g:select name="residence.id" from="${org.lfcsa.calpads.Residence.list()}" optionKey="id" value="${studentInstance?.residence?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="roles"><g:message code="student.roles.label" default="Roles" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'roles', 'errors')}">
                                    <g:select name="roles" from="${org.lfcsa.calpads.Role.list()}" multiple="yes" optionKey="id" size="5" value="${studentInstance?.roles*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="user"><g:message code="student.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${org.lfcsa.calpads.User.list()}" optionKey="id" value="${studentInstance?.user?.id}"  />
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
