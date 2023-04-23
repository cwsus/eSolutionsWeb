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
 * Package: com.cws.esolutions.web.server-management\jsp\html\en
 * File: SystemCheck_AddServer.jsp
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

<script type="text/javascript">
    function validateForm(theForm)
    {
        var regex = /^[0-9]+$/;

		if (theForm.osName.value == '')
		{
		    clearText(theForm);

		    document.getElementById('validationError').innerHTML = 'An OS name must be provided.';
		    document.getElementById('txtOsName').style.color = '#FF0000';
		    document.getElementById('execute').disabled = false;
		    document.getElementById('osName').focus();
		}
		else if (theForm.serverModel.value == '')
		{
		    clearText(theForm);
		
		    document.getElementById('validationError').innerHTML = 'A server model must be provided.';
		    document.getElementById('txtServerModel').style.color = '#FF0000';
		    document.getElementById('execute').disabled = false;
		    document.getElementById('serverModel').focus();
		}
		else if (theForm.serialNumber.value == '')
		{
		    clearText(theForm);
		
		    document.getElementById('validationError').innerHTML = 'A serial number must be provided.';
		    document.getElementById('txtSerialNumber').style.color = '#FF0000';
		    document.getElementById('execute').disabled = false;
		    document.getElementById('serialNumber').focus();
		}
		else if (theForm.cpuType.value == '')
		{
		    clearText(theForm);
		
		    document.getElementById('validationError').innerHTML = 'A CPU type must be provided.';
		    document.getElementById('txtCpuType').style.color = '#FF0000';
		    document.getElementById('execute').disabled = false;
		    document.getElementById('cpuType').focus();
		}
		else if ((theForm.cpuCount.value == '') || (!(theForm.cpuCount.value.match(regex))))
		{
		    clearText(theForm);
		
		    document.getElementById('validationError').innerHTML = 'A CPU count must be provided.';
		    document.getElementById('txtCpuCount').style.color = '#FF0000';
		    document.getElementById('execute').disabled = false;
		    document.getElementById('cpuCount').focus();
		}
		else if ((theForm.installedMemory.value == '') || (!(theForm.installedMemory.value.match(regex))))
		{
		    clearText(theForm);
		
		    document.getElementById('validationError').innerHTML = 'The installed memory count must be provided.';
		    document.getElementById('txtInstalledMemory').style.color = '#FF0000';
		    document.getElementById('execute').disabled = false;
		    document.getElementById('installedMemory').focus();
		}
		else if (theForm.serverRack.value == '')
		{
		    clearText(theForm);
		
		    document.getElementById('validationError').innerHTML = 'The server rack location must be provided';
		    document.getElementById('txtServerRack').style.color = '#FF0000';
		    document.getElementById('execute').disabled = false;
		    document.getElementById('serverRack').focus();
		}
		else if (theForm.rackPosition.value == '')
		{
		    clearText(theForm);
		
		    document.getElementById('validationError').innerHTML = 'The server rack position must be provided';
		    document.getElementById('txtRackPosition').style.color = '#FF0000';
		    document.getElementById('execute').disabled = false;
		    document.getElementById('rackPosition').focus();
		}
		else if (theForm.operHostName.value == '')
		{
		    clearText(theForm);
		
		    document.getElementById('validationError').innerHTML = 'The system hostname must be provided';
		    document.getElementById('operHostName').style.color = '#FF0000';
		    document.getElementById('execute').disabled = false;
		    document.getElementById('operHostName').focus();
		}
		else if (theForm.operIpAddress.value == '')
		{
		    clearText(theForm);
		
		    document.getElementById('validationError').innerHTML = 'The system IP address must be provided';
		    document.getElementById('operIpAddress').style.color = '#FF0000';
		    document.getElementById('execute').disabled = false;
		    document.getElementById('operIpAddress').focus();
		}
		else
		{
            serverTypeElement = document.getElementById('serverType');
            serverStatusElement = document.getElementById('serverStatus');
            domainNameElement = document.getElementById('domainName');
            datacenterElement = document.getElementById('datacenter.guid');
            networkPartitionElement = document.getElementById('networkPartition');

		    if ((serverTypeElement == '') || (serverTypeElement.text == 'Select....') || (serverTypeElement.text == '------'))
		    {
		        clearText(theForm);
		
		        document.getElementById('validationError').innerHTML = 'A server type must be provided.';
		        document.getElementById('txtServerType').style.color = '#FF0000';
		        document.getElementById('execute').disabled = false;
		        document.getElementById('serverType').focus();
		    }
		    else if ((serverStatusElement == '') || (serverStatusElement.text == 'Select....') || (serverStatusElement.text == '------'))
		    {
		        clearText(theForm);
		
		        document.getElementById('validationError').innerHTML = 'A server status must be provided.';
		        document.getElementById('txtServerStatus').style.color = '#FF0000';
		        document.getElementById('execute').disabled = false;
		        document.getElementById('serverStatus').focus();
		    }
		    else if ((domainNameElement == '') || (domainNameElement.text == 'Select....') || (domainNameElement.text == '------'))
		    {
		        clearText(theForm);
		
		        document.getElementById('validationError').innerHTML = 'A domain name must be selected.';
		        document.getElementById('txtDomainName').style.color = '#FF0000';
		        document.getElementById('execute').disabled = false;
		        document.getElementById('domainName').focus();
		    }
		    else if ((datacenterElement == '') || (datacenterElement.text == 'Select....') || (datacenterElement.text == '------'))
		    {
		        clearText(theForm);
		
		        document.getElementById('validationError').innerHTML = 'Please select a datacenter.';
		        document.getElementById('txtDatacenter').style.color = '#FF0000';
		        document.getElementById('execute').disabled = false;
		        document.getElementById('datacenter').focus();
		    }
		    else
		    {
		        theForm.submit();
		    }
		}
    }
</script>

<div id="homecontent">
    <div class="wrapper">
        <div id="error"></div>
        <div id="validationError" style="color: #FF0000"></div>
    
        <c:if test="${not empty fn:trim(messageResponse)}">
            <p id="info">${messageResponse}</p>
        </c:if>
        <c:if test="${not empty fn:trim(errorResponse)}">
            <p id="error">${errorResponse}</p>
        </c:if>
        <c:if test="${not empty fn:trim(responseMessage)}">
            <p id="info"><spring:message code="${responseMessage}" /></p>
        </c:if>
        <c:if test="${not empty fn:trim(errorMessage)}">
            <p id="error"><spring:message code="${errorMessage}" /></p>
        </c:if>
        <c:if test="${not empty fn:trim(param.responseMessage)}">
            <p id="info"><spring:message code="${param.responseMessage}" /></p>
        </c:if>
        <c:if test="${not empty fn:trim(param.errorMessage)}">
            <p id="error"><spring:message code="${param.errorMessage}" /></p>
        </c:if>

        <h1><spring:message code="server.mgmt.add.server" /></h1>
        <form:form id="createNewServer" name="createNewServer" action="${pageContext.request.contextPath}/ui/server-management/add-server" method="post">
            <label><spring:message code="server.mgmt.basic.title" /></label>
            <hr />
            <br class="clear" />
            <table>
                <thead>
                    <tr>
                        <th><label id="txtOsName"><spring:message code="server.mgmt.os.name" /></label></th>
                        <th><label id="txtServerType"><spring:message code="server.mgmt.server.type" /></label></th>
                        <th><label id="txtServerStatus"><spring:message code="server.mgmt.server.status" /></label></th>
                        <th><label id="txtDomainName"><spring:message code="server.mgmt.domain.name" /></label></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <form:input path="osName" />
                            <form:errors path="osName" cssClass="error" />
                        </td>
                        <td>
	                        <form:select path="serverType">
	                            <option><spring:message code="theme.option.select" /></option>
	                            <option><spring:message code="theme.option.spacer" /></option>
	                            <form:options items="${serverTypes}" />
	                        </form:select>
	                        <form:errors path="serverType" cssClass="error" />
	                    </td>
	                    <td>
	                        <form:select path="serverStatus">
	                            <option><spring:message code="theme.option.select" /></option>
	                            <option><spring:message code="theme.option.spacer" /></option>
	                            <form:options items="${serverStatuses}" />
	                        </form:select>
	                        <form:errors path="serverStatus" cssClass="error" />
	                    </td>
                        <td id="domainNameSelect">
                            <form:select path="domainName">
                                <option><spring:message code="theme.option.select" /></option>
                                <option><spring:message code="theme.option.spacer" /></option>
                                <form:options items="${domainList}" />
                            </form:select>
                            <form:errors path="domainName" cssClass="error" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <label><spring:message code="server.mgmt.location.title" /></label>
            <hr />
            <br class="clear" />
            <table>
                <thead>
                    <tr>
                        <th><label id="txtServerRegion"><spring:message code="server.mgmt.server.region" /></label></th>
                        <th><label id="txtDatacenter"><spring:message code="server.mgmt.server.datacenter" /></label></th>
                        <th><label id="txtNetworkPartition"><spring:message code="server.mgmt.network.partition" /></label></th>
                        <th><label id="txtServerRack"><spring:message code="server.mgmt.server.rack" /></label></th>
                        <th><label id="txtRackPosition"><spring:message code="server.mgmt.rack.position" /></label></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
	                    <td>
	                        <form:select path="serverRegion">
	                            <option><spring:message code="theme.option.select" /></option>
	                            <option><spring:message code="theme.option.spacer" /></option>
	                            <form:options items="${serverRegions}" />
	                        </form:select>
	                        <form:errors path="serverRegion" cssClass="error" />
	                    </td>
	                    <td>
	                        <form:select path="datacenter.guid">
	                            <option><spring:message code="theme.option.select" /></option>
	                            <option><spring:message code="theme.option.spacer" /></option>
	                            <c:forEach var="dcObject" items="${datacenters}">
	                                <form:option value="${dcObject.guid}" label="${dcObject.name}"/>
	                            </c:forEach>
	                        </form:select>
	                        <form:errors path="datacenter.guid" cssClass="error" />
	                    </td>
	                    <td>
	                        <form:select path="networkPartition">
	                            <option><spring:message code="theme.option.select" /></option>
	                            <option><spring:message code="theme.option.spacer" /></option>
	                            <form:options items="${networkPartitions}" />
	                        </form:select>
	                        <form:errors path="networkPartition" cssClass="error" />
	                    </td>
                        <td>
                            <form:input path="serverRack" />
                            <form:errors path="serverRack" cssClass="error" />
                        </td>
                        <td>
                            <form:input path="rackPosition" />
                            <form:errors path="rackPosition" cssClass="error" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <label><spring:message code="server.mgmt.hardware.title" /></label>
            <hr />
            <br class="clear" />
            <table>
                <thead>
                    <tr>
                        <th><label id="txtServerModel"><spring:message code="server.mgmt.server.model" /></label></th>
                        <th><label id="txtSerialNumber"><spring:message code="server.mgmt.serial.number" /></label></th>
                        <th><label id="txtCpuType"><spring:message code="server.mgmt.cpu.type" /></label></th>
                        <th><label id="txtCpuCount"><spring:message code="server.mgmt.cpu.count" /></label></th>
                        <th><label id="txtInstalledMemory"><spring:message code="server.mgmt.installed.memory" /></label></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <form:input path="serverModel" />
                            <form:errors path="serverModel" cssClass="error" />
                        </td>
	                    <td>
	                        <form:input path="serialNumber" />
	                        <form:errors path="serialNumber" cssClass="error" />
                        </td>
                        <td>
                            <form:input path="cpuType" />
                            <form:errors path="cpuType" cssClass="error" />
                        </td>
                        <td>
                            <form:input path="cpuCount" />
                            <form:errors path="cpuCount" cssClass="error" />
                        </td>
                        <td>
                            <form:input path="installedMemory" />
                            <form:errors path="installedMemory" cssClass="error" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <label><spring:message code="server.mgmt.oper.title" /></label>
            <hr />
            <br />
            <table>
                <thead>
                    <tr>
                        <th><label><spring:message code="server.mgmt.oper.name" /></label></th>
                        <th><label><spring:message code="server.mgmt.oper.address" /></label></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
	                    <td>
	                        <form:input path="operHostName" />
	                        <form:errors path="operHostName" cssClass="error" />
	                    </td>
	                    <td>
	                        <form:input path="operIpAddress" />
	                        <form:errors path="operIpAddress" cssClass="error" />
	                    </td>
                    </tr>
                </tbody>
            </table>
            <label><spring:message code="server.mgmt.mgmt.title" /></label>
            <hr />
            <br />
            <table>
                <thead>
                    <tr>
                        <th><label><spring:message code="server.mgmt.mgmt.name" /></label></th>
                        <th><label><spring:message code="server.mgmt.mgmt.address" /></label></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <form:input path="mgmtHostName" />
                            <form:errors path="mgmtHostName" cssClass="error" />
                        </td>
                        <td>
                            <form:input path="mgmtIpAddress" />
                            <form:errors path="mgmtIpAddress" cssClass="error" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <label><spring:message code="server.mgmt.backup.title" /></label>
            <hr />
            <br />
            <table>
                <thead>
                    <tr>
                        <th><label><spring:message code="server.mgmt.backup.name" /></label></th>
                        <th><label><spring:message code="server.mgmt.backup.address" /></label></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <form:input path="bkHostName" />
                            <form:errors path="bkHostName" cssClass="error" />
                        </td>
                        <td>
                            <form:input path="bkIpAddress" />
                            <form:errors path="bkIpAddress" cssClass="error" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <label><spring:message code="server.mgmt.nas.title" /></label>
            <hr />
            <br />
            <table>
                <thead>
                    <tr>
                        <th><label><spring:message code="server.mgmt.nas.name" /></label></th>
                        <th><label><spring:message code="server.mgmt.nas.address" /></label></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <form:input path="nasHostName" />
                            <form:errors path="nasHostName" cssClass="error" />
                        </td>
                        <td>
                            <form:input path="nasIpAddress" />
                            <form:errors path="nasIpAddress" cssClass="error" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <table>
                <thead>
                    <tr>
                        <th><label><spring:message code="server.mgmt.server.comments" /></label></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
	                    <td>
	                        <form:textarea path="serverComments" />
	                        <form:errors path="serverComments" cssClass="error" />
	                    </td>
                    </tr>
                </tbody>
            </table>
            <br /><br />
            <input type="button" name="execute" value="<spring:message code='theme.button.submit.text' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form);" />
            <input type="button" name="reset" value="<spring:message code='theme.button.reset.text' />" id="reset" class="submit" onclick="clearForm();" />
            <input type="button" name="cancel" value="<spring:message code='theme.button.cancel.text' />" id="cancel" class="submit" onclick="redirectOnCancel('${pageContext.request.contextPath}/ui/server-management/default');" />
        </form:form>
    </div>
</div>

<div id="container">
    <div class="wrapper">
        <div id="content">
            <h1><spring:message code="server.mgmt.header" /></h1>
            <ul>
                <li><a href="<c:url value='/ui/server-management/default' />" title="<spring:message code='theme.search.banner' />"><spring:message code='theme.search.banner' /></a></li>
                <li><a href="<c:url value='/ui/server-management/service-consoles' />" title="<spring:message code='server.mgmt.service.consoles' />"><spring:message code='server.mgmt.service.consoles' /></a></li>
                <li><a href="<c:url value='/ui/server-management/install-software' />" title="<spring:message code='server.mgmt.install.software.header' />"><spring:message code="server.mgmt.install.software.header" /></a></li>
                <li><a href="<c:url value='/ui/server-management/server-control' />" title="<spring:message code='server.mgmt.server.control.header' />"><spring:message code='server.mgmt.server.control.header' /></a></li>
            </ul>
        </div>
        <br class="clear" />
    </div>
</div>
