<%@ page session="false" buffer="none" import="java.util.*, java.net.*, javax.portlet.*, javax.servlet.ServletRequest"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<portal-core:constants/><portal-core:defineObjects/>

<div class="wpthemeFooterCol wpthemeLeft">
	<h3><portal-fmt:text escapeXml="true" key="helpandsupport.title" bundle="nls.commonUI"/></h3>
	<ul>
		<li><a href="https://help.hcltechsw.com/digital-experience/dx/wp_welcome_portal.html" target="_blank"><span><portal-fmt:text escapeXml="true" key="helpandsupport.documentation" bundle="nls.commonUI"/></span></a></li>
		<li><a href="https://hclpnpsupport.hcltech.com/csm?id=kb_view2" target="_blank"><span><portal-fmt:text escapeXml="true" key="helpandsupport.knowledgebase" bundle="nls.commonUI"/></span></a></li>
		<li><a href="https://hclpnpsupport.hcltech.com/csm" target="_blank"><span><portal-fmt:text escapeXml="true" key="helpandsupport.support" bundle="nls.commonUI"/></span></a></li>
		<li><a href="https://www.hcltechsw.com/products/dx" target="_blank"><span><portal-fmt:text escapeXml="true" key="helpandsupport.supportedhardwareandsoftware" bundle="nls.commonUI"/></span></a></li>
	</ul>
</div>
<div class="wpthemeFooterCol wpthemeRight">
	<h3><portal-fmt:text escapeXml="true" key="abouthcldigitalexperience.title" bundle="nls.commonUI"/></h3>
	<ul>
		<li><a href="https://www.hcltechsw.com/products/dx" target="_blank"><span><portal-fmt:text escapeXml="true" key="abouthcldigitalexperience.productinfo" bundle="nls.commonUI"/></span></a></li>
		<li><a href="https://www.hcltechsw.com" target="_blank"><span><portal-fmt:text escapeXml="true" key="abouthcldigitalexperience.hclsoftware" bundle="nls.commonUI"/></span></a></li>
		<li><a href="https://www.hcltech.com" target="_blank"><span><portal-fmt:text escapeXml="true" key="abouthcldigitalexperience.hcltechnologies" bundle="nls.commonUI"/></span></a></li>
	</ul>
	<p class="legalClaim">&copy; <portal-fmt:text escapeXml="true" key="Copyright" bundle="nls.commonUI"/></p>
	<p class="legalClaim" id="allRightsRes"><portal-fmt:text escapeXml="true" key="AllRightsRes" bundle="nls.commonUI"/></p>
</div> 

<%-- On smartphones, scroll the screen down on page load. This hides the top navigation to save real estate --%>
<portal-logic:if deviceClass="smartphone">
	<script>window.scrollTo(0, 47);</script>
</portal-logic:if>


