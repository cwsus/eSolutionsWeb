<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.ibm.com/xmlns/prod/websphere/portal/v8.5/portal-fmt" prefix="portal-fmt" %>
<%@ taglib uri="http://www.ibm.com/xmlns/prod/websphere/portal/v8.5/portal-core" prefix="portal-core" %>
<%@ taglib uri="http://www.ibm.com/xmlns/prod/websphere/portal/v8.5/portal-logic" prefix="portal-logic" %>
<%@ taglib uri="http://www.ibm.com/xmlns/prod/websphere/portal/v8.5/portal-navigation" prefix="portal-navigation" %>
<%@ taglib uri="http://www.ibm.com/xmlns/prod/websphere/portal/v8.5/resolver" prefix="r" %>

<%-- This JSP prints out the navigation button, children are lazily loaded onclick --%>

<%-- true if hidden pages should be shown in the navigation, this MUST be a string, or r:urlParam will break --%>
<portal-core:lazy-set var="showHiddenPagesBoolean" elExpression=="wp.publicRenderParam['{http://www.ibm.com/xmlns/prod/websphere/portal/publicparams}hiddenPages']"/>
<c:set var="showHiddenPages" value="false" scope="page"/>
<c:if test="${showHiddenPagesBoolean}">
    <c:set var="showHiddenPages" value="true" scope="page"/>
</c:if>

<%-- True if viewing on a tablet device --%>
<portal-logic:if deviceClass="tablet">
    <c:set var="isTablet" value="true" scope="page"/>
</portal-logic:if>

<%-- The navigation root node --%>
<c:set var="root" value="${wp.selectionModel.selectionPath[1]}" scope="page"/>

<%-- True if the root has any visible children --%>
<c:set var="hasVisibleChildren" value="false" scope="page"/>
<portal-navigation:uiNavigationModel var="uiNavigationModel" 
    mobileDeviceClassTest="smartphone/tablet" showHidden="${pageScope.showHiddenPages}">
    <%-- True if the node has any visible children --%>
    <c:set var="hasVisibleChildren" value="${uiNavigationModel.hasChildren[pageScope.root]}" scope="page"/>
</portal-navigation:uiNavigationModel>

<%-- Javascript code that will stop a browser event --%>
<c:set var="cancelEvent" value="if (!event) {if (window.event) event = window.event;} if (event) {if (event.preventDefault) event.preventDefault(); if (event.stopPropagation) event.stopPropagation(); if (event.cancel != null) event.cancel = true; if (event.cancelBubble != null) event.cancelBubble = true;}" scope="page"/>

<%-- Output the navigation icon if there are child pages --%>
<c:if test="${pageScope.hasVisibleChildren}">

    <%-- generate currently selected node ID and selection path IDS --%>
    <c:set var="currentPageID" value="${wp.identification[wp.selectionModel.selected]}" scope="page"/>
    <c:set var="selectionPathIDs" value="" scope="page"/>
    <c:forEach var="node" items="${wp.selectionModel.selectionPath}">
        <c:set var="selectionPathIDs" scope="page">${pageScope.selectionPathIDs} ${wp.identification[node]}</c:set>
    </c:forEach>

    <%-- navigation icon --%>
    <%
        String context = request.getParameter("context");
        if(context == null) context = "";
        if(!context.matches("^[a-zA-Z0-9_\\-/\\.]*$")) context = "";
    %>
    <c:set var="context" scope="page"><%=context%></c:set>
    <c:set var="feedUrl" scope="page"><r:url uri="res:${pageScope.context}/themes/html/dynamicSpots/mobileNavigationFeed.jsp" keepNavigationalState="false" lateBinding="false">
        <r:urlParam name="showHiddenPages" value="${pageScope.showHiddenPages}"/>
        <r:urlParam name="currentPageID" value="${pageScope.currentPageID}"/>
        <r:urlParam name="selectionPathIDs" value="${pageScope.selectionPathIDs}"/>
    </r:url></c:set>
    <a role="button" class="wpthemeNavToggleBtn" aria-label="<portal-fmt:text key="theme.display.nav" bundle="nls.commonUI"/>" title="<portal-fmt:text key="theme.display.nav" bundle="nls.commonUI"/>" href="javascript:;" onclick="wptheme.toggleMobileNavRoot('wpthemeNavRoot','wpthemeNavCollapsed','<portal-fmt:text key="theme.display.nav" bundle="nls.commonUI"/>','<portal-fmt:text key="theme.hide.nav" bundle="nls.commonUI"/>','wpthemeNavRoot','${pageScope.feedUrl}',<c:if test="${pageScope.isTablet}">true</c:if><c:if test="${!pageScope.isTablet}">false</c:if>,'${wp.identification[pageScope.root]}','${pageScope.selectionPathIDs}',0); <c:out value="${pageScope.cancelEvent}"/>" id="wpthemeNavRootLink">
        <img alt="" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="/>
        <span class="wpthemeAltText" id="wpthemeNavRootAccess"><portal-fmt:text key="theme.display.nav" bundle="nls.commonUI"/></span>
    </a>

    <%-- navigation border --%>
    <div class="wpthemeMobileBorder"></div>

    <%-- navigation container div, initially closed --%>
    <div role="navigation" tabindex="-1" aria-expanded="false" aria-label="<portal-fmt:text key="theme.navigation" bundle="nls.commonUI"/>" class="wpthemeNavCollapsed wpthemeMobileNav<c:if test="${pageScope.isTablet}"> wpthemeMobileSide</c:if>" id="wpthemeNavRoot"></div>

    <%-- output a search box at the top of the first level of navigation --%>
    <portal-logic:if loggedIn="yes">
        <div id="wpthemeMobileSearchBoxSource"><r:dataSource uri="dyn-cs:id:wp_search_mobile_dynspot" escape="none"/></div>
    </portal-logic:if>

</c:if>
