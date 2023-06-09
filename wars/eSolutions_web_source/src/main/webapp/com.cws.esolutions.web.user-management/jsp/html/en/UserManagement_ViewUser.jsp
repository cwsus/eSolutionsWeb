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
 * File: UserManagement_CreateUser.jsp
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

<script type="text/javascript">
    function changeView()
    {
        document.getElementById('userRoleInput').style.display = 'none';
        document.getElementById('userRoleModify').style.display = 'block';
        document.getElementById('selectRoleChange').style.display = 'none';
        document.getElementById('submitRoleChange').style.display = 'block';
    }

    function submitRoleChange(selectable)
    {
        var newRole = selectable.options[selectable.selectedIndex].text;

        window.location.href = '${pageContext.request.contextPath}/ui/user-management/change-role/account/${foundAccount.guid}/role/' + newRole;
    }
</script>

<div id="content">
    <h1><spring:message code="user.mgmt.view.user" arguments="${foundAccount.username}" /></h1>

    <%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

    <table id="viewUser">
        <tr>
            <td><label><spring:message code="user.mgmt.user.name" /></label></td>
            <td>${foundAccount.username}</td>
            <c:if test="${sessionScope.userAccount.userRole eq 'USER_ADMIN' or sessionScope.userAccount.userRole eq 'SITE_ADMIN' or sessionScope.userAccount.userRole eq 'ADMIN'}">
                <td><a href="<c:url value='/ui/user-management/reset/account/${foundAccount.guid}' />"title="<spring:message code='user.account.change.password' />"><spring:message code='user.account.change.password' /></a></td>
            </c:if>
        </tr>
        <tr>
            <td><label><spring:message code="user.mgmt.user.role" /></label></td>
            <td id="userRoleInput" style="display: block;">${foundAccount.userRole}</td>
            <c:if test="${sessionScope.userAccount.userRole eq 'USER_ADMIN' or sessionScope.userAccount.userRole eq 'SITE_ADMIN' or sessionScope.userAccount.userRole eq 'ADMIN'}">
                <td id="userRoleModify" style="display: none;">
                    <select name="selectRole" id="selectRole">
                        <option value="${foundAccount.userRole}" selected="selected">${foundAccount.userRole}</option>
                        <option><fmt:message key="theme.option.select" bundle="${theme}" /></option>
                        <option><fmt:message key="theme.option.spacer" bundle="${theme}" /></option>
                        <c:forEach var="role" items="${userRoles}">
                            <option value="${role}">${role}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <a id="selectRoleChange" href="#" onclick="changeView();"
                        title="<spring:message code='user.mgmt.change.role' />" style="display: block;"><spring:message code='user.mgmt.change.role' /></a>
                    <a id="submitRoleChange" href="#" onclick="submitRoleChange(document.getElementById('selectRole'));"
                        title="<spring:message code='user.mgmt.change.role' />" style="display: none;"><spring:message code='user.mgmt.change.role' /></a>
                </td>
            </c:if>
        </tr>
        <tr>
            <td><label><spring:message code="user.mgmt.user.givenname" /></label></td>
            <td>${foundAccount.givenName}</td>
        </tr>
        <tr>
            <td><label><spring:message code="user.mgmt.user.surname" /></label></td>
            <td>${foundAccount.surname}</td>
        </tr>
        <tr>
            <td><label><spring:message code="user.mgmt.user.email" /></label></td>
            <td>
                <a href="mailto:${foundAccount.emailAddr}" title="">${foundAccount.emailAddr}</a>
            </td>
        </tr>
        <tr>
            <td><label><spring:message code="user.mgmt.user.locked" /></label></td>
            <c:choose>
                <c:when test="${foundAccount.failedCount ge 3}">
                    <td><fmt:message key="theme.true" bundle="${theme}" /></td>
                    <c:if test="${sessionScope.userAccount.userRole eq 'USER_ADMIN' or sessionScope.userAccount.userRole eq 'SITE_ADMIN' or sessionScope.userAccount.userRole eq 'ADMIN'}">
                        <td>
                            <a href="<c:url value='/ui/user-management/unlock/account/${foundAccount.guid}' />"
                                title="<spring:message code='user.mgmt.unlock.account' />"><spring:message code='user.mgmt.unlock.account' /></a>
                        </td>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <td><fmt:message key="theme.false" bundle="${theme}" /></td>
                    <c:if test="${sessionScope.userAccount.userRole eq 'USER_ADMIN' or sessionScope.userAccount.userRole eq 'SITE_ADMIN' or sessionScope.userAccount.userRole eq 'ADMIN'}">
                        <td>
                            <a href="${pageContext.request.contextPath}/ui/user-management/lock/account/${foundAccount.guid}"
                                title="<spring:message code='user.mgmt.lock.account' />"><spring:message code='user.mgmt.lock.account' /></a>
                        </td>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </tr>
        <tr>
            <td><label><spring:message code="user.mgmt.last.logon" /></label></td>
            <td>${foundAccount.lastLogin}</td>
        </tr>
        <tr>
            <td><label><spring:message code="user.mgmt.suspend.account" /></label></td>
            <td>${foundAccount.suspended}</td>
            <c:if test="${sessionScope.userAccount.userRole eq 'USER_ADMIN' or sessionScope.userAccount.userRole eq 'SITE_ADMIN'}">
                <c:choose>
                    <c:when test="${foundAccount.suspended eq 'true'}">
                        <td><a href="<c:url value='/ui/user-management/unsuspend/account/${foundAccount.guid}' />" title="<spring:message code='user.mgmt.unsuspend.account' />"><spring:message code='user.mgmt.unsuspend.account' /></a></td>
                    </c:when>
                    <c:otherwise>
                        <td><a href="<c:url value='/ui/user-management/suspend/account/${foundAccount.guid}' />" title="<spring:message code='user.mgmt.suspend.account' />"><spring:message code='user.mgmt.suspend.account' /></a></td>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </tr>
    </table>
</div>

<div id="column">
    <div class="holder">
        <h1><spring:message code="user.mgmt.header" /></h1>
        <ul id="latestnews">
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-management/default' />" title="<fmt:message key='theme.search.banner' bundle='${theme}' />"><fmt:message key="theme.search.banner" bundle="${theme}" /></a></p>
            </li>
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-management/add-user' />" title="<spring:message code='user.mgmt.create.user' />"><spring:message code="user.mgmt.create.user" /></a></p>
            </li>
        </ul>
    </div>
    <br class="clear" />
    <div class="holder">
        <h1><spring:message code="user.mgmt.this.account" /></h1>
        <ul id="latestnews">
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-management/audit/account/${foundAccount.guid}' />" title="<spring:message code='user.mgmt.audit.user' />"><spring:message code='user.mgmt.audit.user' /></a></p>
            </li>
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/user-management/disable/account/${foundAccount.guid}' />" title="<spring:message code='user.mgmt.remove.user' />"><spring:message code='user.mgmt.remove.user' /></a></p>
            </li>
        </ul>
    </div>
</div>
<br class="clear" />
