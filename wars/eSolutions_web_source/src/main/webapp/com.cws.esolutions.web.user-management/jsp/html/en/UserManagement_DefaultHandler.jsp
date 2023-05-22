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
 * Package: com.cws.esolutions.web.dnsservice\jsp\html\en
 * File: DNSService_ServiceLookup.jsp
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
        if (theForm.searchTerms.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<fmt:message key="theme.provide.search.terms' bundle="${theme}" />';
            document.getElementById('txtSearchTerms').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('searchTerms').focus();

            return;
        }

        theForm.submit();
    }
</script>

<div id="content">
    <%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

    <form:form id="searchUserAccounts" name="searchUserAccounts" action="${pageContext.request.contextPath}/ui/user-management/search" method="post">
        <label id="txtSearchTerms"><spring:message code="user.mgmt.search.terms" /><br /></label>
        <form:input path="searchTerms" id="searchTerms" />
        <form:errors path="searchTerms" cssClass="error" />
        <br /><br />
        <input type="button" name="execute" value="<fmt:message key='theme.button.submit.text' bundle='${theme}' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form);" />
        <input type="button" name="reset" value="<fmt:message key='theme.button.reset.text' bundle='${theme}' />" id="reset" class="submit" onclick="clearForm();" />
    </form:form>

    <br class="clear" />
    <br class="clear" />

    <c:if test="${not empty fn:trim(requestScope.searchResults)}">
        <h1><fmt:message key="theme.search.results" bundle="${theme}" /></h1>
        <table id="userSearchResults">
            <tr>
                <td><spring:message code="user.mgmt.user.name" /></td>
                <td><spring:message code="user.mgmt.display.name" /></td>
            </tr>
            <c:forEach var="userResult" items="${requestScope.searchResults}">
                <tr>
                    <td><a href="<c:url value='/ui/user-management/view/account/${userResult.guid}' />" title="${userResult.username}">${userResult.username}</a></td>
                    <td>${userResult.displayName}</td>
                </tr>
            </c:forEach>
        </table>

        <c:if test="${pages gt 1}">
            <br />
            <hr />
            <table>
                <tr>
                    <c:forEach begin="1" end="${pages}" var="i">
                        <c:choose>
                            <c:when test="${page eq i}">
                                <td>${i}</td>
                            </c:when>
                            <c:otherwise>
                                <td>
                                    <a href="<c:url value='/user-management/search/terms/${searchTerms}/type/${searchType}/page/${i}' />" title="${i}">${i}</a>
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </tr>
            </table>
        </c:if>
    </c:if>
</div>

<div id="column">
    <div class="holder">
        <h1><fmt:message key="user.mgmt.header" /></h1>
        <ul id="latestnews">
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-management/add-user' />" title="<spring:message code='user.mgmt.create.user' />"><spring:message code="user.mgmt.create.user" /></a></p>
            </li>
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-management/list-users' />" title="<spring:message code='user.mgmt.list.users' />"><spring:message code="user.mgmt.list.users" /></a></p>
            </li>
        </ul>
    </div>
</div>
<br class="clear" />
