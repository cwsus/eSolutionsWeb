<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<portal-core:constants/>
<portal-core:defineObjects/>

<fmt:setBundle basename="nls.theme.resources" var="resources" />

<div class="wpthemeFooterCol wpthemeLeft">
	<h3>insert text here</h3>
	<ul>
        <c:if test="${not empty fn:trim(sessionScope.userAccount)}">
            Welcome<br /><br />
            <li><a href="<c:url value='/ui/common/default' />" title="<fmt:message key='theme.navbar.homepage' bundle='${resources}' />"><fmt:message key='theme.navbar.homepage' bundle='${resources}' /></a></li>
            <li><a href="<c:url value='/ui/auth/logout' />" title="<fmt:message key='theme.navbar.logoff' bundle='${resources}' />"><fmt:message key='theme.navbar.logoff' bundle='${resources}' /></a></li>
            <li><a href="<c:url value='/ui/user-account/default' />" title="<fmt:message key='theme.navbar.myaccount' bundle='${resources}' />"><fmt:message key='theme.navbar.myaccount' bundle='${resources}' /></a></li>
        </c:if>
        <li><a href="<c:url value='/ui/common/contact' />" title="<spring:message code='theme.contact.us' bundle='${resources}' />"><fmt:message key='theme.contact.us' bundle='${resources}' /></a></li>
    </ul>
</div>
<div class="wpthemeFooterCol wpthemeRight">
	<h3><fmt:message key="theme.footer.more.info" bundle="${resources}" /></h3>
	<p class="legalClaim">&copy; <fmt:message key="theme.footer.copyright" bundle='${resources}' /></p>
	<p class="legalClaim" id="allRightsRes"><fmt:message key="theme.footer.allrights" bundle='${resources}' /></p>
</div> 

<%-- On smartphones, scroll the screen down on page load. This hides the top navigation to save real estate --%>
<portal-logic:if deviceClass="smartphone">
	<script>window.scrollTo(0, 47);</script>
</portal-logic:if>


