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
    <!--
    function showNatData(box)
    {
        if (box.checked)
        {
            document.getElementById('natAttrLabel').style.display = 'block';
            document.getElementById('natAddrHr').style.display = 'block';
            document.getElementById('natAddrBr').style.display = 'block';
            document.getElementById('natAddrTable').style.display = 'block';
        }
        else
        {
            document.getElementById('natAttrLabel').style.display = 'none';
            document.getElementById('natAddrHr').style.display = 'none';
            document.getElementById('natAddrBr').style.display = 'none';
            document.getElementById('natAddrTable').style.display = 'none';
        }
    }

    function showOptions(obj)
    {
        if ((obj.value == 'DMGRSERVER') || (obj.value == 'VIRTUALHOST'))
        {
            document.getElementById("applicationDetail").style.display = 'block';

            if (obj.value == 'DMGRSERVER')
            {
                document.getElementById("domainName").style.display = 'block';
                document.getElementById("locationDetail").style.display = 'block';
                document.getElementById("applicationDetail").style.display = 'block';
                document.getElementById("dmgrPort").style.display = 'block';
                document.getElementById("owningDmgr").style.display = 'none';
                document.getElementById("managerUrl").style.display = 'block';

                if (document.getElementById("domainNameSelect"))
                {
                    document.getElementById("domainNameSelect").style.display = 'block';
                }
            }
            else if (obj.value == 'VIRTUALHOST')
            {
                document.getElementById("domainName").style.display = 'block';
                document.getElementById("locationDetail").style.display = 'block';
                document.getElementById("applicationDetail").style.display = 'block';
                document.getElementById("dmgrPort").style.display = 'none';
                document.getElementById("owningDmgr").style.display = 'none';
                document.getElementById("managerUrl").style.display = 'block';

                if (document.getElementById("domainNameSelect"))
                {
                    document.getElementById("domainNameSelect").style.display = 'block';
                }
            }
        }
        else
        {
            if (obj.value == 'APPSERVER')
            {
                document.getElementById("domainName").style.display = 'none';
                document.getElementById("applicationDetail").style.display = 'block';
                document.getElementById("locationDetail").style.display = 'none';
                document.getElementById("dmgrPort").style.display = 'none';
                document.getElementById("owningDmgr").style.display = 'block';
                document.getElementById("managerUrl").style.display = 'none';
            }
            else
            {
                document.getElementById("domainName").style.display = 'block';
                document.getElementById("applicationDetail").style.display = 'none';
                document.getElementById("locationDetail").style.display = 'block';
                document.getElementById("dmgrPort").style.display = 'none';
                document.getElementById("owningDmgr").style.display = 'none';
                document.getElementById("managerUrl").style.display = 'none';
            }
        }
    }

    function validateForm(theForm)
    {
        if (theForm.osName.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = 'An OS type must be provided.';
            document.getElementById('txtOsName').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('osName').focus();
        }
        else if (theForm.operHostName.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = 'A system hostname must be provided.';
            document.getElementById('txtOperHostname').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('osName').focus();
        }
        else if (theForm.operIpAddress.value == '')
        {
            clearText(theForm);

            document.getElementById('validationError').innerHTML = 'A system IP address must be provided.';
            document.getElementById('txtOperAddress').style.color = '#FF0000';
            document.getElementById('execute').disabled = false;
            document.getElementById('osName').focus();
        }
        else
        {
            if ((theForm.serverType.value == 'DMGR') || (theForm.serverType.value == 'VIRTUALHOST'))
            {
                if (theForm.serverType.value == 'DMGR') 
                {
                    if ((theForm.dmgrPort.value == '') || (theForm.dmgrPort.value == 0))
                    {
                        clearText(theForm);

                        document.getElementById('validationError').innerHTML = 'Server type specified as Deployment Manager but no service port was provided.';
                        document.getElementById('txtDmgrPort').style.color = '#FF0000';
                        document.getElementById("dmgrPort").style.display = 'block';
                        document.getElementById("mgrUrl").style.display = 'none';
                        document.getElementById('serverType').selected.value = 'DMGR';
                        document.getElementById('execute').disabled = false;
                        document.getElementById('osName').focus();
                    }
                    else if (theForm.mgrUrl.value == '')
                    {
                        clearText(theForm);

                        document.getElementById('validationError').innerHTML = 'Server type specified as Deployment Manager but no manager URL was provided.';
                        document.getElementById('txtDmgrPort').style.color = '#FF0000';
                        document.getElementById("dmgrPort").style.display = 'block';
                        document.getElementById("mgrUrl").style.display = 'none';
                        document.getElementById('serverType').selected.value = 'DMGR';
                        document.getElementById('execute').disabled = false;
                        document.getElementById('osName').focus();
                    }
                    else
                    {
                        theForm.submit();
                    }
                }
                else if (theForm.serverType.value == 'VIRTUALHOST')
                {
                    if (theForm.mgrUrl.value == '')
                    {
                        clearText(theForm);

                        document.getElementById('validationError').innerHTML = 'Server type specified as Virtual Manager but no manager URL was provided.';
                        document.getElementById('txtDmgrPort').style.color = '#FF0000';
                        document.getElementById("dmgrPort").style.display = 'block';
                        document.getElementById("mgrUrl").style.display = 'none';
                        document.getElementById('serverType').selected.value = 'VIRTUALHOST';
                        document.getElementById('execute').disabled = false;
                        document.getElementById('osName').focus();
                    }
                    else
                    {
                        theForm.submit();
                    }
                }
                else
                {
                    theForm.submit();
                }
            }
            else
            {
                theForm.submit();
            }
        }
    }
    //-->
</script>

<div id="homecontent">
    <div class="wrapper">
        <div id="error"></div>
    
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
        <p>
            <form:form id="createNewServer" name="createNewServer" action="${pageContext.request.contextPath}/ui/server-management/add-server" method="post">
                <table id="serverDetail">
                    <tr>
                        <%-- OS name/type --%>
                        <td><label><spring:message code="server.mgmt.os.name" /></label></td>
                        <td><form:input path="osName" /></td>
                        <td><form:errors path="osName" cssClass="error" /></td>
                        <%-- domain name --%>
                        <c:choose>
                            <c:when test="${fn:length(domainList) >= 1}">
                                <td id="domainName" style="display: none;"><label id="txtDomainName"><spring:message code="server.mgmt.domain.name" /></label></td>
                                <td id="domainNameSelect" style="display: none;">
                                    <form:select path="domainName">
                                        <option><spring:message code="theme.option.select" /></option>
                                        <option><spring:message code="theme.option.spacer" /></option>
                                        <form:options items="${domainList}" />
                                    </form:select>
                                </td>
                                <td><form:errors path="domainName" cssClass="error" /></td>
                            </c:when>
                            <c:otherwise>
                                <form:hidden path="domainName" value="${domainList[0]}" />
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </table>
                <label><spring:message code="server.mgmt.hardware.title" /></label>
                <hr />
                <br />
                <table>
                    <tr>
                        <td><label><spring:message code="server.mgmt.server.type" /></label></td>
                        <td>
                            <form:select path="serverType" onchange="showOptions(this);">
                                <option><spring:message code="theme.option.select" /></option>
                                <option><spring:message code="theme.option.spacer" /></option>
                                <form:options items="${serverTypes}" />
                            </form:select>
                        </td>
                        <td><form:errors path="serverType" cssClass="error" /></td>
                        <td><label><spring:message code="server.mgmt.server.status" /></label></td>
                        <td>
                            <form:select path="serverStatus">
                                <option><spring:message code="theme.option.select" /></option>
                                <option><spring:message code="theme.option.spacer" /></option>
                                <form:options items="${serverStatuses}" />
                            </form:select>
                        </td>
                        <td><form:errors path="serverStatus" cssClass="error" /></td>
                    </tr>
                </table>
                <table id="locationDetail" style="display: none;">
                    <tr>
                        <td><label><spring:message code="server.mgmt.server.region" /></label></td>
                        <td>
                            <form:select path="serverRegion">
                                <option><spring:message code="theme.option.select" /></option>
                                <option><spring:message code="theme.option.spacer" /></option>
                                <form:options items="${serverRegions}" />
                            </form:select>
                        </td>
                        <td><form:errors path="serverRegion" cssClass="error" /></td>
                    </tr>
                    <tr>
                        <td><label><spring:message code="server.mgmt.server.datacenter" /></label></td>
                        <td>
                            <form:select path="datacenter">
                                <option><spring:message code="theme.option.select" /></option>
                                <option><spring:message code="theme.option.spacer" /></option>
                                <c:forEach var="dcObject" items="${datacenters}">
                                    <form:option value="${dcObject.guid}" label="${dcObject.name}"/>
                                </c:forEach>
                            </form:select>
                        </td>
                        <td><form:errors path="datacenter" cssClass="error" /></td>
                        <td><label><spring:message code="server.mgmt.network.partition" /></label></td>
                        <td>
                            <form:select path="networkPartition">
                                <option><spring:message code="theme.option.select" /></option>
                                <option><spring:message code="theme.option.spacer" /></option>
                                <form:options items="${networkPartitions}" />
                            </form:select>
                        </td>
                        <td><form:errors path="networkPartition" cssClass="error" /></td>
                    </tr>
                </table>
                <table id="applicationDetail" style="display: none">
                    <tr id="dmgrPort" style="display: none">
                        <td><label id="txtDmgrPort"><spring:message code="server.mgmt.dmgr.port" /></label></td>
                        <td><form:input path="dmgrPort" /></td>
                        <td><form:errors path="dmgrPort" cssClass="error" /></td>
                    </tr>
                    <tr id="managerUrl" style="display: none">
                        <td><label><spring:message code="server.mgmt.manager.url" /></label></td>
                        <td><form:input path="mgrUrl" /></td>
                        <td><form:errors path="mgrUrl" cssClass="error" /></td>
                    </tr>
                    <tr id="owningDmgr" style="display: none">
                        <td><label><spring:message code="server.mgmt.owning.dmgr" /></label></td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty dmgrServers}">
                                    <form:select path="owningDmgr">
                                        <option><spring:message code="theme.option.select" /></option>
                                        <option><spring:message code="theme.option.spacer" /></option>
                                        <c:forEach var="dmgr" items="${dmgrServers}">
                                            <form:option value="${dmgr.serverGuid}" label="${dmgr.operHostName}"/>
                                        </c:forEach>
                                    </form:select>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/ui/server-management/add-server"
                                        title="<spring:message code='server.mgmt.add.server' />"><spring:message code='server.mgmt.add.server' /></a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><form:errors path="owningDmgr" cssClass="error" /></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td><label><spring:message code="server.mgmt.server.model" /></label></td>
                        <td><form:input path="serverModel" /></td>
                        <td><form:errors path="serverModel" cssClass="error" /></td>
                        <td><label><spring:message code="server.mgmt.serial.number" /></label></td>
                        <td><form:input path="serialNumber" /></td>
                        <td><form:errors path="serialNumber" cssClass="error" /></td>
                    </tr>
                    <tr>
                        <td><label><spring:message code="server.mgmt.cpu.type" /></label></td>
                        <td><form:input path="cpuType" /></td>
                        <td><form:errors path="cpuType" cssClass="error" /></td>
                        <td><label><spring:message code="server.mgmt.cpu.count" /></label></td>
                        <td><form:input path="cpuCount" /></td>
                        <td><form:errors path="cpuCount" cssClass="error" /></td>
                    </tr>
                    <tr>
                        <td><label><spring:message code="server.mgmt.installed.memory" /></label></td>
                        <td><form:input path="installedMemory" /></td>
                        <td><form:errors path="installedMemory" cssClass="error" /></td>
                    </tr>
                    <tr>
                        <td><label><spring:message code="server.mgmt.server.rack" /></label></td>
                        <td><form:input path="serverRack" /></td>
                        <td><form:errors path="serverRack" cssClass="error" /></td>
                        <td><label><spring:message code="server.mgmt.rack.position" /></label></td>
                        <td><form:input path="rackPosition" /></td>
                        <td><form:errors path="rackPosition" cssClass="error" /></td>
                    </tr>
                </table>
                <label><spring:message code="server.mgmt.oper.title" /></label>
                <hr />
                <br />
                <table>
                    <tr>
                        <td><label><spring:message code="server.mgmt.oper.name" /></label></td>
                        <td><form:input path="operHostName" /></td>
                        <td><form:errors path="operHostName" cssClass="error" /></td>
                        <td><label><spring:message code="server.mgmt.oper.address" /></label></td>
                        <td><form:input path="operIpAddress" /></td>
                        <td><form:errors path="operIpAddress" cssClass="error" /></td>
                    </tr>
                </table>
                <label><spring:message code="server.mgmt.mgmt.title" /></label>
                <hr />
                <br />
                <table>
                    <tr>
                        <td><label><spring:message code="server.mgmt.mgmt.name" /></label></td>
                        <td><form:input path="mgmtHostName" /></td>
                        <td><form:errors path="mgmtHostName" cssClass="error" /></td>
                        <td><label><spring:message code="server.mgmt.mgmt.address" /></label></td>
                        <td><form:input path="mgmtIpAddress" /></td>
                        <td><form:errors path="mgmtIpAddress" cssClass="error" /></td>
                    </tr>
                </table>
                <label><spring:message code="server.mgmt.backup.title" /></label>
                <hr />
                <br />
                <table>
                    <tr>
                        <td><label><spring:message code="server.mgmt.backup.name" /></label></td>
                        <td><form:input path="bkHostName" /></td>
                        <td><form:errors path="bkHostName" cssClass="error" /></td>
                        <td><label><spring:message code="server.mgmt.backup.address" /></label></td>
                        <td><form:input path="bkIpAddress" /></td>
                        <td><form:errors path="bkIpAddress" cssClass="error" /></td>
                </table>
                <label><spring:message code="server.mgmt.nas.title" /></label>
                <hr />
                <br />
                <table>
                    <tr>
                        <td><label><spring:message code="server.mgmt.nas.name" /></label></td>
                        <td><form:input path="nasHostName" /></td>
                        <td><form:errors path="nasHostName" cssClass="error" /></td>
                        <td><label><spring:message code="server.mgmt.nas.address" /></label></td>
                        <td><form:input path="nasIpAddress" /></td>
                        <td><form:errors path="nasIpAddress" cssClass="error" /></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td><label><spring:message code="server.mgmt.nat.enabled" /></label></td>
                        <td><input onclick="showNatData(this);" type="checkbox" value="false"></td>
                    </tr>
                </table>
                <label id="natAttrLabel" style="display: none;"><spring:message code="server.mgmt.nas.title" /></label>
                <hr id="natAddrHr" style="display: none;" />
                <br id="natAddrBr" style="display: none;" />
                <table id="natAddrTable" style="display: none;">
                    <tr>
                        <td><label><spring:message code="server.mgmt.nat.address" /></label></td>
                        <td><form:input path="natAddress" /></td>
                        <td><form:errors path="natAddress" cssClass="error" /></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td><label><spring:message code="server.mgmt.server.comments" /></label></td>
                        <td><form:textarea path="serverComments" /></td>
                        <td><form:errors path="serverComments" cssClass="error" /></td>
                    </tr>
                </table>
                <br /><br />
                <input type="button" name="execute" value="<spring:message code='theme.button.submit.text' />" id="execute" class="submit" onclick="disableButton(this); validateForm(this.form, event);" />
                <input type="button" name="reset" value="<spring:message code='theme.button.reset.text' />" id="reset" class="submit" onclick="clearForm();" />
                <input type="button" name="cancel" value="<spring:message code='theme.button.cancel.text' />" id="cancel" class="submit" onclick="redirectOnCancel('/esolutions/ui/server-management/default');" />
            </form:form>
        </p>
    </div>
</div>

<div id="container">
    <div class="wrapper">
        <div id="content">
            <h1><spring:message code="server.mgmt.header" /></h1>
            <ul>
                <li><a href="${pageContext.request.contextPath}/ui/server-management/default" title="<spring:message code='theme.search.banner' />"><spring:message code='theme.search.banner' /></a></li>
                <li><a href="${pageContext.request.contextPath}/ui/server-management/service-consoles" title="<spring:message code='server.mgmt.service.consoles' />"><spring:message code='server.mgmt.service.consoles' /></a></li>
                <li><a href="${pageContext.request.contextPath}/ui/server-management/install-software" title="<spring:message code='server.mgmt.install.software.header' />"><spring:message code="server.mgmt.install.software.header" /></a></li>
                <li><a href="${pageContext.request.contextPath}/ui/server-management/server-control" title="<spring:message code='server.mgmt.server.control.header' />"><spring:message code='server.mgmt.server.control.header' /></a></li>
            </ul>
        </div>
        <br class="clear" />
    </div>
</div>
