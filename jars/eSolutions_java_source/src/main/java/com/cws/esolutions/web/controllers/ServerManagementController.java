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
package com.cws.esolutions.web.controllers;
/*
 * Project: eSolutions_java_source
 * Package: com.cws.esolutions.web.controllers
 * File: ServerManagementController.java
 *
 * History
 *
 * Author               Date                            Comments
 * ----------------------------------------------------------------------------
 * cws-khuntly          11/23/2008 22:39:20             Created.
 */
import java.util.List;
import java.util.Enumeration;
import jakarta.servlet.http.HttpSession;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.cws.esolutions.web.Constants;
import com.cws.esolutions.security.dto.UserAccount;
import com.cws.esolutions.security.processors.dto.RequestHostInfo;
import com.cws.esolutions.web.ApplicationServiceBean;
import com.cws.esolutions.core.processors.dto.Server;
import com.cws.esolutions.core.enums.CoreServicesStatus;
import com.cws.esolutions.web.validators.ServerValidator;
import com.cws.esolutions.core.processors.dto.Datacenter;
import com.cws.esolutions.core.processors.enums.ServerType;
import com.cws.esolutions.core.processors.enums.ServerStatus;
import com.cws.esolutions.core.processors.enums.ServiceRegion;
import com.cws.esolutions.core.processors.dto.SystemCheckRequest;
import com.cws.esolutions.core.processors.enums.NetworkPartition;
import com.cws.esolutions.core.processors.dto.ServerManagementRequest;
import com.cws.esolutions.core.processors.dto.ServerManagementResponse;
import com.cws.esolutions.core.processors.dto.DatacenterManagementRequest;
import com.cws.esolutions.core.processors.dto.DatacenterManagementResponse;
import com.cws.esolutions.core.processors.impl.ServerManagementProcessorImpl;
import com.cws.esolutions.core.processors.exception.ServerManagementException;
import com.cws.esolutions.core.processors.interfaces.IServerManagementProcessor;
import com.cws.esolutions.core.processors.impl.DatacenterManagementProcessorImpl;
import com.cws.esolutions.core.processors.exception.DatacenterManagementException;
import com.cws.esolutions.core.processors.interfaces.IDatacenterManagementProcessor;
/**
 * @author cws-khuntly
 * @version 1.0
 * @see org.springframework.stereotype.Controller
 */
@Controller
@RequestMapping("/server-management")
public class ServerManagementController
{
    private int recordsPerPage = 20;
    private String serviceId = null;
    private String defaultPage = null;
    private String addServerPage = null;
    private String viewServerPage = null;
    private String adminConsolePage = null;
    private String addServerRedirect = null;
    private ServerValidator validator = null;
    private String messageServerAdded = null;
    private String messageNoDmgrsFound = null;
    private String messageNoServersFound = null;
    private String addDatacenterRedirect = null;
    private List<String> availableDomains = null;
    private String messageAddServerSuccess = null;
    private ApplicationServiceBean appConfig = null;

    private static final String CNAME = ServerManagementController.class.getName();
    private static final String ADD_SERVER_REDIRECT = "redirect:/ui/server-management/add-server";

    private static final Logger DEBUGGER = LogManager.getLogger(Constants.DEBUGGER);
    private static final boolean DEBUG = DEBUGGER.isDebugEnabled();
    private static final Logger ERROR_RECORDER = LogManager.getLogger(Constants.ERROR_LOGGER + CNAME);

    public final void setServiceId(final String value)
    {
        final String methodName = ServerManagementController.CNAME + "#setServiceId(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.serviceId = value;
    }

    public final void setDefaultPage(final String value)
    {
        final String methodName = ServerManagementController.CNAME + "#setDefaultPage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.defaultPage = value;
    }

    public final void setAddServerPage(final String value)
    {
        final String methodName = ServerManagementController.CNAME + "#setAddServerPage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.addServerPage = value;
    }

    public final void setViewServerPage(final String value)
    {
        final String methodName = ServerManagementController.CNAME + "#setViewServerPage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.viewServerPage = value;
    }

    public final void setMessageNoDmgrsFound(final String value)
    {
        final String methodName = ServerManagementController.CNAME + "#setMessageNoDmgrsFound(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageNoDmgrsFound = value;
    }

    public final void setAddServerRedirect(final String value)
    {
        final String methodName = ServerManagementController.CNAME + "#setAddServerRedirect(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.addServerRedirect = value;
    }

    public final void setAdminConsolePage(final String value)
    {
        final String methodName = ServerManagementController.CNAME + "#setAdminConsolePage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.adminConsolePage = value;
    }

    public final void setAppConfig(final ApplicationServiceBean value)
    {
        final String methodName = ServerManagementController.CNAME + "#setAppConfig(final ApplicationServiceBean value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.appConfig = value;
    }

    public final void setRecordsPerPage(final int value)
    {
        final String methodName = ServerManagementController.CNAME + "#setRecordsPerPage(final int value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.recordsPerPage = value;
    }

    public final void setValidator(final ServerValidator value)
    {
        final String methodName = ServerManagementController.CNAME + "#setValidator(final ServerValidator value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.validator = value;
    }

    public final void setAvailableDomains(final List<String> value)
    {
        final String methodName = ServerManagementController.CNAME + "#setAvailableDomains(final List<String> value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.availableDomains = value;
    }

    public final void setAddDatacenterRedirect(final String value)
    {
        final String methodName = ServerManagementController.CNAME + "#setAddDatacenterRedirect(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.addDatacenterRedirect = value;
    }

    public final void setMessageServerAdded(final String value)
    {
        final String methodName = ServerManagementController.CNAME + "#setMessageServerAdded(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageServerAdded = value;
    }

    public final void setMessageAddServerSuccess(final String value)
    {
        final String methodName = ServerManagementController.CNAME + "#setMessageAddServerSuccess(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageAddServerSuccess = value;
    }

    public final void setMessageNoServersFound(final String value)
    {
        final String methodName = ServerManagementController.CNAME + "#setMessageNoServersFound(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageNoServersFound = value;
    }

    @RequestMapping(value = "/default", method = RequestMethod.GET)
    public final ModelAndView showDefaultPage()
    {
        final String methodName = ServerManagementController.CNAME + "#showDefaultPage()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
        }

        ModelAndView mView = new ModelAndView();

        final ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        final HttpServletRequest hRequest = requestAttributes.getRequest();
        final HttpSession hSession = hRequest.getSession();
        final UserAccount userAccount = (UserAccount) hSession.getAttribute(Constants.USER_ACCOUNT);

        if (DEBUG)
        {
            DEBUGGER.debug("ServletRequestAttributes: {}", requestAttributes);
            DEBUGGER.debug("HttpServletRequest: {}", hRequest);
            DEBUGGER.debug("HttpSession: {}", hSession);
            DEBUGGER.debug("Session ID: {}", hSession.getId());
            DEBUGGER.debug("UserAccount: {}", userAccount);

            DEBUGGER.debug("Dumping session content:");
            Enumeration<?> sessionEnumeration = hSession.getAttributeNames();

            while (sessionEnumeration.hasMoreElements())
            {
                String element = (String) sessionEnumeration.nextElement();
                Object value = hSession.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request content:");
            Enumeration<?> requestEnumeration = hRequest.getAttributeNames();

            while (requestEnumeration.hasMoreElements())
            {
                String element = (String) requestEnumeration.nextElement();
                Object value = hRequest.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request parameters:");
            Enumeration<?> paramsEnumeration = hRequest.getParameterNames();

            while (paramsEnumeration.hasMoreElements())
            {
                String element = (String) paramsEnumeration.nextElement();
                Object value = hRequest.getParameter(element);

                DEBUGGER.debug("Parameter: {}; Value: {}", element, value);
            }
        }

        mView.addObject(Constants.COMMAND, new Server());
        mView.setViewName(this.defaultPage);

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }

    @RequestMapping(value = "/search/terms/{terms}/page/{page}", method = RequestMethod.GET)
    public final ModelAndView showSearchPage(@PathVariable("terms") final String terms, @PathVariable("page") final int page)
    {
        final String methodName = ServerManagementController.CNAME + "#showSearchPage(@PathVariable(\"terms\") final String terms, @PathVariable(\"page\") final int page)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", terms);
            DEBUGGER.debug("Value: {}", page);
        }

        ModelAndView mView = new ModelAndView();

        final ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        final HttpServletRequest hRequest = requestAttributes.getRequest();
        final HttpSession hSession = hRequest.getSession();
        final UserAccount userAccount = (UserAccount) hSession.getAttribute(Constants.USER_ACCOUNT);
        final IServerManagementProcessor processor = (IServerManagementProcessor) new ServerManagementProcessorImpl();

        if (DEBUG)
        {
            DEBUGGER.debug("ServletRequestAttributes: {}", requestAttributes);
            DEBUGGER.debug("HttpServletRequest: {}", hRequest);
            DEBUGGER.debug("HttpSession: {}", hSession);
            DEBUGGER.debug("Session ID: {}", hSession.getId());
            DEBUGGER.debug("UserAccount: {}", userAccount);

            DEBUGGER.debug("Dumping session content:");
            Enumeration<?> sessionEnumeration = hSession.getAttributeNames();

            while (sessionEnumeration.hasMoreElements())
            {
                String element = (String) sessionEnumeration.nextElement();
                Object value = hSession.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request content:");
            Enumeration<?> requestEnumeration = hRequest.getAttributeNames();

            while (requestEnumeration.hasMoreElements())
            {
                String element = (String) requestEnumeration.nextElement();
                Object value = hRequest.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request parameters:");
            Enumeration<?> paramsEnumeration = hRequest.getParameterNames();

            while (paramsEnumeration.hasMoreElements())
            {
                String element = (String) paramsEnumeration.nextElement();
                Object value = hRequest.getParameter(element);

                DEBUGGER.debug("Parameter: {}; Value: {}", element, value);
            }
        }

        try
        {
            RequestHostInfo reqInfo = new RequestHostInfo();
            reqInfo.setHostName(hRequest.getRemoteHost());
            reqInfo.setHostAddress(hRequest.getRemoteAddr());

            if (DEBUG)
            {
                DEBUGGER.debug("RequestHostInfo: {}", reqInfo);
            }

            ServerManagementRequest request = new ServerManagementRequest();
            request.setApplicationId(this.appConfig.getApplicationId());
            request.setApplicationName(this.appConfig.getApplicationName());
            request.setAttribute(terms);
            request.setRequestInfo(reqInfo);
            request.setServiceId(this.serviceId);
            request.setUserAccount(userAccount);

            if (DEBUG)
            {
                DEBUGGER.debug("ServerManagementRequest: {}", request);
            }

            ServerManagementResponse response = processor.listServersByAttribute(request);

            if (DEBUG)
            {
                DEBUGGER.debug("ServerManagementResponse: {}", response);
            }

            if (response.getRequestStatus() == CoreServicesStatus.SUCCESS)
            {
                mView.addObject("pages", (int) Math.ceil(response.getEntryCount() * 1.0 / this.recordsPerPage));
                mView.addObject("page", page);
                mView.addObject("searchTerms", terms);
                mView.addObject(Constants.SEARCH_RESULTS, response.getServerList());
                mView.addObject(Constants.COMMAND, new Server());
                mView.setViewName(this.defaultPage);
            }
            else if (response.getRequestStatus() == CoreServicesStatus.UNAUTHORIZED)
            {
                mView.setViewName(this.appConfig.getUnauthorizedPage());
            }
            else
            {
                mView.setViewName(this.appConfig.getErrorResponsePage());
            }
        }
        catch (final ServerManagementException smx)
        {
            ERROR_RECORDER.error(smx.getMessage(), smx);

            mView.setViewName(this.appConfig.getErrorResponsePage());
        }

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }

    @RequestMapping(value = "/service-consoles", method = RequestMethod.GET)
    public final ModelAndView showAdminConsoles()
    {
        final String methodName = ServerManagementController.CNAME + "#showAdminConsoles()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
        }

        ModelAndView mView = new ModelAndView();

        final ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        final HttpServletRequest hRequest = requestAttributes.getRequest();
        final HttpSession hSession = hRequest.getSession();
        final UserAccount userAccount = (UserAccount) hSession.getAttribute(Constants.USER_ACCOUNT);
        final IServerManagementProcessor serverMgr = (IServerManagementProcessor) new ServerManagementProcessorImpl();

        if (DEBUG)
        {
            DEBUGGER.debug("ServletRequestAttributes: {}", requestAttributes);
            DEBUGGER.debug("HttpServletRequest: {}", hRequest);
            DEBUGGER.debug("HttpSession: {}", hSession);
            DEBUGGER.debug("Session ID: {}", hSession.getId());
            DEBUGGER.debug("UserAccount: {}", userAccount);

            DEBUGGER.debug("Dumping session content:");
            Enumeration<?> sessionEnumeration = hSession.getAttributeNames();

            while (sessionEnumeration.hasMoreElements())
            {
                String element = (String) sessionEnumeration.nextElement();
                Object value = hSession.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request content:");
            Enumeration<?> requestEnumeration = hRequest.getAttributeNames();

            while (requestEnumeration.hasMoreElements())
            {
                String element = (String) requestEnumeration.nextElement();
                Object value = hRequest.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request parameters:");
            Enumeration<?> paramsEnumeration = hRequest.getParameterNames();

            while (paramsEnumeration.hasMoreElements())
            {
                String element = (String) paramsEnumeration.nextElement();
                Object value = hRequest.getParameter(element);

                DEBUGGER.debug("Parameter: {}; Value: {}", element, value);
            }
        }

        try
        {
            RequestHostInfo reqInfo = new RequestHostInfo();
            reqInfo.setHostName(hRequest.getRemoteHost());
            reqInfo.setHostAddress(hRequest.getRemoteAddr());

            if (DEBUG)
            {
                DEBUGGER.debug("RequestHostInfo: {}", reqInfo);
            }

            ServerManagementRequest serviceReq = new ServerManagementRequest();
            serviceReq.setRequestInfo(reqInfo);
            serviceReq.setUserAccount(userAccount);
            serviceReq.setServiceId(this.serviceId);
            serviceReq.setApplicationId(this.appConfig.getApplicationId());
            serviceReq.setApplicationName(this.appConfig.getApplicationName());
            serviceReq.setAttribute(ServerType.DMGRSERVER.toString());

            if (DEBUG)
            {
                DEBUGGER.debug("ServerManagementRequest: {}", serviceReq);
            }

            ServerManagementResponse response = serverMgr.listServersByAttribute(serviceReq);

            if (DEBUG)
            {
                DEBUGGER.debug("ServerManagementResponse: {}", response);
            }

            if (response.getRequestStatus() == CoreServicesStatus.SUCCESS)
            {
                List<Server> serverList = response.getServerList();

                if (DEBUG)
                {
                    DEBUGGER.debug("serverList: {}", serverList);
                }

                if ((serverList != null) && (serverList.size() != 0))
                {
                    mView.addObject("serverList", serverList);
                    mView.setViewName(this.adminConsolePage);
                }
                else
                {
                	mView.addObject(Constants.COMMAND, new Server());
                    mView.addObject(Constants.MESSAGE_RESPONSE, this.messageNoDmgrsFound);
                    mView.setViewName(this.addServerPage);
                }
            }
            else if (response.getRequestStatus() == CoreServicesStatus.UNAUTHORIZED)
            {
                mView.setViewName(this.appConfig.getUnauthorizedPage());
            }
            else
            {
                mView.setViewName(this.appConfig.getErrorResponsePage());
            }
        }
        catch (final ServerManagementException smx)
        {
            ERROR_RECORDER.error(smx.getMessage(), smx);

            mView.setViewName(this.appConfig.getErrorResponsePage());
        }

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }

    @RequestMapping(value = "/server/{serverGuid}", method = RequestMethod.GET)
    public final ModelAndView showServerDetail(@PathVariable("serverGuid") final String serverGuid)
    {
        final String methodName = ServerManagementController.CNAME + "#showServerDetail(@PathVariable(\"serverGuid\") final String serverGuid)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("serverName: {}", serverGuid);
        }

        ModelAndView mView = new ModelAndView();

        final ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        final HttpServletRequest hRequest = requestAttributes.getRequest();
        final HttpSession hSession = hRequest.getSession();
        final UserAccount userAccount = (UserAccount) hSession.getAttribute(Constants.USER_ACCOUNT);
        final IServerManagementProcessor serverMgr = (IServerManagementProcessor) new ServerManagementProcessorImpl();

        if (DEBUG)
        {
            DEBUGGER.debug("ServletRequestAttributes: {}", requestAttributes);
            DEBUGGER.debug("HttpServletRequest: {}", hRequest);
            DEBUGGER.debug("HttpSession: {}", hSession);
            DEBUGGER.debug("Session ID: {}", hSession.getId());
            DEBUGGER.debug("UserAccount: {}", userAccount);

            DEBUGGER.debug("Dumping session content:");
            Enumeration<?> sessionEnumeration = hSession.getAttributeNames();

            while (sessionEnumeration.hasMoreElements())
            {
                String element = (String) sessionEnumeration.nextElement();
                Object value = hSession.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request content:");
            Enumeration<?> requestEnumeration = hRequest.getAttributeNames();

            while (requestEnumeration.hasMoreElements())
            {
                String element = (String) requestEnumeration.nextElement();
                Object value = hRequest.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request parameters:");
            Enumeration<?> paramsEnumeration = hRequest.getParameterNames();

            while (paramsEnumeration.hasMoreElements())
            {
                String element = (String) paramsEnumeration.nextElement();
                Object value = hRequest.getParameter(element);

                DEBUGGER.debug("Parameter: {}; Value: {}", element, value);
            }
        }

        try
        {
            RequestHostInfo reqInfo = new RequestHostInfo();
            reqInfo.setHostAddress(hRequest.getRemoteAddr());
            reqInfo.setHostName(hRequest.getRemoteHost());

            if (DEBUG)
            {
                DEBUGGER.debug("RequestHostInfo: {}", reqInfo);
            }

            Server target = new Server();
            target.setServerGuid(serverGuid);

            if (DEBUG)
            {
                DEBUGGER.debug("Server: {}", target);
            }

            ServerManagementRequest request = new ServerManagementRequest();
            request.setRequestInfo(reqInfo);
            request.setUserAccount(userAccount);
            request.setServiceId(this.serviceId);
            request.setTargetServer(target);
            request.setApplicationId(this.appConfig.getApplicationId());
            request.setApplicationName(this.appConfig.getApplicationName());

            if (DEBUG)
            {
                DEBUGGER.debug("ServerManagementRequest: {}", request);
            }

            ServerManagementResponse response = serverMgr.getServerData(request);

            if (DEBUG)
            {
                DEBUGGER.debug("ServerManagementResponse: {}", response);
            }

            switch(response.getRequestStatus())
            {
				case FAILURE:
					mView.addObject(Constants.ERROR_MESSAGE, this.messageNoServersFound);
					mView.addObject(Constants.COMMAND, new Server());
					mView.setViewName(this.defaultPage);

					break;
				case SUCCESS:
	                // yay
                    mView.addObject("statusList", ServerStatus.values());
                    mView.addObject("server", response.getServer());
                    mView.setViewName(this.viewServerPage);

					break;
				case UNAUTHORIZED:
					mView.setViewName(this.appConfig.getUnauthorizedPage());

					break;
				default:
					mView.addObject(Constants.ERROR_MESSAGE, this.appConfig.getMessageRequestProcessingFailure());
					mView.setViewName(this.defaultPage);

					break;
            }
        }
        catch (final ServerManagementException smx)
        {
            ERROR_RECORDER.error(smx.getMessage(), smx);

            mView.setViewName(this.appConfig.getErrorResponsePage());
        }

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }

    @RequestMapping(value = "/server-control", method = RequestMethod.GET)
    public final ModelAndView showServerControl()
    {
        final String methodName = ServerManagementController.CNAME + "#showServerControl()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
        }

        ModelAndView mView = new ModelAndView();

        final ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        final HttpServletRequest hRequest = requestAttributes.getRequest();
        final HttpSession hSession = hRequest.getSession();
        final UserAccount userAccount = (UserAccount) hSession.getAttribute(Constants.USER_ACCOUNT);

        if (DEBUG)
        {
            DEBUGGER.debug("ServletRequestAttributes: {}", requestAttributes);
            DEBUGGER.debug("HttpServletRequest: {}", hRequest);
            DEBUGGER.debug("HttpSession: {}", hSession);
            DEBUGGER.debug("Session ID: {}", hSession.getId());
            DEBUGGER.debug("UserAccount: {}", userAccount);

            DEBUGGER.debug("Dumping session content:");
            Enumeration<?> sessionEnumeration = hSession.getAttributeNames();

            while (sessionEnumeration.hasMoreElements())
            {
                String element = (String) sessionEnumeration.nextElement();
                Object value = hSession.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request content:");
            Enumeration<?> requestEnumeration = hRequest.getAttributeNames();

            while (requestEnumeration.hasMoreElements())
            {
                String element = (String) requestEnumeration.nextElement();
                Object value = hRequest.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request parameters:");
            Enumeration<?> paramsEnumeration = hRequest.getParameterNames();

            while (paramsEnumeration.hasMoreElements())
            {
                String element = (String) paramsEnumeration.nextElement();
                Object value = hRequest.getParameter(element);

                DEBUGGER.debug("Parameter: {}; Value: {}", element, value);
            }
        }

        mView.setViewName(this.defaultPage);

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }

    @RequestMapping(value = "/add-server", method = RequestMethod.GET)
    public final ModelAndView showAddNewServer()
    {
        final String methodName = ServerManagementController.CNAME + "#showAddNewServer()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
        }

        ModelAndView mView = new ModelAndView();

        final ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        final HttpServletRequest hRequest = requestAttributes.getRequest();
        final HttpSession hSession = hRequest.getSession();
        final UserAccount userAccount = (UserAccount) hSession.getAttribute(Constants.USER_ACCOUNT);
        final IServerManagementProcessor processor = (IServerManagementProcessor) new ServerManagementProcessorImpl();
        final IDatacenterManagementProcessor dataCtrProcessor = (IDatacenterManagementProcessor) new DatacenterManagementProcessorImpl();

        if (DEBUG)
        {
            DEBUGGER.debug("ServletRequestAttributes: {}", requestAttributes);
            DEBUGGER.debug("HttpServletRequest: {}", hRequest);
            DEBUGGER.debug("HttpSession: {}", hSession);
            DEBUGGER.debug("Session ID: {}", hSession.getId());
            DEBUGGER.debug("UserAccount: {}", userAccount);

            DEBUGGER.debug("Dumping session content:");
            Enumeration<?> sessionEnumeration = hSession.getAttributeNames();

            while (sessionEnumeration.hasMoreElements())
            {
                String element = (String) sessionEnumeration.nextElement();
                Object value = hSession.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request content:");
            Enumeration<?> requestEnumeration = hRequest.getAttributeNames();

            while (requestEnumeration.hasMoreElements())
            {
                String element = (String) requestEnumeration.nextElement();
                Object value = hRequest.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request parameters:");
            Enumeration<?> paramsEnumeration = hRequest.getParameterNames();

            while (paramsEnumeration.hasMoreElements())
            {
                String element = (String) paramsEnumeration.nextElement();
                Object value = hRequest.getParameter(element);

                DEBUGGER.debug("Parameter: {}; Value: {}", element, value);
            }
        }

        RequestHostInfo reqInfo = new RequestHostInfo();
        reqInfo.setHostName(hRequest.getRemoteHost());
        reqInfo.setHostAddress(hRequest.getRemoteAddr());

        if (DEBUG)
        {
            DEBUGGER.debug("RequestHostInfo: {}", reqInfo);
        }

        ServerManagementRequest dmgrRequest = new ServerManagementRequest();
        dmgrRequest.setRequestInfo(reqInfo);
        dmgrRequest.setUserAccount(userAccount);
        dmgrRequest.setServiceId(this.serviceId);
        dmgrRequest.setApplicationId(this.appConfig.getApplicationId());
        dmgrRequest.setApplicationName(this.appConfig.getApplicationName());
        dmgrRequest.setAttribute(ServerType.DMGRSERVER.toString());

        try
        {
            ServerManagementResponse dmgrResponse = processor.listServersByAttribute(dmgrRequest);

            if (DEBUG)
            {
                DEBUGGER.debug("ServerManagementResponse: {}", dmgrResponse);
            }

            if (dmgrResponse.getRequestStatus() == CoreServicesStatus.SUCCESS)
            {
                List<Server> dmgrServers = dmgrResponse.getServerList();

                if (DEBUG)
                {
                    DEBUGGER.debug("List<Server>: {}", dmgrServers);
                }

                mView.addObject("dmgrServers", dmgrServers);
            }
            else if (dmgrResponse.getRequestStatus() == CoreServicesStatus.UNAUTHORIZED)
            {
                mView.setViewName(this.appConfig.getUnauthorizedPage());

                return mView;
            }
        }
        catch (final ServerManagementException smx)
        {
            ERROR_RECORDER.error(smx.getMessage(), smx);
        }

        // list datacenters
        DatacenterManagementRequest dmRequest = new DatacenterManagementRequest();
        dmRequest.setApplicationId(this.appConfig.getApplicationId());
        dmRequest.setApplicationName(this.appConfig.getApplicationName());
        dmRequest.setRequestInfo(reqInfo);
        dmRequest.setServiceId(this.serviceId);
        dmRequest.setUserAccount(userAccount);

        if (DEBUG)
        {
            DEBUGGER.debug("DatacenterManagementRequest: {}", dmRequest);
        }

        try
        {
            DatacenterManagementResponse dcResponse = dataCtrProcessor.listDatacenters(dmRequest);

            if (DEBUG)
            {
                DEBUGGER.debug("DatacenterManagementResponse: {}", dcResponse);
            }

            switch (dcResponse.getRequestStatus())
            {
				case FAILURE:
					mView.addObject(Constants.ERROR_MESSAGE, this.appConfig.getMessageRequestProcessingFailure());
					mView.setViewName(this.addServerPage);
	
					break;
				case SUCCESS:
	                List<Datacenter> datacenters = dcResponse.getDatacenterList();
	
	                if (DEBUG)
	                {
	                    DEBUGGER.debug("List<Datacenter>: {}", datacenters);
	                }
	
	                mView.addObject("datacenters", datacenters);
	
					break;
				case UNAUTHORIZED:
					mView.setViewName(this.appConfig.getUnauthorizedPage());
	
					break;
				default:
	                // redirect to add datacenter
	                mView = new ModelAndView(new RedirectView());
	                mView.setViewName(this.addDatacenterRedirect);
	
					break;
            }
        }
        catch (final DatacenterManagementException dmx)
        {
            ERROR_RECORDER.error(dmx.getMessage(), dmx);

            // redirect to add datacenter
            mView = new ModelAndView(new RedirectView());
            mView.setViewName(this.addDatacenterRedirect);
        }

        mView.addObject("domainList", this.availableDomains);
        mView.addObject("serverTypes", ServerType.values());
        mView.addObject("serverStatuses", ServerStatus.values());
        mView.addObject("serverRegions", ServiceRegion.values());
        mView.addObject("networkPartitions", NetworkPartition.values());
        mView.addObject(Constants.COMMAND, new Server());
        mView.setViewName(this.addServerPage);

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }

    @RequestMapping(value = "/add-server", method = RequestMethod.POST)
    public final ModelAndView addNewServer(@ModelAttribute("request") final Server request, final BindingResult bindResult)
    {
        final String methodName = ServerManagementController.CNAME + "#addNewServer(@ModelAttribute(\"request\") final Server request, final BindingResult bindResult)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("ServerRequest: {}", request);
        }

        ModelAndView mView = new ModelAndView();

        final ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        final HttpServletRequest hRequest = requestAttributes.getRequest();
        final HttpSession hSession = hRequest.getSession();
        final UserAccount userAccount = (UserAccount) hSession.getAttribute(Constants.USER_ACCOUNT);
        final IServerManagementProcessor serverMgr = (IServerManagementProcessor) new ServerManagementProcessorImpl();
        final IDatacenterManagementProcessor dcManager = (IDatacenterManagementProcessor) new DatacenterManagementProcessorImpl();

        if (DEBUG)
        {
            DEBUGGER.debug("ServletRequestAttributes: {}", requestAttributes);
            DEBUGGER.debug("HttpServletRequest: {}", hRequest);
            DEBUGGER.debug("HttpSession: {}", hSession);
            DEBUGGER.debug("Session ID: {}", hSession.getId());
            DEBUGGER.debug("UserAccount: {}", userAccount);

            DEBUGGER.debug("Dumping session content:");
            Enumeration<?> sessionEnumeration = hSession.getAttributeNames();

            while (sessionEnumeration.hasMoreElements())
            {
                String element = (String) sessionEnumeration.nextElement();
                Object value = hSession.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request content:");
            Enumeration<?> requestEnumeration = hRequest.getAttributeNames();

            while (requestEnumeration.hasMoreElements())
            {
                String element = (String) requestEnumeration.nextElement();
                Object value = hRequest.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request parameters:");
            Enumeration<?> paramsEnumeration = hRequest.getParameterNames();

            while (paramsEnumeration.hasMoreElements())
            {
                String element = (String) paramsEnumeration.nextElement();
                Object value = hRequest.getParameter(element);

                DEBUGGER.debug("Parameter: {}; Value: {}", element, value);
            }
        }

        this.validator.validate(request, bindResult);

        if (bindResult.hasErrors())
        {
            // validation failed
            ERROR_RECORDER.error("Errors: {}", bindResult.getAllErrors());

            mView.addObject(Constants.ERROR_MESSAGE, this.appConfig.getMessageValidationFailed());
            mView.addObject(Constants.BIND_RESULT, bindResult.getAllErrors());
            mView.addObject(Constants.COMMAND, new Server());
            mView.setViewName(this.addServerPage);

            return mView;
        }

        try
        {
            RequestHostInfo reqInfo = new RequestHostInfo();
            reqInfo.setHostName(hRequest.getRemoteHost());
            reqInfo.setHostAddress(hRequest.getRemoteAddr());

            if (DEBUG)
            {
                DEBUGGER.debug("RequestHostInfo: {}", reqInfo);
            }

            Datacenter datacenter = new Datacenter();
            datacenter.setGuid(request.getDatacenter().getGuid());

            if (DEBUG)
            {
            	DEBUGGER.debug("Datacenter: {}", datacenter);
            }

            DatacenterManagementRequest dcRequest = new DatacenterManagementRequest();
            dcRequest.setDatacenter(datacenter);
            dcRequest.setApplicationId(this.appConfig.getApplicationId());
            dcRequest.setApplicationName(this.appConfig.getApplicationName());
            dcRequest.setRequestInfo(reqInfo);
            dcRequest.setUserAccount(userAccount);

            if (DEBUG)
            {
            	DEBUGGER.debug("DatacenterManagementRequest: {}", dcRequest);
            }

            DatacenterManagementResponse dcResponse = dcManager.getDatacenterData(dcRequest);

            if (DEBUG)
            {
            	DEBUGGER.debug("DatacenterManagementResponse: {}", dcResponse);
            }

            switch (dcResponse.getRequestStatus())
            {
				case FAILURE:
					mView.addObject(Constants.ERROR_MESSAGE, this.appConfig.getMessageRequestProcessingFailure());
					mView.addObject(Constants.COMMAND, new Server());
					mView.setViewName(this.addServerPage);

					break;
				case SUCCESS:
		            Server server = new Server();
		            server.setVirtualId(request.getVirtualId());
		            server.setOsName(request.getOsName());
		            server.setOperIpAddress(request.getOperIpAddress());
		            server.setOperHostName(request.getOperHostName());
		            server.setMgmtIpAddress(request.getMgmtIpAddress());
		            server.setMgmtHostName(request.getMgmtHostName());
		            server.setBkIpAddress(request.getBkIpAddress());
		            server.setBkHostName(request.getBkHostName());
		            server.setNasIpAddress(request.getNasIpAddress());
		            server.setNasHostName(request.getNasHostName());
		            server.setNatAddress(request.getNatAddress());
		            server.setServerStatus(request.getServerStatus());
		            server.setServerType(request.getServerType());
		            server.setServerComments(request.getServerComments());
		            server.setCpuType(request.getCpuType());
		            server.setCpuCount(request.getCpuCount());
		            server.setServerRack(request.getServerRack());
		            server.setServerModel(request.getServerModel());
		            server.setRackPosition(request.getRackPosition());
		            server.setSerialNumber(request.getSerialNumber());
		            server.setInstalledMemory(request.getInstalledMemory());

		            // figure out the type
		            switch (request.getServerType())
		            {
		                case APPSERVER:
		                    // if its an application server, theres no location configured
		                    // because its driven by the owning dmgr
		                    Server dmgrServer = new Server();
		                    dmgrServer.setServerGuid(request.getOwningDmgr().getServerGuid());

		                    if (DEBUG)
		                    {
		                        DEBUGGER.debug("Server: {}", dmgrServer);
		                    }

		                    // find out what datacenter/partition/etc
		                    ServerManagementRequest dmgrRequest = new ServerManagementRequest();
		                    dmgrRequest.setRequestInfo(reqInfo);
		                    dmgrRequest.setServiceId(this.serviceId);
		                    dmgrRequest.setTargetServer(dmgrServer);
		                    dmgrRequest.setUserAccount(userAccount);
		                    dmgrRequest.setApplicationId(this.appConfig.getApplicationId());
		                    dmgrRequest.setApplicationName(this.appConfig.getApplicationName());

		                    if (DEBUG)
		                    {
		                        DEBUGGER.debug("ServerManagementRequest: {}", dmgrRequest);
		                    }

		                    ServerManagementResponse dmgrResponse = serverMgr.getServerData(dmgrRequest);

		                    if (DEBUG)
		                    {
		                        DEBUGGER.debug("ServerManagementResponse: {}", dmgrResponse);
		                    }

		                    switch (dmgrResponse.getRequestStatus())
		                    {
								case FAILURE:
			                        // no dmgr information found for the request
			                        mView.addObject(Constants.ERROR_RESPONSE, this.messageNoDmgrsFound);
			                        mView.setViewName(ServerManagementController.ADD_SERVER_REDIRECT);
	
									break;
								case SUCCESS:
			                        Server dmgr = dmgrResponse.getServer();
	
			                        if (DEBUG)
			                        {
			                            DEBUGGER.debug("Server: {}", dmgr);
			                        }
	
			                        // excellent
			                        server.setOwningDmgr(dmgrServer);
			                        server.setServerRegion(dmgr.getServerRegion());
			                        server.setDomainName(dmgr.getDomainName());
			                        server.setNetworkPartition(dmgr.getNetworkPartition());
	
									break;
								case UNAUTHORIZED:
									mView.setViewName(this.appConfig.getUnauthorizedPage());
	
									break;
								default:
			                        // no dmgr information found for the request
			                        mView.addObject(Constants.ERROR_RESPONSE, this.messageNoDmgrsFound);
			                        mView.setViewName(ServerManagementController.ADD_SERVER_REDIRECT);
	
									break;
		                    }
		                default:
		                    Datacenter reqDatacenter = new Datacenter();
		                    reqDatacenter.setGuid(request.getDatacenter().getGuid());

		                    if (DEBUG)
		                    {
		                        DEBUGGER.debug("Datacenter: {}", reqDatacenter);
		                    }

		                    server.setDatacenter(reqDatacenter);
		                    server.setServerRegion(request.getServerRegion());
		                    server.setDomainName(request.getDomainName());
		                    server.setDmgrPort(request.getDmgrPort());
		                    server.setMgrUrl(request.getMgrUrl());
		                    server.setNetworkPartition(request.getNetworkPartition());

		                    break;
		            }

		            if (DEBUG)
		            {
		                DEBUGGER.debug("Server: {}", server);
		            }

		            ServerManagementRequest serverReq = new ServerManagementRequest();
		            serverReq.setRequestInfo(reqInfo);
		            serverReq.setUserAccount(userAccount);
		            serverReq.setServiceId(this.serviceId);
		            serverReq.setTargetServer(server);
		            serverReq.setApplicationId(this.appConfig.getApplicationId());
		            serverReq.setApplicationName(this.appConfig.getApplicationName());

		            if (DEBUG)
		            {
		                DEBUGGER.debug("ServerManagementRequest: {}", request);
		            }

		            ServerManagementResponse response = serverMgr.addNewServer(serverReq);

		            if (DEBUG)
		            {
		                DEBUGGER.debug("ServerManagementResponse: {}", response);
		            }

		            if (response.getRequestStatus() == CoreServicesStatus.SUCCESS)
		            {
		                // all set
		                // at this point we should be kicking off a request to install the agent
		                /*ServerManagementRequest installRequest = new ServerManagementRequest();
		                installRequest.setInstallAgent(true);
		                installRequest.setRequestInfo(reqInfo);
		                installRequest.setUserAccount(userAccount);
		                installRequest.setTargetServer(request);
		                installRequest.setServiceId(this.systemService);

		                if (DEBUG)
		                {
		                    DEBUGGER.debug("ServerManagementRequest: {}", installRequest);
		                }

		                serverMgr.installSoftwarePackage(installRequest);*/ // we are NOT waiting for a response here

		                mView.addObject(Constants.RESPONSE_MESSAGE, this.messageAddServerSuccess);
		                mView.setViewName(ServerManagementController.ADD_SERVER_REDIRECT);
		            }
		            else if (response.getRequestStatus() == CoreServicesStatus.UNAUTHORIZED)
		            {
		                mView.setViewName(this.appConfig.getUnauthorizedPage());
		            }
		            else
		            {
		                mView.setViewName(this.appConfig.getErrorResponsePage());
		            }

					break;
				case UNAUTHORIZED:
					mView.setViewName(this.appConfig.getUnauthorizedPage());

					break;
				default:
					break;
            }
        }
        catch (final ServerManagementException smx)
        {
            ERROR_RECORDER.error(smx.getMessage(), smx);

            mView.setViewName(this.appConfig.getErrorResponsePage());
        }
        catch (DatacenterManagementException dmx)
        {
            ERROR_RECORDER.error(dmx.getMessage(), dmx);

            mView.setViewName(this.appConfig.getErrorResponsePage());
		}

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }

    @RequestMapping(value = "/server-control", method = RequestMethod.POST)
    public final ModelAndView runServerControlOperation(@ModelAttribute("request") final SystemCheckRequest request, final BindingResult bindResult)
    {
        final String methodName = ServerManagementController.CNAME + "#runServerControlOperation(@ModelAttribute(\"request\") final SystemCheckRequest request, final BindingResult bindResult)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("SystemCheckRequest: {}", request);
        }

        ModelAndView mView = new ModelAndView();

        final ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        final HttpServletRequest hRequest = requestAttributes.getRequest();
        final HttpSession hSession = hRequest.getSession();
        final UserAccount userAccount = (UserAccount) hSession.getAttribute(Constants.USER_ACCOUNT);

        if (DEBUG)
        {
            DEBUGGER.debug("ServletRequestAttributes: {}", requestAttributes);
            DEBUGGER.debug("HttpServletRequest: {}", hRequest);
            DEBUGGER.debug("HttpSession: {}", hSession);
            DEBUGGER.debug("Session ID: {}", hSession.getId());
            DEBUGGER.debug("UserAccount: {}", userAccount);

            DEBUGGER.debug("Dumping session content:");
            Enumeration<?> sessionEnumeration = hSession.getAttributeNames();

            while (sessionEnumeration.hasMoreElements())
            {
                String element = (String) sessionEnumeration.nextElement();
                Object value = hSession.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request content:");
            Enumeration<?> requestEnumeration = hRequest.getAttributeNames();

            while (requestEnumeration.hasMoreElements())
            {
                String element = (String) requestEnumeration.nextElement();
                Object value = hRequest.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request parameters:");
            Enumeration<?> paramsEnumeration = hRequest.getParameterNames();

            while (paramsEnumeration.hasMoreElements())
            {
                String element = (String) paramsEnumeration.nextElement();
                Object value = hRequest.getParameter(element);

                DEBUGGER.debug("Parameter: {}; Value: {}", element, value);
            }
        }

        // TODO
        RequestHostInfo reqInfo = new RequestHostInfo();
        reqInfo.setHostName(hRequest.getRemoteHost());
        reqInfo.setHostAddress(hRequest.getRemoteAddr());

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public final ModelAndView doServerSearch(@ModelAttribute("request") final Server server, final BindingResult bindResult)
    {
        final String methodName = ServerManagementController.CNAME + "#doServerSearch(@ModelAttribute(\"request\") final Server server, final BindingResult bindResult)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", server);
        }

        ModelAndView mView = new ModelAndView();

        final ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        final HttpServletRequest hRequest = requestAttributes.getRequest();
        final HttpSession hSession = hRequest.getSession();
        final UserAccount userAccount = (UserAccount) hSession.getAttribute(Constants.USER_ACCOUNT);
        final IServerManagementProcessor processor = (IServerManagementProcessor) new ServerManagementProcessorImpl();

        if (DEBUG)
        {
            DEBUGGER.debug("ServletRequestAttributes: {}", requestAttributes);
            DEBUGGER.debug("HttpServletRequest: {}", hRequest);
            DEBUGGER.debug("HttpSession: {}", hSession);
            DEBUGGER.debug("Session ID: {}", hSession.getId());
            DEBUGGER.debug("UserAccount: {}", userAccount);

            DEBUGGER.debug("Dumping session content:");
            Enumeration<?> sessionEnumeration = hSession.getAttributeNames();

            while (sessionEnumeration.hasMoreElements())
            {
                String element = (String) sessionEnumeration.nextElement();
                Object value = hSession.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request content:");
            Enumeration<?> requestEnumeration = hRequest.getAttributeNames();

            while (requestEnumeration.hasMoreElements())
            {
                String element = (String) requestEnumeration.nextElement();
                Object value = hRequest.getAttribute(element);

                DEBUGGER.debug("Attribute: {}; Value: {}", element, value);
            }

            DEBUGGER.debug("Dumping request parameters:");
            Enumeration<?> paramsEnumeration = hRequest.getParameterNames();

            while (paramsEnumeration.hasMoreElements())
            {
                String element = (String) paramsEnumeration.nextElement();
                Object value = hRequest.getParameter(element);

                DEBUGGER.debug("Parameter: {}; Value: {}", element, value);
            }
        }

        try
        {
            RequestHostInfo reqInfo = new RequestHostInfo();
            reqInfo.setHostName(hRequest.getRemoteHost());
            reqInfo.setHostAddress(hRequest.getRemoteAddr());

            if (DEBUG)
            {
                DEBUGGER.debug("RequestHostInfo: {}", reqInfo);
            }

            ServerManagementRequest request = new ServerManagementRequest();
            request.setApplicationId(this.appConfig.getApplicationId());
            request.setApplicationName(this.appConfig.getApplicationName());
            request.setAttribute(server.getOperHostName());
            request.setRequestInfo(reqInfo);
            request.setServiceId(this.serviceId);
            request.setUserAccount(userAccount);

            if (DEBUG)
            {
                DEBUGGER.debug("ServerManagementRequest: {}", request);
            }

            ServerManagementResponse response = processor.listServersByAttribute(request);

            if (DEBUG)
            {
                DEBUGGER.debug("ServerManagementResponse: {}", response);
            }

            if (response.getRequestStatus() == CoreServicesStatus.SUCCESS)
            {
                mView.addObject("pages", (int) Math.ceil(response.getEntryCount() * 1.0 / this.recordsPerPage));
                mView.addObject("page", 1);
                mView.addObject("searchTerms", server.getOperHostName());
                mView.addObject(Constants.SEARCH_RESULTS, response.getServerList());
                mView.addObject(Constants.COMMAND, new Server());
                mView.setViewName(this.defaultPage);
            }
            else if (response.getRequestStatus() == CoreServicesStatus.UNAUTHORIZED)
            {
                mView.setViewName(this.appConfig.getUnauthorizedPage());
            }
            else
            {
                mView.setViewName(this.appConfig.getErrorResponsePage());
            }
        }
        catch (final ServerManagementException smx)
        {
            ERROR_RECORDER.error(smx.getMessage(), smx);

            mView.setViewName(this.appConfig.getErrorResponsePage());
        }

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }
}
