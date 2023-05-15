<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<portal-core:constants/><portal-core:defineObjects/> <portal-core:stateBase/>

<%-- Lazily load the base path to the current theme, and the current page node object --%>
<portal-core:lazy-set var="themeWebDAVBaseURI" elExpression="wp.themeList.current.metadata['com.ibm.portal.theme.template.ref']"/>
<portal-core:lazy-set var="currentNavNode" elExpression="wp.selectionModel.selected"/>

<%-- Display the page title --%>
<title><c:out value='${wp.title}'/></title>

<%-- Outputs any HTML contributed to the head section by any JSR286 portlets on the page --%>
<portal-core:portletsHeadMarkupElements method="html" filter="title"/>

<%-- Add link for the Portal navigation state --%>
<link id="com.ibm.lotus.NavStateUrl" rel="alternate" href="${fn:escapeXml(currentNavNode.urlGeneration.keepNavigationalState)}" />

<%-- Link to the Portal favicon --%>
<link href="<r:url uri="${themeWebDAVBaseURI}images/favicon.ico" keepNavigationalState="false" lateBinding="false" protected="false"/>" rel="shortcut icon" type="image/x-icon" />

<link href="<r:url uri="${themeWebDAVBaseURI}css/custom/layout.css" keepNavigationalState="false" lateBinding="false" protected="false"/>" rel="stylesheet" type="text/css" />

<%-- BEGIN --%>
<script type="text/javascript" src="<r:url uri="${themeWebDAVBaseURI}js/custom/jquery.min.js" keepNavigationalState="false" lateBinding="false" protected="false"/>"></script>
<script type="text/javascript" src="<r:url uri="${themeWebDAVBaseURI}js/custom/jquery.easing.1.3.js" keepNavigationalState="false" lateBinding="false" protected="false"/>"></script>
<script type="text/javascript" src="<r:url uri="${themeWebDAVBaseURI}js/custom/jquery.hslides.1.0.js" keepNavigationalState="false" lateBinding="false" protected="false"/>"></script>
<script type="text/javascript" src="<r:url uri="${themeWebDAVBaseURI}js/custom/Scripts.js" keepNavigationalState="false" lateBinding="false" protected="false"/>"></script>
<script type="text/javascript" src="<r:url uri="${themeWebDAVBaseURI}js/custom/FormHandler.js" keepNavigationalState="false" lateBinding="false" protected="false"/>"></script>
<%-- END --%>
