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
        if (theForm.secAnswerOne.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="olr.provide.security.answer" />';
            document.getElementById('txtAnswerOne').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('secAnswerOne').focus();

            return;
        }
        else if (theForm.secAnswerTwo.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="olr.provide.security.answer" />';
            document.getElementById('txtAnswerTwo').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('secAnswerOne').focus();

            return;
        }
        else
        {
            secQuestionOne = document.getElementById('secQuestionOne');
            secQuestionTwo = document.getElementById('secQuestionTwo');

            if ((secQuestionOne == '') || (secQuestionOne.text == 'Select....') || (secQuestionOne.text == '------'))
            {
                clearText(theForm);
        
                document.getElementById('validationError').innerHTML = '<spring:message code="olr.provide.security.question" />';
                document.getElementById('txtQuestionOne').style.color = '#FF0000';
                document.getElementById('execute').disabled = false;
                document.getElementById('secQuestionOne').focus();

                return;
            }
            else if ((secQuestionTwo == '') || (secQuestionTwo.text == 'Select....') || (secQuestionTwo.text == '------'))
            {
                clearText(theForm);
        
                document.getElementById('validationError').innerHTML = '<spring:message code="olr.provide.security.question" />';
                document.getElementById('txtQuestionTwo').style.color = '#FF0000';
                document.getElementById('execute').disabled = false;
                document.getElementById('secQuestionTwo').focus();

                return;
            }
        }

        theForm.submit();
    }
</script>

<div id="content">  
    <h1><spring:message code="olr.user.provide.username" /></h1>

    <%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

    <form:form id="submitSecurityQuestion" name="submitSecurityQuestion" action="${pageContext.request.contextPath}/ui/online-reset/submit" method="post" autocomplete="off">
        <form:hidden path="resetType" value="${resetType}" />
        <form:hidden path="guid" value="${resetGuid}" />
        <form:hidden path="username" value="${resetUsername}" />

        <table>
            <tr>
                <td><label id="txtQuestionOne"><spring:message code="user.account.update.security.question" /></label></td>
                <td>
                    <form:select path="secQuestionOne">
                        <option><fmt:message key="theme.option.select" bundle="${theme}" /></option>
                        <option><fmt:message key="theme.option.spacer" bundle="${theme}" /></option>
                        <form:options items="${questionList}" />
                    </form:select>
                    <form:errors path="secQuestionOne" cssClass="error" />
                </td>
                <td><label id="txtAnswerOne"><spring:message code="user.account.update.security.answer" /></label></td>
                <td>
                    <form:password path="secAnswerOne" />
                    <form:errors path="secAnswerOne" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td><label id="txtQuestionTwo"><spring:message code="user.account.update.security.question" /></label></td>
                <td>
                    <form:select path="secQuestionTwo">
                        <option><fmt:message key="theme.option.select" bundle="${theme}" /></option>
                        <option><fmt:message key="theme.option.spacer" bundle="${theme}" /></option>
                        <form:options items="${questionList}" />
                    </form:select>
                    <form:errors path="secQuestionTwo" cssClass="error" />
                </td>
                <td><label id="txtAnswerTwo"><spring:message code="user.account.update.security.answer" /></label></td>
                <td>
                    <form:password path="secAnswerTwo" />
                    <form:errors path="secAnswerTwo" cssClass="error" />
                </td>
            </tr>
        </table>

        <br class="clear" /><br class="clear" />

        <input type="button" name="execute" value="<fmt:message key='theme.button.submit.text' bundle='${theme}' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form);" />
        <input type="button" name="reset" value="<fmt:message key='theme.button.reset.text' bundle='${theme}' />" id="reset" class="submit" onclick="clearForm();" />
        <input type="button" name="cancel" value="<fmt:message key='theme.button.cancel.text' bundle='${theme}' />" id="cancel" class="submit" onclick="redirectOnCancel('${pageContext.request.contextPath}/ui/user-account/default');" />
    </form:form>
</div>

<div id="column">
    <div class="holder">
        <h1><spring:message code="login.user.forgot.info" /></h1>
        <ul id="latestnews">
            <li class="last">
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/online-reset/forgot-username' />" title="<spring:message code='login.user.forgot_uid' />"><spring:message code="login.user.forgot_uid" /></a></p>
            </li>
        </ul>
    </div>
</div>
<br class="clear" />
