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
    function validateForm(theForm)
    {
        if (theForm.emailAddr.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="olr.provide.email.addr" />';
            document.getElementById('txtEmailAddr').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('emailAddr').focus();

            return;
        }

        theForm.submit();
    }
</script>

<div id="content">
    <h1><spring:message code="olr.provide.email.address" /></h1>

    <%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

    <form:form id="submitEmailForUserSearch" name="submitEmailForUserSearch" action="${pageContext.request.contextPath}/ui/online-reset/forgot-username" method="post" autocomplete="off">
        <form:hidden path="resetType" value="${resetType}" />

        <table>
            <tr>
                <td><label id="txtEmailAddr"><spring:message code="olr.user.email.address" /></label></td>
                <td>
                    <form:input path="emailAddr" />
                    <form:errors path="emailAddr" cssClass="error" />
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
                <p><a href="<c:url value='/ui/app/help/forgot-email' />" title="<spring:message code="olr.user.forgot.email" />"><spring:message code="olr.user.forgot.email" /></a></p>
            </li>
        </ul>
    </div>
</div>
<br class="clear" />
