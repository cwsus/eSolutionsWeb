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
 * Package: com.cws.esolutions.web.user-management\jsp\html\en
 * File: UserManagement_UserAudit.jsp
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
        if (theForm.title.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="kbase.provide.title" />';
            document.getElementById('"txtTitle"').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('title').focus();

            return;
        }
        else if (theForm.keywords.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="kbase.provide.keywords" />';
            document.getElementById('"txtKeywords"').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('keywords').focus();

            return;
        }
        else if (theForm.symptoms.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="kbase.provide.symptoms" />';
            document.getElementById('txtSymptoms').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('symptoms').focus();

            return;
        }
        else if (theForm.cause.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="kbase.provide.cause" />';
            document.getElementById('txtCause').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('cause').focus();

            return;
        }
        else if (theForm.resolution.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="kbase.provide.resolution" />';
            document.getElementById('txtResolution').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('resolution').focus();

            return;
        }

        theForm.submit();
    }
</script>

<div id="content">
    <%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

    <form:form id="createNewArticle" name="createNewArticle" action="${pageContext.request.contextPath}/ui/knowledge-management/add-article" method="post">
        <table>
            <tr>
                <td><label><spring:message code="knowledge.mgmt.article.newtitle" /></label></td>
                <td>
           <form:input path="title" />
           <form:errors path="title" cssClass="error" />
                </td>
            </tr>
        </table>
        <table>
            <thead>
                <tr>
                    <th><label><spring:message code="knowledge.article.keywords" /></label></th>
                    <th><label><spring:message code="knowledge.article.symptoms" /></label></th>
                    <th><label><spring:message code="knowledge.article.cause" /></label></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <form:input path="keywords" />
                        <form:errors path="keywords" cssClass="error" />
                    </td>
                    <td>
                        <form:input path="symptoms" />
                        <form:errors path="symptoms" cssClass="error" />
                    </td>
                    <td>
                        <form:input path="cause" />
                        <form:errors path="cause" cssClass="error" />
                    </td>
                </tr>
            </tbody>
        </table>
        <br class="clear" />
        <form:textarea path="resolution" style="width: 915px; height: 150px;" spellcheck="true" />
        <form:errors path="resolution" cssClass="error" />
        <br class="clear" />
        <table>
            <thead>
                <tr>
                    <th><label><spring:message code="knowledge.article.author" /></label></th>
                    <th><label><spring:message code="knowledge.article.approver" /></label></th>
                    <th><label><spring:message code="knowledge.article.approvedOn" /></label></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${sessionScope.userAccount.username}</td>
                    <td>---</td>
                    <td>---</td>
                </tr>
            </tbody>
        </table>
        <br class="clear" /><br class="clear" />
        <input type="button" name="execute" value="<fmt:message key='theme.button.submit.text' bundle='${theme}' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form);" />
        <input type="button" name="reset" value="<fmt:message key='theme.button.reset.text' bundle='${theme}' />" id="reset" class="submit" onclick="clearForm();" />
        <input type="button" name="cancel" value="<fmt:message key='theme.button.cancel.text' bundle='${theme}' />" id="cancel" class="submit" onclick="redirectOnCancel('${pageContext.request.contextPath}/ui/knowledge-management/default');" />
    </form:form>
    <br class="clear" />
</div>

<div id="column">
    <div class="holder">
        <h1><spring:message code="knowledge.mgmt.header" /></h1>
        <ul id="latestnews">
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/knowledge-management/default' />" title="<fmt:message key='theme.search.banner' bundle='${theme}' />"><fmt:message key="theme.search.banner" bundle="${thene}" /></a></p>
            </li>
            <li class="last">
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/knowledge-management/list-articles' />" title="<spring:message code='knowledge.mgmt.list.articles' />"><spring:message code='knowledge.mgmt.list.articles' /></a></p>
            </li>
            <c:if test="${sessionScope.userAccount.userRole eq SecurityUserRole.ADMIN or sessionScope.userAccount.userRole eq SecurityUserRole.SITE_ADMIN}">
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/knowledge-management/list-articles/pending-approval' />" title="<spring:message code='knowledge.mgmt.approve.articles' />"><spring:message code='knowledge.mgmt.approve.articles' /></a></p>
            </c:if>
        </ul>
    </div>
</div>
<br class="clear" />
