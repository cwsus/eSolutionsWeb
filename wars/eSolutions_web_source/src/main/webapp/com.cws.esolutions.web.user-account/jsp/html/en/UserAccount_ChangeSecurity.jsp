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
 * Package: com.cws.esolutions.web.useraccount\jsp\html\en
 * File: UserAccount_ViewAccount.jsp
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
    	secQuestionOneElement = document.getElementById('secQuestionOne');
    	secQuestionTwoElement = document.getElementById('secQuestionTwo');

    	if (theForm.secAnswerOne.value == '')
    	{
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="user.account.provide.answer" />';
            document.getElementById('txtAnswerOne').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('secAnswerOne').focus();

            return;
    	}
    	else if (theForm.secAnswerTwo.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="user.account.provide.answer" />';
            document.getElementById('txtAnswerTwo').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('secAnswerTwo').focus();

            return;
        }
    	else if (theForm.secAnswerOne.value == theForm.secAnswerTwo.value)
    	{
    		
    	}
        if ((theForm.secQuestionOne.value == 'Select....') || (theForm.secQuestionTwo.value == 'Select....') ||
        		(theForm.secQuestionTwo.value == '------') || (theForm.secQuestionTwo.value == '------'))
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="user.account.provide.security.questions" />';
            document.getElementById('txtQuestionOne').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('secQuestionOne').focus();

            return;
        }
        else if ((theForm.secAnswerOne.value == '') || (theForm.secAnswerTwo.value == ''))
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="user.account.answers.different" />';
            document.getElementById('txtAnswerOne').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('secAnswerOne').focus();

            return;
        }
        else if (theForm.currentPassword.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="user.account.provide.current.password" />';
            document.getElementById('txtPassword').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('currentPassword').focus();

            return;
        }
        else
        {
            if ((secQuestionOneElement == '') || (secQuestionOneElement.text == 'Select....') || (secQuestionOneElement.text == '------'))
            {
                clearText(theForm);
        
                document.getElementById('validationError').innerHTML = '<spring:message code="user.account.provide.security.question" />';
                document.getElementById('txtQuestionOne').style.color = '#FF0000';
                document.getElementById('execute').disabled = false;
                document.getElementById('secQuestionOne').focus();

                return;
            }
            else if ((secQuestionTwoElement == '') || (secQuestionTwoElement.text == 'Select....') || (secQuestionTwoElement.text == '------'))
            {
                clearText(theForm);
        
                document.getElementById('validationError').innerHTML = '<spring:message code="user.account.provide.security.question" />';
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
    <h1><spring:message code="user.account.update.security" /></h1>

    <%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

    <form:form id="submitSecurityInformationChange" name="submitSecurityInformationChange" action="${pageContext.request.contextPath}/ui/user-account/security" method="post">
        <table>
            <tr>
                <td><label id="txtQuestionOne"><spring:message code="user.account.update.security.question" /></label></td>
                <td>
                    <form:select path="secQuestionOne">
                        <option><fmt:message key="theme.option.select" /></option>
                        <option><fmt:message key="theme.option.spacer" /></option>
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
            <tr>
                <td><label id="txtPassword"><spring:message code="user.account.update.password.current" /></label></td>
                <td>
                    <form:password path="currentPassword" />
                    <form:errors path="currentPassword" cssClass="error" />
                </td>
            </tr>
        </table>

        <br class="clear" />
        <br class="clear" />

        <input type="button" name="execute" value="<fmt:message key='theme.button.submit.text' bundle='${theme}' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form);" />
        <input type="button" name="reset" value="<fmt:message key='theme.button.reset.text' bundle='${theme}' />" id="reset" class="submit" onclick="clearForm();" />
        <input type="button" name="cancel" value="<fmt:message key='theme.button.cancel.text' bundle='${theme}' />" id="cancel" class="submit" onclick="redirectOnCancel('${pageContext.request.contextPath}/ui/user-account/default');" />
    </form:form>
</div>

<div id="column">
    <div class="holder">
        <h1><spring:message code="user.account.update.security" /></h1>
        <ul id="latestnews">
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-account/email' />" title="<spring:message code='user.account.change.email' />"><spring:message code="user.account.change.email" /></a></p>
            </li>
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-account/contact' />" title="<spring:message code='user.account.change.contact' />"><spring:message code="user.account.change.contact" /></a></p>
            </li>
            <li class="last">
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-account/password' />" title="<spring:message code='user.account.change.password' />"><spring:message code="user.account.change.password" /></a></p>
            </li>
        </ul>
    </div>
</div>
<br class="clear" />
