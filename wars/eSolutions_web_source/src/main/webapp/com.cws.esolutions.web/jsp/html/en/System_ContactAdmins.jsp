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
 * Package: com.cws.esolutions.web\jsp\html\en
 * File: System_Unauthorized.jsp
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
        if (theForm.messageSubject.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<fmt:message key="theme.provide.mail.subject" bundle="${theme}" />';
            document.getElementById('txtMessageSubject').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('messageSubject').focus();

            return;
        }
        else if (theForm.messageBody.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<fmt:message key="theme.provide.mail.body" bundle="${theme}" />';
            document.getElementById('txtMessageBody').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('messageSubject').focus();

            return;
        }

        theForm.submit();
    }
</script>

<h1><fmt:message key="theme.error.system.failure" bundle="${theme}" /></h1>
<fmt:message key="theme.system.service.failure" bundle="${theme}" />

<%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

<div id="content">
	<form:form id="submitContactForm" name="submitContactForm" action="${pageContext.request.contextPath}/ui/common/contact" method="post">
	    <form:hidden path="messageTo" value="${serviceEmail}" />
	
	    <table>
	        <tr>
	            <td><label id="txtMessageSubject"><fmt:message key="theme.add.contact.request.subject" bundle="${theme}" /></label></td>
	            <td>
	                <form:input path="messageSubject" />
	                <form:errors path="messageSubject" cssClass="error" />
	            </td>
	        </tr>
	        <tr>
	            <td><label id="txtRequestorEmail"><fmt:message key="theme.add.contact.source.email" bundle="${theme}" /></label></td>
	            <td>
	                <form:input path="emailAddr" />
	                <form:errors path="emailAddr" cssClass="error" />
	            </td>
	        </tr>
	        <tr>
	            <td><label id="txtMessageBody"><fmt:message key="theme.add.contact.request.body" bundle="${theme}" /></label></td>
	            <td>
	                <form:textarea path="messageBody" />
	                <form:errors path="messageBody" cssClass="error" />
	            </td>
	        </tr>
	    </table>
	    <br class="clear" /><br class="clear" />
	    <input type="button" name="execute" value="<fmt:message key='theme.button.submit.text' bundle='${theme}' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form);" />
	    <input type="button" name="reset" value="<fmt:message key='theme.button.reset.text' bundle='${theme}' />" id="reset" class="submit" onclick="clearForm();" />
	</form:form>
</div>

<div id="column">
    <div class="holder">
        <ul id="latestnews">
            <c:choose>
                <c:when test="${empty fn:trim(sessionScope.userAccount) or empty fn:trim(sessionScope.userAccount.status)}">
                    <li>
                        <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                        <p><a href="<c:url value='/ui/login/default' />" title="<fmt:message key='theme.navbar.login' bundle='${theme}' />"><fmt:message key="theme.click.continue" bundle="${theme}" /></a></p>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                        <p><a href="<c:url value='/ui/common/default' />" title="<fmt:message key='theme.navbar.home' bundle='${theme}' />"><fmt:message key="theme.click.continue" bundle="${theme}" /></a></p>
                    </li>
                    <li>
                        <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                        <p><a href="<c:url value='/ui/login/default' />" title="<fmt:message key='theme.navbar.login' bundle='${theme}' />"><fmt:message key="theme.click.continue"  bundle="${theme}"/></a></p>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
<br class="clear" />
