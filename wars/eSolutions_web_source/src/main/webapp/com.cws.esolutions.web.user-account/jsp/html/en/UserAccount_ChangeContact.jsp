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
        if (theForm.telNumber.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="user.account.provide.tel.number" />';
            document.getElementById('txtTelNumber').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('telNumber').focus();

            return;
        }
        else if (theForm.pagerNumber.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="user.account.provide.pager.number" />';
            document.getElementById('txtPagerNumber').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('pagerNumber').focus();

            return;
        }

        theForm.submit();
    }
</script>

<div id="content">
    <h1><spring:message code="user.account.update.contact.info" /></h1>
    
    <%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

    <form:form name="submitContactChange" id="submitContactChange" action="${pageContext.request.contextPath}/ui/user-account/contact" method="post">
        <table>
            <tr>
                <td><label id="txtTelNumber"><spring:message code="user.account.telephone" /></label></td>
                <td>
                    <form:input path="telNumber" value="${sessionScope.userAccount.telephoneNumber}" />
                    <form:errors path="telNumber" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td><label id="txtPagerNumber"><spring:message code="user.account.pager" /></label></td>
                <td>
                    <form:input path="pagerNumber" value="${sessionScope.userAccount.pagerNumber}" />
                    <form:errors path="pagerNumber" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td><label id="txtPassword"><spring:message code="login.user.pwd" /><br /></label></td>
                <td>
                    <form:password path="currentPassword" />
                    <form:errors path="currentPassword" cssClass="error" />
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
        <h1><spring:message code="user.account.update.security" /></h1>
        <ul id="latestnews">
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-account/email' />" title="<spring:message code='user.account.change.email' />"><spring:message code="user.account.change.email" /></a></p>
            </li>
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-account/password' />" title="<spring:message code='user.account.change.password' />"><spring:message code="user.account.change.password" /></a></p>
            </li>
            <li class="last">
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-account/security' />" title="<spring:message code='user.account.change.security.questions' />"><spring:message code="user.account.change.security.questions" /></a></p>
            </li>
        </ul>
    </div>
</div>
<br class="clear" />
