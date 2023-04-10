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
 * File: OnlineReset_ChangePassword.jsp
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
        if (theForm.newPassword.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = 'Please provide an answer for your security question.';
            document.getElementById('txtNewPassword').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('newPassword').focus();
        }
        else if (theForm.confirmPassword.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = 'Please provide an answer for your security question.';
            document.getElementById('txtConfirmPassword').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('confirmPassword').focus();
        }
        else
        {
            theForm.submit();
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
    </div>

	<h1><spring:message code="olr.change.password" /></h1>
	<form:form id="submitPasswordChange" name="submitPasswordChange" action="${pageContext.request.contextPath}/ui/online-reset/forgot-password/change-password" method="post" autocomplete="off">
	    <form:hidden path="guid" value="${guid}" />
	    <form:hidden path="username" value="${username}" />
	    <form:hidden path="isReset" value="true" />

        <table>
            <tr>
                <td><label id="txtNewPassword"><spring:message code="olr.change.password.new" /></label></td>
                <td>
			        <form:password path="newPassword" />
			        <form:errors path="newPassword" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td><label id="txtConfirmPassword"><spring:message code="olr.change.password.confirm" /></label></td>
                <td>
			        <form:password path="confirmPassword" />
			        <form:errors path="confirmPassword" cssClass="error" />
                </td>
            </tr>
        </table>
	    <br class="clear" /><br class="clear" />
	    <input type="button" name="execute" value="<spring:message code='theme.button.submit.text' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form, event);" />
	    <input type="button" name="reset" value="<spring:message code='theme.button.reset.text' />" id="reset" class="submit" onclick="clearForm();" />
	    <input type="button" name="cancel" value="<spring:message code='theme.button.cancel.text' />" id="cancel" class="submit" onclick="redirectOnCancel('/esolutions/ui/auth/logout');" />
	</form:form>
</div>
