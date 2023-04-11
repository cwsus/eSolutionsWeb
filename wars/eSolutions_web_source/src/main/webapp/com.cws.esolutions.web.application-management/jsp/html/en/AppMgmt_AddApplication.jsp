<%--
/*
 * Copyright (c) 2009 - 2020 CaspersBox Web Services
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
--%>
<%--
/**
 * Project: eSolutions_web_source
 * Package: com.cws.esolutions.web.application-management\jsp\html\en
 * File: AppMgmt_AddApplication.jsp
 *
 * @author cws-khuntly
 * @version 1.0
 *
 * History
 *
 * Author               Date                            Comments
 * ----------------------------------------------------------------------------
 * cws-khuntly          11/23/2008 22:39:20             Created.
 */
--%>

<script>
<!--
    function validateForm(theForm)
    {
        if (theForm.name.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = 'An application name must be provided.';
            document.getElementById('txtApplicationName').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('name').focus();
        }
        else if (theForm.version.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = 'An application version must be provided.';
            document.getElementById('txtApplicationVersion').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('version').focus();
        }
        else if (theForm.basePath.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = 'A base path must be provided for installation purposes.';
            document.getElementById('txtBasePath').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('basePath').focus();
        }
        else if (theForm.logsPath.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = 'A path for logs must be provided. This path is relative to the base path provided.';
            document.getElementById('"txtApplicationLogsPath"').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('logsPath').focus();
        }
        else if (theForm.installPath.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = 'A path for installation must be provided. This path is relative to the base path provided.';
            document.getElementById('"txtApplicationInstallPath"').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('installPath').focus();
        }
        else
        {
            selectElement = document.getElementById('platformListing');

            if ((selectElement.text == 'Select....') || (selectElement.text == '------'))
            {
                clearText(theForm);

                document.getElementById('validationError').innerHTML = 'A platform status must be provided.';
                document.getElementById('txtPlatformStatus').style.color = '#FF0000';
                document.getElementById('execute').disabled = false;
                document.getElementById('platformName').focus();
            }
            else
            {
                theForm.submit();
            }
        }
    }
//-->
</script>

<div id="homecontent">
    <div class="wrapper">
        <div id="validationError" style="color: #FF0000"></div>

        <c:if test="${not empty fn:trim(messageResponse)}">
            <p id="info">${messageResponse}</p>
        </c:if>
        <c:if test="${not empty fn:trim(errorResponse)}">
            <p id="error">${errorResponse}</p>
        </c:if>
        <c:if test="${not empty fn:trim(responseMessage)}">
            <p id="info"><spring:message code="${responseMessage}" /></p>
        </c:if>
        <c:if test="${not empty fn:trim(errorMessage)}">
            <p id="error"><spring:message code="${errorMessage}" /></p>
        </c:if>
        <c:if test="${not empty fn:trim(param.responseMessage)}">
            <p id="info"><spring:message code="${param.responseMessage}" /></p>
        </c:if>
        <c:if test="${not empty fn:trim(param.errorMessage)}">
            <p id="error"><spring:message code="${param.errorMessage}" /></p>
        </c:if>

        <div id="validationError" style="color: #FF0000"></div>

        <h2><spring:message code="app.mgmt.add.application" /></h2>
        <form:form id="createNewApplication" name="createNewApplication" action="${pageContext.request.contextPath}/ui/application-management/add-application" method="post">
            <table id="addNewApplication">
                <tr>
                    <td><label id="txtApplicationName"><spring:message code="app.mgmt.application.name" /></label></td>
                    <td>
                        <form:input path="name" />
                        <form:errors path="name" cssClass="error" />
                    </td>
                </tr>
                <tr>
                    <td><label id="txtApplicationVersion"><spring:message code="app.mgmt.application.version" /></label></td>
                    <td>
                        <form:input path="version" />
                        <form:errors path="version" cssClass="error" />
                    </td>
                </tr>
                <tr>
                    <td><label id="txtApplicationPlatform"><spring:message code="app.mgmt.application.platform" /></label></td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty platformListing}">
                                <form:select id="platformListing" path="platformGuid">
                                    <option><spring:message code="theme.option.select" /></option>
                                    <option><spring:message code="theme.option.spacer" /></option>
                                    <c:forEach var="platform" items="${platformListing}">
                                            <form:option value="${platform.key}" label="${platform.value}" />
                                    </c:forEach>
                                </form:select>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/ui/platform-management/add-platform"title="<spring:message code='select.request.add.platform' />"><spring:message code='select.request.add.platform' /></a>
                            </c:otherwise>
                        </c:choose>
                        <form:errors path="platform" cssClass="error" />
                    </td>
                </tr>
                <tr>
                    <td><label id="txtBasePath"><spring:message code="app.mgmt.base.path" /></label></td>
                    <td>
                        <form:input path="basePath" />
                        <form:errors path="basePath" cssClass="error" />
                    </td>
                </tr>
                <tr>
                    <td><label id="txtApplicationLogsPath"><spring:message code="app.mgmt.application.applogs.path" /></label></td>
                    <td>
                        <form:input path="logsPath" />
                        <form:errors path="logsPath" cssClass="error" />
                    </td>
                </tr>
                <tr>
                    <td><label id="txtApplicationInstallPath"><spring:message code="app.mgmt.application.install.path" /></label></td>
                    <td>
                        <form:input path="installPath" />
                        <form:errors path="installPath" cssClass="error" />
                    </td>
                </tr>
                <tr>
                    <td><label id="txtIsScmEnabled"><spring:message code="app.mgmt.application.scm.enabled" /></label></td>
                    <td>
                        <form:checkbox path="isScmEnabled" name="isScmEnabled" id="isScmEnabled" onclick="showScmData(this);" />
                        <form:errors path="isScmEnabled" cssClass="error" />
                    </td>
                </tr>
                <tr>
                    <td><label id="txtScmPath"><spring:message code="app.mgmt.application.scm.path" /></label></td>
                    <td>
                        <form:input path="scmPath" />
                        <form:errors path="scmPath" cssClass="error" />
                    </td>
                </tr>
            </table>
            <br /><br />
            <input type="button" name="execute" value="<spring:message code='theme.button.submit.text' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form, event);" />
            <input type="button" name="reset" value="<spring:message code='theme.button.reset.text' />" id="reset" class="submit" onclick="clearForm();" />
            <input type="button" name="cancel" value="<spring:message code='theme.button.cancel.text' />" id="cancel" class="submit" onclick="redirectOnCancel('/esolutions/ui/application-management/default');" />
        </form:form>
    </div>
    <br class="clear" />
</div>

<div id="container">
    <div class="wrapper">
        <div id="holder">
            <h1><spring:message code="app.mgmt.header" /></h1>
            <ul>
                <li><a href="${pageContext.request.contextPath}/ui/application-management/list-applications" title="<spring:message code='app.mgmt.list.applications' />"><spring:message code='app.mgmt.list.applications' /></a></li>
                <li><a href="${pageContext.request.contextPath}/ui/application-management/add-application" title="<spring:message code='app.mgmt.add.application' />"><spring:message code='app.mgmt.add.application' /></a></li>
            </ul>
        </div>
        <br class="clear" />
    </div>
</div>
