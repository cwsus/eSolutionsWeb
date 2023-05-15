<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includePortalTaglibs.jspf" %>

<%-- This file displays navigation for a given type --%>
<%-- Types:
    top: displays the children of level 0
    primary: displays the children of level 1
    secondary: displays the children of levels 2 and 3
 --%>

<%-- lazy load the selection path array --%>
<portal-core:lazy-set var="selectionPath" elExpression="wp.selectionModel.selectionPath"/>

<%-- define the startLevel, endLevel, root CSS class and root accessibility label for each type of navigation --%>
<c:choose>
<c:when test="${param.type == 'primary'}">
    <c:set var="startLevel" value="1" scope="page"/>
    <c:set var="endLevel" value="1" scope="page"/>
    <c:set var="rootClass" value="wpthemePrimaryNav wpthemeLeft" scope="page"/>
    <c:set var="rootLabel" value="Portal Application" scope="page"/>
</c:when>
<c:when test="${param.type == 'secondary'}">
    <c:set var="startLevel" value="2" scope="page"/>
    <c:set var="endLevel" value="3" scope="page"/>
    <%-- if the selection path length is longer than 4, 
    display the last two levels in the selection path instead of levels 2 and 3.
    This ensures the currently selected page appears in the navigation --%>
    <c:set var="selectionPathLength" value="${fn:length(selectionPath)}" scope="page" />
    <c:if test="${(pageScope.selectionPathLength > pageScope.startLevel + 1)}">
        <c:set var="startLevel" value="${pageScope.selectionPathLength - 2}" scope="page"/>    
        <c:set var="endLevel" value="${pageScope.selectionPathLength}" scope="page"/> 
    </c:if>
    <c:set var="rootClass" value="wpthemeSecondaryNav" scope="page"/>
    <c:set var="rootLabel" value="Application" scope="page"/>
</c:when>
<c:when test="${param.type == 'tertiary'}">
    <c:set var="startLevel" value="4" scope="page"/>
    <c:set var="endLevel" value="4" scope="page"/>
    <c:set var="rootClass" value="wpthemeTertiaryNav" scope="page"/>
    <c:set var="rootLabel" value="Application Children" scope="page"/>
</c:when>
<c:otherwise> <%-- top and default values --%>
    <c:set var="startLevel" value="0" scope="page"/>
    <c:set var="endLevel" value="0" scope="page"/>
    <c:set var="rootClass" value="wpthemeHeaderNav" scope="page"/>
    <c:set var="rootLabel" value="Portal" scope="page"/>
</c:otherwise>
</c:choose>

<portal-navigation:uiNavigationModel var="uiNavigationModel" mobileDeviceClassTest="smartphone/tablet" >

<%-- loop through from startLevel to endLevel, outputing a navigation for each level --%>
<c:forEach var="n" items="${selectionPath}" varStatus="status" begin="${pageScope.startLevel}" end="${pageScope.endLevel}" step="1">
    <c:set var="curLevel" value="${pageScope.startLevel + (status.count-1)}" scope="page"/> 

<%-- print out navigation if the selection path is not empty and children exist --%>
<c:if test="${(fn:length(selectionPath) > pageScope.curLevel) && uiNavigationModel.hasChildren[selectionPath[pageScope.curLevel]]}">

    <%-- open the navigation containers --%>
    <div class="wpthemeNavContainer${status.count}">
        <nav class="${pageScope.rootClass}" aria-label="${pageScope.rootLabel}<c:if test='${status.count > 1}'> ${status.count}</c:if>" role="navigation" tabindex="-1">
            <ul class="wpthemeNavList">

                <%-- loop through all children of the page at the given curLevel --%>
                <c:forEach var="node" items="${uiNavigationModel.children[selectionPath[pageScope.curLevel]]}">

                    <%-- print out the page and highlight it if it is in the selection path (the current page or an ancestor of the current page) --%>
                    <li class="wpthemeNavListItem wpthemeLeft<c:if test="${node.isInSelectionPath}"> wpthemeSelected</c:if>">

                        <%-- output a link to the page --%>
                        <a href="${fn:escapeXml(node.urlGeneration.autoNavigationalState.clearScreenTemplate)}" class="wpthemeLeft ${node.isHidden ? 'wpthemeHiddenPageText' : ''} ${node.isDraft? 'wpthemeDraftPageText' : ''}">

                            <%-- start page title markup --%>
                            <span lang="${node.title.xmlLocale}" dir="${node.title.direction}"><%--
                                
                                <!-- print out the page title -->
                                --%><c:out value="${node.title}"/><%--
                                
                                <!-- mark the page if it is currently selected for accessibility -->
                                --%><c:if test="${node.isSelected}"><span class="wpthemeAccess"><portal-fmt:text key="currently_selected" bundle="nls.commonTheme"/></span></c:if><%--

                            --%></span><%-- end page title markup --%>
                        </a>

                        <%-- output the close icon for dynamic pages --%>
                        <portal-dynamicui:closePage node="${node}">
                            <a class="wpthemeClose wpthemeLeft" href="<%closePageURL.write(out);%>" aria-label="<portal-fmt:text key="theme.close" bundle="nls.commonUI"/>">&#10799;</a>
                        </portal-dynamicui:closePage>

                    </li>

                </c:forEach>

            </ul>
        </nav>
        <div class="wpthemeClear"></div>
    </div>

</c:if>
</c:forEach>
</portal-navigation:uiNavigationModel>