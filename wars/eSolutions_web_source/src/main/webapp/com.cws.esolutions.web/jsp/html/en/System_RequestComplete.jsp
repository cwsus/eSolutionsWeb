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
 * Package: com.cws.esolutions.web\jsp\html\en
 * File: System_Unauthorized.jsp
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

<h1><fmt:message key="theme.system.request.complete" bundle="${theme}" /></h1>
<fmt:message key="theme.system.request.complete" bundle="${theme}" />

<%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

<c:choose>
    <c:when test="${empty fn:trim(sessionScope.userAccount) or empty fn:trim(sessionScope.userAccount.status)}">
        <p><a href="<c:url value='/ui/login/default' />" title="<fmt:message key='theme.navbar.login' bundle="${theme}" />"><fmt:message key="theme.click.continue" bundle="${theme}" /></a></p>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${sessionScope.userAccount.status == 'SUCCESS'}">
                <p><a href="<c:url value='/ui/common/default' />" title="<fmt:message key='theme.navbar.home' bundle="${theme}" />"><fmt:message key="theme.click.continue" bundle="${theme}" /></a></p>
            </c:when>
            <c:otherwise>
                <p><a href="<c:url value='/ui/login/default' />" title="<fmt:message key='theme.navbar.login' bundle="${theme}" />"><fmt:message key="theme.click.continue" bundle="${theme}" /></a></p>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>
