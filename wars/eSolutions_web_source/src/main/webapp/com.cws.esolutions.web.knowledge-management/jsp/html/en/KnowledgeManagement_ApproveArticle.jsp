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
<!--
    function validateForm(theForm)
    {
	   theForm.submit()
    }
//-->
</script>

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

        <c:choose>
            <c:when test="${not empty articleData}">
                <form:form id="approveArticle" name="approveArticle" action="${pageContext.request.contextPath}/ui/knowledge-management/approve-article" method="post">
                    <form:hidden path="articleId" value="${articleData.articleId}"/>

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
	                            <td>${sessionScope.userAccount.username}</td>
	                            <td>---</td>
	                        </tr>
	                    </tbody>
	                </table>
		            <br class="clear" /><br class="clear" />
		            <input type="button" name="execute" value="<spring:message code='knowledgebase.approve.article' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form, event);" />
		            <input type="button" name="reset" value="<spring:message code='theme.button.reset.text' />" id="reset" class="submit" onclick="clearForm();" />
		            <input type="button" name="cancel" value="<spring:message code='theme.button.cancel.text' />" id="cancel" class="submit" onclick="redirectOnCancel('/esolutions/ui/knowledge-management/list-pending');" />
                </form:form>
            </c:when>
            <c:otherwise>
                <spring:message code="knowledge.article.load.failed" />
            </c:otherwise>
        </c:choose>
        <br class="clear" />
    </div>
</div>

<div id="container">
    <div class="wrapper">
        <div id="content">
            <h1><spring:message code="knowledge.mgmt.header" /></h1>
            <ul>
                <li><a href="${pageContext.request.contextPath}/ui/knowledge-management/default" title="<spring:message code='theme.search.banner' />"><spring:message code="theme.search.banner" /></a></li>
                <li><a href="${pageContext.request.contextPath}/ui/knowledge-management/list-articles" title="<spring:message code='knowledge.mgmt.list.articles' />"><spring:message code='knowledge.mgmt.list.articles' /></a></li>
                <li><a href="${pageContext.request.contextPath}/ui/knowledge-management/add-article" title="<spring:message code='knowledge.mgmt.add.article' />"><spring:message code='knowledge.mgmt.add.article' /></a></li>
                <c:if test="${sessionScope.userAccount.userRole eq SecurityUserRole.ADMIN or sessionScope.userAccount.userRole eq SecurityUserRole.SITE_ADMIN}">
                    <li><a href="${pageContext.request.contextPath}/ui/knowledge-management/list-articles/pending-approval" title="<spring:message code='knowledge.mgmt.approve.articles' />"><spring:message code='knowledge.mgmt.approve.articles' /></a></li>
                </c:if>
            </ul>
        </div>
        <br class="clear" />
    </div>
</div>
