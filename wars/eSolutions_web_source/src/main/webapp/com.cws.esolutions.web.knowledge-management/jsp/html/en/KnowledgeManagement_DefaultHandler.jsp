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
        if (theForm.name.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<fmt:message key="theme.provide.search.terms" bundle="${theme}" />';
            document.getElementById('txtAppName').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('name').focus();

            return;
        }

        theForm.submit();
    }
</script>

<div id="content">
    <h1><spring:message code="knowledge.mgmt.search.articles" /></h1>

    <%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

    <p>
        <form:form id="searchRequest" name="searchRequest" action="${pageContext.request.contextPath}/ui/knowledge-management/search" method="post">
            <label id="txtSearchTerms"><fmt:message key="theme.search.terms" /></label>
            <form:input path="searchTerms" />
            <form:errors path="searchTerms" cssClass="error" />
            <br /><br />
            <input type="button" name="execute" value="<fmt:message key='theme.button.submit.text' bundle='${theme}' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form);" />
            <input type="button" name="reset" value="<fmt:message key='theme.button.reset.text' bundle='${theme}' />" id="reset" class="submit" onclick="clearForm();" />
        </form:form>
    </p>
    <br class="clear" />
    <br class="clear" />
    <c:if test="${not empty searchResults}">
        <h1><fmt:message key="theme.search.results" bundle="${theme}" /></h1>
        <table id="searchResults">
            <c:forEach var="result" items="${searchResults}">
                <tr>
                    <td><a href="<c:url value='/ui/knowledge-management/article/view/${result.articleId}' />" title="${result.title}">${result.title}</a></td>
                    <td><a href="<c:url value='/ui/knowledge-management/article/view/${result.articleId}' />" title="${result.title}">${result.author.username}</a></td>
                </tr>
            </c:forEach>
        </table>

        <c:if test="${pages gt 1}">
            <br class="clear" />
            <hr />
            <br class="clear" />
            <table>
                <tr>
                    <c:forEach begin="1" end="${pages}" var="i">
                        <c:choose>
                            <c:when test="${page eq i}">
                                <td>${i}</td>
                            </c:when>
                            <c:otherwise>
                                <td><a href="<c:url value='/knowledge-management/search/terms/${searchTerms}/page/${i}' />" title="${i}">${i}</a></td>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </tr>
            </table>
        </c:if>
    </c:if>
    <br class="clear" />
    <c:if test="${not empty articleList}">
        <h1><spring:message code="knowledgebase.article.list" /></h1>
        <table id="articleList">
            <c:forEach var="entry" items="${articleList}">
                <tr>
                    <td><a href="<c:url value='/ui/knowledge-management/article/view/${entry.articleId}' />" title="${entry.title}">${entry.title}</a></td>
                    <td><a href="<c:url value='/ui/knowledge-management/article/view/${entry.articleId}' />" title="${entry.title}">${entry.author.username}</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>

<div id="column">
    <div class="holder">
        <h1><spring:message code="knowledge.mgmt.header" /></h1>
        <ul id="latestnews">
            <li>
                <img class="imgl" src="layout/images/blue_file.gif" alt="" />
                <p><a href="<c:url value='/ui/knowledge-management/list-articles' />" title="<spring:message code='knowledge.mgmt.list.articles' />"><spring:message code='knowledge.mgmt.list.articles' /></a></p>
            </li>
            <li>
                <img class="imgl" src="layout/images/blue_file.gif" alt="" />
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
