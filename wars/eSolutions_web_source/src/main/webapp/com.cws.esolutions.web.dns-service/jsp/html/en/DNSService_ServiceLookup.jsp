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
 * Package: com.cws.esolutions.web.dnsservice\jsp\html\en
 * File: DNSService_ServiceLookup.jsp
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

<script>
    function validateForm(theForm)
    {
        if (theForm.recordName.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="dns.provide.query" />';
            document.getElementById('txtServiceName').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('recordName').focus();

            return;
        }
        else if ((theForm.recordType.value == 'Select....') || (theForm.recordType.value == '------'))
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = '<spring:message code="dns.provide.type" />';
            document.getElementById('txtLookupType').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('recordName').focus();

            return;
        }

        theForm.submit();
    }
</script>

<div id="content">
    <h1><spring:message code="dns.lookup.service.name" /></h1>

    <%@include file="/theme/cws/html/en/jspf/errorMessages.jspf" %>

    <form:form id="submitNameLookup" name="submitNameLookup" action="${pageContext.request.contextPath}/ui/dns-service/search" method="post">
        <table>
            <tr>
                <td><label id="txtServiceName"><spring:message code="dns.service.hostname" /></label></td>
                <td>
                    <form:input path="recordName" />
                    <form:errors path="recordName" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td><label id="txtLookupType"><spring:message code="dns.lookup.record.type" /></label></td>
                <td>
                    <form:select path="recordType">
                        <option><fmt:message key="theme.option.select" bundle="${theme}" /></option>
                        <option><fmt:message key="theme.option.spacer" bundle="${theme}" /></option>
                        <form:options items="${serviceTypes}" />
                    </form:select>
                </td>
            </tr>
        </table>
        <br class="clear" /><br class="clear" />
        <input type="button" name="execute" value="<fmt:message key='theme.button.submit.text' bundle='${theme}' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form);" />
        <input type="button" name="reset" value="<fmt:message key='theme.button.reset.text' bundle='${theme}' />" id="reset" class="submit" onclick="clearForm();" />
    </form:form>

    <br class="clear" /><br class="clear" />

    <c:if test="${not empty dnsEntry or not empty dnsEntries}">
        <h2><spring:message code="dns.lookup.results" /></h2>
        <p>
            <c:choose>
                <c:when test="${not empty dnsEntry}">
                    <spring:message code="dns.service.hostname" /> <a href="<c:url value='${dnsEntry.recordName}' />" title="${dnsEntry.recordName}">${dnsEntry.recordName}</a><br />
                    <spring:message code="dns.lookup.record.type" /> ${dnsEntry.recordType}<br />
                    <spring:message code="dns.lookup.record.address" /> ${dnsEntry.recordAddress}<br />
                </c:when>
                <c:when test="${not empty dnsEntries}">
                    <c:forEach var="dnsEntry" items="${dnsEntries}">
                        <spring:message code="dns.service.hostname" /> <a href="<c:url value='${dnsEntry.recordName}' />" title="${dnsEntry.recordName}">${dnsEntry.recordName}</a><br />
                        <spring:message code="dns.lookup.record.type" /> ${dnsEntry.recordType}<br />
                        <spring:message code="dns.lookup.record.address" /> ${dnsEntry.recordAddress}<br />
                        <br />
                    </c:forEach>
                </c:when>
            </c:choose>
        </p>
    </c:if>
</div>
