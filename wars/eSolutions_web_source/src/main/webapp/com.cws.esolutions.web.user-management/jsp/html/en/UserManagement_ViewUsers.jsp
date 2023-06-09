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
    <h1><spring:message code="user.mgmt.list.users" /></h1>

    <%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

    <c:choose>
        <c:when test="${not empty userList}">
            <table>
                <thead>
                    <tr>
                        <th><label><spring:message code="user.mgmt.user.name" /></label></th>
                        <th><label><spring:message code="user.mgmt.user.role" /></label></th>
                        <th><label><spring:message code="user.mgmt.mgmt.lastlogin" /></label></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td><a href="<c:url value='/ui/user-management/view/account/${user.guid}' />" title="${user.username}">${user.username}</a></td>
                            <td>${user.userRole}</td>
                            <td>${user.lastLogin}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br class="clear" />
            <br class="clear" />
            <c:if test="${pages gt 1}">
                <br />
                <hr />
                <table>
                    <tr>
                        <c:forEach begin="1" end="${pages}" var="i">
                            <c:set var="pageCount" value="${i}" />

                            <c:choose>
                                <c:when test="${page eq i}">
                                    <td>${i}</td>
                                    <c:if test="${pageCount gt 10 and i eq 10}">
                                        <td><a href="<c:url value='/user-management/audit/account/${foundAccount.guid}/page/10' />" title="Next">Next</a></td>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value='/user-management/audit/account/${foundAccount.guid}/page/${i}' />" title="${i}">${i}</a></td>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </tr>
                </table>
            </c:if>
        </c:when>
        <c:otherwise>
            <spring:message code="user.mgmt.no.audit.found" />
        </c:otherwise>
    </c:choose>
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
</div>
<br class="clear" />
