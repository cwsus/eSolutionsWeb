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
package com.cws.esolutions.web.portlet;
/*
 * Project: eSolutions_java_source
 * Package: com.cws.esolutions.web.portlet
 * File: LoginController.java
 *
 * History
 *
 * Author               Date                            Comments
 * ----------------------------------------------------------------------------
 * cws-khuntly          11/23/2008 22:39:20             Created.
 */
import java.io.IOException;
import javax.portlet.PortletConfig;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletSession;
import javax.portlet.PortletException;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import javax.portlet.PortletRequestDispatcher;

import com.cws.esolutions.web.Constants;
/**
 * @author cws-khuntly
 * @version 1.0
 */
public class LoginPortlet extends GenericPortlet
{
    private String loginPage = null;

    private static final String CNAME = LoginPortlet.class.getName();

    private static final Logger DEBUGGER = LogManager.getLogger(Constants.DEBUGGER);
    private static final boolean DEBUG = DEBUGGER.isDebugEnabled();
    private static final Logger ERROR_RECORDER = LogManager.getLogger(Constants.ERROR_LOGGER + CNAME);

    @Override
    public final void init(final PortletConfig config) throws PortletException
    {
    	super.init(config);

    	this.loginPage = "/com.cws.esolutions.web.login/jsp/html/en/Login.jsp";
    }

    @Override
    public final void doView(final RenderRequest request, final RenderResponse response) throws PortletException, IOException
    {
    	final String methodName = LoginPortlet.CNAME + "#showLoginPage(final Model model)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
        }

        final PortletSession pSession = request.getPortletSession();
        final PortletRequestDispatcher dispatcher = getPortletContext().getRequestDispatcher(this.loginPage);

        dispatcher.include(request, response);
    }
}
