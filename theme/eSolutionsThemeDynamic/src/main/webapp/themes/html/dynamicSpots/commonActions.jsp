<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<portal-core:constants/>
<portal-core:defineObjects/>

<fmt:setBundle basename="nls.theme.resources" var="resources" />

<div id="topbar">
    <div class="wrapper">
        <c:if test="${not empty fn:trim(sessionScope.userAccount)}">
            <div id="topnav">
                <ul>
                    <li><a href="<c:url value='/ui/datacenter-management/default' />" title="<fmt:message key='theme.navbar.datacenter-mgmt' bundle='${resources}' />"><fmt:message key='theme.navbar.datacenter-mgmt' bundle='${resources}' /></a></li>
                    <li><a href="<c:url value='/ui/dns-service/default' />" title="<fmt:message key='theme.navbar.dns-services' bundle='${resources}' />"><fmt:message key='theme.navbar.dns-services' bundle='${resources}' /></a></li>
                    <li><a href="<c:url value='/ui/knowledge-management/default' />" title="<fmt:message key='theme.navbar.knowledge' bundle='${resources}' />"><fmt:message key='theme.navbar.knowledge' bundle='${resources}' /></a></li>
                    <li><a href="<c:url value='/ui/server-management/default' />" title="<fmt:message key='theme.navbar.server-mgmt' bundle='${resources}' />"><fmt:message key='theme.navbar.server-mgmt' bundle='${resources}' /></a></li>
                    <c:if test="${fn:trim(sessionScope.userAccount.userRole) eq SecurityUserRole.USER_ADMIN or fn:trim(sessionScope.userAccount.userRole) eq SecurityUserRole.SITE_ADMIN}">
                        <li class="last"><a href="<c:url value='/ui/user-management/default' />" title="<fmt:message key='theme.navbar.useradmin' bundle='${resources}' />"><fmt:message key='theme.navbar.useradmin' bundle='${resources}' /></a></li>
                    </c:if>
                </ul>
            </div>
        </c:if>
        <br class="clear" />
    </div>
</div>
