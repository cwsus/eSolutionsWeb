<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includePortalTaglibs.jspf" %>

<%-- lazy load the selection path array --%>
<portal-core:lazy-set var="selectionPath" elExpression="wp.selectionModel.selectionPath"/>

<%-- Display the breadcrumb when the current page is at least 3 levels away from the navigation content root --%>
<c:if test="${fn:length(selectionPath) > 3}">
<portal-navigation:uiNavigationModel var="uiNavigationModel" mobileDeviceClassTest="smartphone/tablet" >
	<div class="wpthemeCrumbTrail wpthemeLeft">

		<%-- Loop through the selection path starting at the primary navigation level (2) --%>
		<c:forEach var="node" items="${selectionPath}" begin="2" varStatus="status">

			<c:set var="uiNode" value="${uiNavigationModel[node]}" scope="page"/>
			<c:if test="${pageScope.uiNode != null}">

				<%-- Print out a separator before the page title if it is not the first item in the breadcrumb --%>
				<c:if test="${status.count > 1}">
					<span class="wpthemeCrumbTrailSeparator">&gt;</span>
				</c:if>

				<%-- if the node is currently selected, make it bold --%>
				<c:if test="${pageScope.uiNode.isSelected}"><strong></c:if>

				<%-- if the node is not currently selected, make the title a link --%>
				<c:if test="${!pageScope.uiNode.isSelected}"><a href="${pageScope.uiNode.urlGeneration.autoNavigationalState}"></c:if>

					<%-- set the CSS class to be placed on the page title anchor below --%>
					<c:set var="titleClass" value="" scope="page"/>
					<c:if test="${pageScope.uiNode.isHidden || pageScope.uiNode.isDraft}">
						<c:choose>
						<%-- if the page is BOTH in the current project and hidden, choose the wpthemeHiddenDraftPageText class --%>
						<c:when test="${pageScope.uiNode.isHidden && pageScope.uiNode.isDraft}"><c:set var="titleClass" value=" wpthemeHiddenDraftPageText" scope="page"/></c:when>
						<%-- if the page is hidden, choose the wpthemeHiddenPageText class --%>
						<c:when test="${pageScope.uiNode.isHidden}"><c:set var="titleClass" value=" wpthemeHiddenPageText" scope="page"/></c:when>
						<%-- if the page has a draft in the current project, choose the wpthemeDraftPageText class --%>
						<c:otherwise><c:set var="titleClass" value=" wpthemeDraftPageText" scope="page"/></c:otherwise>
						</c:choose>
					</c:if>

					<%-- add a CSS class if the node is currently selected --%>
					<span class="${pageScope.titleClass}<c:if test="${pageScope.uiNode.isSelected}"> wpthemeSelected</c:if>" lang="${pageScope.uiNode.title.xmlLocale}" dir="${pageScope.uiNode.title.direction}">
								
						<!-- print out the page title -->
						<c:out value="${pageScope.uiNode.title}"/>

					<%-- close all node title markup --%>
					</span>
				<c:if test="${!pageScope.uiNode.isSelected}"></a></c:if>
				<c:if test="${pageScope.uiNode.isSelected}"></strong></c:if>

			</c:if>
		</c:forEach>
	</div><%-- close breadcrumb container --%>
</portal-navigation:uiNavigationModel>
</c:if>