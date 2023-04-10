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
 * Package: com.cws.esolutions.web.login\jsp\html\en
 * File: Login.jsp
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
        if (theForm.username.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = 'Your username must be provided.';
            document.getElementById('txtUsername').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('username').focus();
        }
        else if (theForm.password.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = 'Your password must be provided.';
            document.getElementById('txtPassword').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('username').focus();
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

        <h1><spring:message code="login.user.combined.message" /></h1>
        <form:form id="submitCombinedLogin" name="submitCombinedLogin" action="${pageContext.request.contextPath}/ui/auth/submit" method="post">
            <table>
                <tr>
                    <td><label id="txtUsername"><spring:message code="login.user.name" /></label></td>
                    <td>
                        <form:input path="username" />
                        <form:errors path="username" cssClass="error" />
                    </td>
                    <td>
                        <c:if test="${allowUserReset eq true}">
                            <a href="${pageContext.request.contextPath}/ui/online-reset/forgot-username" title="<spring:message code='login.user.forgot_uid' />"><spring:message code="login.user.forgot_uid" /></a>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td><label id="txtPassword"><spring:message code="login.user.pwd" /></label></td>
                    <td>
                        <form:password path="password" />
                        <form:errors path="password" cssClass="error" />
                    </td>
                    <td>
                        <c:if test="${allowUserReset eq true}">
                            <a href="${pageContext.request.contextPath}/ui/online-reset/forgot-password" title="<spring:message code='login.user.forgot_pwd' />"><spring:message code="login.user.forgot_pwd" /></a>
                        </c:if>
                    </td>
            </table>
            <br class="clear" /><br class="clear" />
            <input type="button" name="execute" value="<spring:message code='theme.button.submit.text' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form, event);" />
            <input type="button" name="reset" value="<spring:message code='theme.button.reset.text' />" id="reset" class="submit" onclick="clearForm();" />
        </form:form>
	</div>
</div>