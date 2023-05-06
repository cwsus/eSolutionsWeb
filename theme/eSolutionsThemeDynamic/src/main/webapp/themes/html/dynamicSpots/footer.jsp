<%@ page session="false" buffer="none" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<portal-core:constants/><portal-core:defineObjects/>

<div id="footer">
	<div class="wrapper">
		<c:if test="${not empty fn:trim(sessionScope.userAccount)}">
		    Welcome1<br /><br />
                  <a href="<c:url value='/ui/common/default' />" title="<spring:message code='theme.navbar.homepage' />">Homepage</a> |
			<a href="<c:url value='/ui/auth/logout' />" title="<spring:message code='theme.navbar.logoff' />">Logoff</a> |
			<a href="<c:url value='/ui/user-account/default' />" title="<spring:message code='theme.navbar.myaccount' />">My Account</a> |
                  <a href="<c:url value='/ui/common/contact' />" title="<spring:message code='theme.contact.us' />">Contact Us</a>
		</c:if>
		<br class="clear" />
	</div>

	<div id="copyright">
  		<div class="wrapper">
            &copy; CWS
            <br class="clear" />
            <strong>More Info:</strong><a href="<c:url value='http://www.caspersbox.com/cws/ui/home/default' />"
                title="CaspersBox Web Services" target="_blank">Homepage</a><br />
		    <br class="clear" />
		</div>
	</div>
</div>
<%-- On smartphones, scroll the screen down on page load. This hides the top navigation to save real estate --%>
<portal-logic:if deviceClass="smartphone">
	<script>window.scrollTo(0, 47);</script>
</portal-logic:if>
