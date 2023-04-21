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

<div id="homecontent">
    <div class="wrapper">
        <div id="error"></div>
        <div id="validationError" style="color: #FF0000"></div>
    
        <c:if test="${not empty fn:trim(messageResponse)}">
            <p id="info">${messageResponse}</p>
        </c:if>
        <c:if test="${not empty fn:trim(errorResponse)}">
            <p id="error">${errorResponse}</p>
        </c:if>
        <c:if test="${not empty fn:trim(responseMessage)}">
            <p id="info"><spring:message code="${responseMessage}" /></p>
        </c:if>
        <c:if test="${not empty fn:trim(errorMessage)}">
            <p id="error"><spring:message code="${errorMessage}" /></p>
        </c:if>
        <c:if test="${not empty fn:trim(param.responseMessage)}">
            <p id="info"><spring:message code="${param.responseMessage}" /></p>
        </c:if>
        <c:if test="${not empty fn:trim(param.errorMessage)}">
            <p id="error"><spring:message code="${param.errorMessage}" /></p>
        </c:if>

        <c:if test="${not empty searchResults}">
            <h1><spring:message code="theme.search.results" /></h1>
            <table id="searchResults">
                <c:forEach var="result" items="${searchResults}">
                    <tr>
                        <c:choose>
                            <c:when test="${isApprovalFlow}">
		                        <td><a href="<c:url value='${pageContext.request.contextPath}/ui/knowledge-management/article/approve/${result.articleId}' />" title="${result.title}">${result.title}</a></td>
		                        <td><a href="<c:url value='${pageContext.request.contextPath}/ui/knowledge-management/article/approve/${result.articleId}' />" title="${result.title}">${result.author.username}</a></td>
                            </c:when>
                            <c:when test="${isReviewFlow}">
                                <td><a href="<c:url value='${pageContext.request.contextPath}/ui/knowledge-management/article/review/${result.articleId}' />" title="${result.title}">${result.title}</a></td>
                                <td><a href="<c:url value='${pageContext.request.contextPath}/ui/knowledge-management/article/review/${result.articleId}' />" title="${result.title}">${result.author.username}</a></td>
                            </c:when>                            
                            <c:otherwise>
		                        <td><a href="<c:url value='${pageContext.request.contextPath}/ui/knowledge-management/article/view/${result.articleId}' />" title="${result.title}">${result.title}</a></td>
		                        <td><a href="<c:url value='${pageContext.request.contextPath}/ui/knowledge-management/article/view/${result.articleId}' />" title="${result.title}">${result.author.username}</a></td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
            </table>

            <c:if test="${pages gt 1}">
                <br />
                <hr />
                <br />
                <table>
                    <tr>
                        <c:forEach begin="1" end="${pages}" var="i">
                            <c:choose>
                                <c:when test="${page eq i}">
                                    <td>${i}</td>
                                </c:when>
                                <c:otherwise>
                                    <td>
                                        <a href="<c:url value='${pageContext.request.contextPath}/knowledge-management/search/terms/${searchTerms}/page/${i}' />" title="${i}">${i}</a>
                                    </td>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </tr>
                </table>
            </c:if>
        </c:if>
        <br class="clear" />
    </div>
</div>

<div id="container">
    <div class="wrapper">
        <div id="content">
            <h1><spring:message code="knowledge.mgmt.header" /></h1>
            <ul>
                <li><a href="<c:url value='${pageContext.request.contextPath}/ui/knowledge-management/default' />" title="<spring:message code='theme.search.banner' />"><spring:message code="theme.search.banner" /></a></li>
                <li><a href="<c:url value='${pageContext.request.contextPath}/ui/knowledge-management/add-article' />" title="<spring:message code='knowledge.mgmt.add.article' />"><spring:message code='knowledge.mgmt.add.article' /></a></li>
                <c:if test="${sessionScope.userAccount.userRole eq SecurityUserRole.ADMIN or sessionScope.userAccount.userRole eq SecurityUserRole.SITE_ADMIN}">
                    <li><a href="<c:url value='${pageContext.request.contextPath}/ui/knowledge-management/list-articles/pending-approval' />" title="<spring:message code='knowledge.mgmt.approve.articles' />"><spring:message code='knowledge.mgmt.approve.articles' /></a></li>
                </c:if>
            </ul>
        </div>
        <br class="clear" />
    </div>
</div>
