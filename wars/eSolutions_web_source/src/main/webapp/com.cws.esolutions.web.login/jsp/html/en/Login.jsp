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
    function validateForm(theForm)
    {
        if (theForm.username.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="error.username.empty" />';
            document.getElementById('txtUsername').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('username').focus();

            return;
        }
        else if (theForm.password.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="error.password.empty" />';
            document.getElementById('txtPassword').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('password').focus();

            return;
        }

        theForm.submit();
    }
</script>

<div id="content">  
    <h1><spring:message code="login.user.combined.message" /></h1>

    <%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

    <form:form id="submitCombinedLogin" name="submitCombinedLogin" action="${pageContext.request.contextPath}/ui/auth/submit" method="post">
        <table>
            <tr>
                <td><label id="txtUsername"><spring:message code="login.user.name" /></label></td>
                <td>
                    <form:input path="username" />
                    <form:errors path="username" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td><label id="txtPassword"><spring:message code="login.user.pwd" /></label></td>
                <td>
                    <form:password path="password" />
                    <form:errors path="password" cssClass="error" />
                </td>
        </table>

        <br class="clear" />
        <br class="clear" />

        <input type="button" name="execute" value="<fmt:message key='theme.button.submit.text' bundle='${theme}' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form);" />
    </form:form>
</div>

<div id="column">
    <div class="holder">
        <h1><spring:message code="login.user.forgot.info" /></h1>
        <ul id="latestnews">
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/online-reset/forgot-username' />" title="<spring:message code='login.user.forgot_uid' />"><spring:message code="login.user.forgot_uid" /></a></p>
            </li>
            <li class="last">
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/online-reset/forgot-password' />" title="<spring:message code='login.user.forgot_pwd' />"><spring:message code="login.user.forgot_pwd" /></a></p>
            </li>
        </ul>
    </div>
</div>
<br class="clear" />
