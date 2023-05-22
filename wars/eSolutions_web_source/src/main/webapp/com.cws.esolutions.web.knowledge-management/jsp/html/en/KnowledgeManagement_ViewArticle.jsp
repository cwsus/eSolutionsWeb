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

<div id="content">
    <%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

    <c:choose>
        <c:when test="${not empty articleData}">
            <h1><spring:message code="knowledge.article.title" arguments="${articleData.title}" /></h1>
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
                        <td>${articleData.keywords}</td>
                        <td>${articleData.symptoms}</td>
                        <td>${articleData.cause}</td>
                    </tr>
                </tbody>
            </table>
            <br class="clear" />
            ${articleData.resolution}
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
                        <td>${articleData.author.displayName}</td>
                        <td>${articleData.approvedBy.displayName}</td>
                        <td>${articleData.approveDate}</td>
                    </tr>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <spring:message code="knowledge.article.load.failed" />
        </c:otherwise>
    </c:choose>
    <br class="clear" />
</div>

<div id="column">
    <div class="holder">
        <h1><spring:message code="knowledge.mgmt.header" /></h1>
        <ul id="latestnews">
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/knowledge-management/default' />" title="<fmt:message key='theme.search.banner' bundle='${theme}' />"><fmt:message key="theme.search.banner" bundle="${theme}" /></a></p>
            </li>
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/knowledge-management/list-articles' />" title="<spring:message code='knowledge.mgmt.list.articles' />"><spring:message code='knowledge.mgmt.list.articles' /></a></p>
            </li>
            <li>
                <img class="imgl" src="/static/layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/knowledge-management/add-article' />" title="<spring:message code='knowledge.mgmt.add.article' />"><spring:message code='knowledge.mgmt.add.article' /></a></p>
            </li>
            <c:if test="${sessionScope.userAccount.userRole eq SecurityUserRole.ADMIN or sessionScope.userAccount.userRole eq SecurityUserRole.SITE_ADMIN}">
                <li class="last">
                    <img class="imgl" src="layout/images/blue_file.gif" alt="" />
                    <p><a href="<c:url value='/ui/knowledge-management/list-articles/pending-approval' />" title="<spring:message code='knowledge.mgmt.approve.articles' />"><spring:message code='knowledge.mgmt.approve.articles' /></a></p>
                </li>
            </c:if>
        </ul>
    </div>
</div>
<br class="clear" />
