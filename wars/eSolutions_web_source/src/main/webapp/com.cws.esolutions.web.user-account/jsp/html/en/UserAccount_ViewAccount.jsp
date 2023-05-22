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

<div id="content">  
    <h1><spring:message code="user.account.view.profile" arguments="${sessionScope.userAccount.displayName}" /></h1>

    <%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

    <table id="viewUserAccount">
        <tr>
            <td><label><spring:message code="user.account.username" /></label></td>
            <td>${sessionScope.userAccount.username}</td>
        </tr>
        <tr>
            <td><label><spring:message code="user.account.name" /></label></td>
            <td>${sessionScope.userAccount.displayName}</td>
        </tr>
        <tr>
            <td><label><spring:message code="user.account.givenname" /></label></td>
            <td>${sessionScope.userAccount.givenName}</td>
        </tr>
        <tr>
            <td><label><spring:message code="user.account.surname" /></label></td>
            <td>${sessionScope.userAccount.surname}</td>
        </tr>
        <tr>
            <td><label><spring:message code="user.account.telephone" /></label></td>
            <td><a href="<c:url value='tel:${sessionScope.userAccount.telephoneNumber}' />" title="${sessionScope.userAccount.telephoneNumber}">${sessionScope.userAccount.telephoneNumber}</a></td>
        </tr>
        <tr>
            <td><label><spring:message code="user.account.pager" /></label></td>
            <td><a href="<c:url value='tel:${sessionScope.userAccount.pagerNumber}' />" title="${sessionScope.userAccount.pagerNumber}">${sessionScope.userAccount.pagerNumber}</a></td>
        </tr>
        <tr>
            <td><label><spring:message code="user.account.email.addr" /></label></td>
            <td><a href="<c:url value='mailto:${sessionScope.userAccount.emailAddr}' />" title="${sessionScope.userAccount.emailAddr}">${sessionScope.userAccount.emailAddr}</a></td>
        </tr>
    </table>
</div>

<div id="column">
    <div class="holder">
        <h1><spring:message code="user.account.select.options" /></h1>
        <ul id="latestnews">
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-account/email' />" title="<spring:message code='user.account.change.email' />"><spring:message code="user.account.change.email" /></a></p>
            </li>
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-account/contact' />" title="<spring:message code='user.account.change.contact' />"><spring:message code="user.account.change.contact" /></a></p>
            </li>
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-account/password' />" title="<spring:message code='user.account.change.password' />"><spring:message code="user.account.change.password" /></a></p>
            </li>
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-account/security' />" title="<spring:message code='user.account.change.security.questions' />"><spring:message code="user.account.change.security.questions" /></a></p>
            </li>
        </ul>
    </div>
</div>
<br class="clear" />
