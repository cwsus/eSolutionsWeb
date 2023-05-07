<%@ page session="true" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includePortalTaglibs.jspf" %>

<div id="header">
	<div class="wrapper">
		<br class="clear" />
	</div>
</div>

<div id="topbar">
	<div class="wrapper">
  		<c:if test="${not empty fn:trim(sessionScope.userAccount)}">
			<div id="topnav">
				<ul>
	    			<li><a href="<c:url value='/ui/datacenter-management/default' />" title="theme.navbar.datacenter-mgmt">DC</a></li>
					<li><a href="<c:url value='/ui/dns-service/default' />" title="theme.navbar.dns-services>DNS</a></li>
					<li><a href="<c:url value='/ui/knowledge-management/default' />" title="theme.navbar.knowledge">KBASE</a></li>
					<li><a href="<c:url value='/ui/server-management/default' />" title="theme.navbar.server-mgmt">SRVR</a></li>
					<c:if test="${fn:trim(sessionScope.userAccount.userRole) eq SecurityUserRole.USER_ADMIN or fn:trim(sessionScope.userAccount.userRole) eq SecurityUserRole.SITE_ADMIN}">
						<li class="last"><a href="<c:url value='/ui/user-management/default' />" title="theme.navbar.useradmin>USERS</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
  		<br class="clear" />
	</div>
</div>