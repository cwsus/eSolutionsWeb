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
 * Package: theme\cws\html\en\jsp
 * File: footer.jsp
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
	</body>
</html>