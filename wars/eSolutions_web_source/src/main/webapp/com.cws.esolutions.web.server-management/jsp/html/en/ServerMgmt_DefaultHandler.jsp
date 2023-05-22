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
        if (theForm.operHostName.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = 'You must provide a hostname or IP address to perform a query against.';
            document.getElementById('txtSearchTerms').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('operHostName').focus();

            return;
        }

        theForm.submit();
    }
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

        <h1><spring:message code="server.mgmt.lookup.host" /></h1>
        <p>
            <form:form id="submitNameLookup" name="submitNameLookup" action="${pageContext.request.contextPath}/ui/server-management/search" method="post">
                <label id="txtAppName"><spring:message code="theme.search.terms" /></label>
                <form:input path="operHostName" />
                <form:errors path="operHostName" cssClass="error" />
                <br /><br />
                <input type="button" name="execute" value="<spring:message code='theme.button.submit.text' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form);" />
                <input type="button" name="reset" value="<spring:message code='theme.button.reset.text' />" id="reset" class="submit" onclick="clearForm();" />
            </form:form>
        </p>
        <br class="clear" />
        <br class="clear" />
        <c:if test="${not empty searchResults}">
            <h1><spring:message code="theme.search.results" /></h1>
            <table id="searchResults">
                <c:forEach var="result" items="${searchResults}">
                    <tr>
                        <td><a href="<c:url value='/ui/server-management/server/${result.serverGuid}' />" title="${result.operHostName}">${result.operHostName}</a></td>
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
                                    <td><a href="<c:url value='/server-management/search/terms/${searchTerms}/page/${i}' />" title="${i}">${i}</a></td>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </tr>
                </table>
            </c:if>
        </c:if>
    </div>
</div>

<div id="container">
    <div class="wrapper">
        <div id="content">
            <h1><spring:message code="server.mgmt.header" /></h1>
            <ul>
                <li><a href="<c:url value='/ui/server-management/add-server' />" title="<spring:message code='server.mgmt.add.server' />"><spring:message code="server.mgmt.add.server" /></a></li>
                <li><a href="<c:url value='/ui/server-management/install-software' />" title="<spring:message code='server.mgmt.install.software.header' />"><spring:message code="server.mgmt.install.software.header" /></a></li>
                <li><a href="<c:url value='/ui/server-management/server-control' />" title="<spring:message code='server.mgmt.server.control.header' />"><spring:message code='server.mgmt.server.control.header' /></a></li>
            </ul>
        </div>
        <br class="clear" />
    </div>
</div>
