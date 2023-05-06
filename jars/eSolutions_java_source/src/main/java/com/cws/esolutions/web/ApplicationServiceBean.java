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
package com.cws.esolutions.web;
/*
 * Project: eSolutions_java_source
 * Package: com.cws.esolutions.web
 * File: ApplicationServiceBean.java
 *
 * History
 *
 * Author               Date                            Comments
 * ----------------------------------------------------------------------------
 * cws-khuntly          11/23/2008 22:39:20             Created.
 */
import java.lang.reflect.Field;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
/**
 * @author cws-khuntly
 * @version 1.0
 */
public class ApplicationServiceBean
{
	private String webURL = null;
	private String homePage = null;
	private String dateFormat = null;
	private String olrRedirect = null;
	private String fileEncoding = null;
	private String homeRedirect = null;
	private String emailAddress = null;
	private String logonRedirect = null;
	private String applicationId = null;
	private String expiredRedirect = null;
	private String applicationName = null;
	private String unavailablePage = null;
	private String messageOlrSetup = null;
	private String passwordMinLength = "8";
	private String unauthorizedPage = null;
	private String contactAdminsPage = null;
	private String errorResponsePage = null;
	private String searchRequestPage = null;
	private String passwordMaxLength = "128";
	private String themeMessageSource = null;
	private String requestCompletePage = null;
	private String messageAccountLocked = null;
	private String contactAdminsRedirect = null;
	private String messageNoSearchResults = null;
	private String messageEmailSendFailed = null;
	private String messageRequestCanceled = null;
	private String messagePasswordExpired = null;
	private String messageUserNotLoggedIn = null;
	private String messageValidationFailed = null;
	private String messageEmailSentSuccess = null;
	private String messageAccountSuspended = null;
	private String messageAccountNotAuthorized = null;
	private String messageRequestProcessingFailure = null;
	private String messagePasswordLengthCheckFailed = null;

    private static final String CNAME = ApplicationServiceBean.class.getName();

    private static final Logger DEBUGGER = LogManager.getLogger(Constants.DEBUGGER);
    private static final boolean DEBUG = DEBUGGER.isDebugEnabled();

    public final void setFileEncoding(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setFileEncoding(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.fileEncoding = value;
    }

    public final void setLogonRedirect(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setLogonRedirect(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.logonRedirect = value;
    }

    public final void setMessageOlrSetup(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setMessageOlrSetup(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageOlrSetup = value;
    }

    public final void setHomeRedirect(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setHomeRedirect(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.homeRedirect = value;
    }

    public void setOlrRedirect(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setOlrRedirect(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.olrRedirect = value;
    }

    public final void setHomePage(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setHomePage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.homePage = value;
    }

    public final void setUnavailablePage(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setUnavailablePage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.unavailablePage = value;
    }

    public final void setUnauthorizedPage(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setUnauthorizedPage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.unauthorizedPage = value;
    }

    public final void setContactAdminsPage(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setContactAdminsPage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.contactAdminsPage = value;
    }

    public final void setContactAdminsRedirect(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setContactAdminsRedirect(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.contactAdminsRedirect = value;
    }

    public final void setErrorResponsePage(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setErrorResponsePage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.errorResponsePage = value;
    }

    public final void setSearchRequestPage(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setSearchRequestPage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.searchRequestPage = value;
    }

    public final void setRequestCompletePage(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setRequestCompletePage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.requestCompletePage = value;
    }

    public final void setDateFormat(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setDateFormat(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.dateFormat = value;
    }

    public final void setApplicationName(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setApplicationName(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.applicationName = value;
    }

    public final void setApplicationId(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setApplicationId(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.applicationId = value;
    }

    public final void setEmailAddress(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setEmailAddress(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.emailAddress = value;
    }

    public final void setMessageRequestCanceled(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setMessageRequestCanceled(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageRequestCanceled = value;
    }

    public final void setMessageEmailSendFailed(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setMessageEmailSendFailed(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageEmailSendFailed = value;
    }

    public final void setMessagePasswordExpired(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setMessagePasswordExpired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messagePasswordExpired = value;
    }

    public final void setMessageUserNotLoggedIn(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setMessageUserNotLoggedIn(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageUserNotLoggedIn = value;
    }

    public final void setMessageAccountNotAuthorized(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setMessageAccountNotAuthorized(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageAccountNotAuthorized = value;
    }

    public final void setMessageRequestProcessingFailure(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setMessageRequestProcessingFailure(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageRequestProcessingFailure = value;
    }

    public final void setMessageValidationFailed(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setMessageValidationFailed(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageValidationFailed = value;
    }

    public final void setMessageNoSearchResults(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setMessageNoSearchResults(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageNoSearchResults = value;
    }

    public final void setMessageAccountLocked(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setMessageAccountLocked(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageAccountLocked = value;
    }

    public final void setMessageEmailSentSuccess(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setMessageEmailSentSuccess(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageEmailSentSuccess = value;
    }

    public final void setThemeMessageSource(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setThemeMessageSource(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.themeMessageSource = value;
    }

    public final void setExpiredRedirect(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setExpiredRedirect(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.expiredRedirect = value;
    }

    public final void setMessageAccountSuspended(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setMessageAccountSuspended(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageAccountSuspended = value;
    }

    public final void setMessagePasswordLengthCheckFailed(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setMessagePasswordLengthCheckFailed(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messagePasswordLengthCheckFailed = value;
    }

    public final void setWebURL(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setWebURL(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.webURL = value;
    }

    public final void setPasswordMinLength(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setPasswordMinLength(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.passwordMinLength = value;
    }

    public final void setPasswordMaxLength(final String value)
    {
        final String methodName = ApplicationServiceBean.CNAME + "#setPasswordMaxLength(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.passwordMaxLength = value;
    }

    public final String getFileEncoding()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getFileEncoding()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.fileEncoding);
        }

        return this.fileEncoding;
    }

    public final String getLogonRedirect()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getLogonRedirect()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.logonRedirect);
        }

        return this.logonRedirect;
    }

    public final String getHomeRedirect()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getHomeRedirect()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.homeRedirect);
        }

        return this.homeRedirect;
    }

    public final String getDateFormat()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getDateFormat()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.dateFormat);
        }

        return this.dateFormat;
    }

    public final String getApplicationName()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getApplicationName()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.applicationName);
        }

        return this.applicationName;
    }

    public final String getApplicationId()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getApplicationId()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.applicationId);
        }

        return this.applicationId;
    }

    public final String getMessageOlrSetup()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getMessageOlrSetup()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.messageOlrSetup);
        }

        return this.messageOlrSetup;
    }

    public final String getEmailAddress()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getEmailAddress()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.emailAddress);
        }

        return this.emailAddress;
    }

    public final String getOlrRedirect()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getChangePasswordRedirect()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.olrRedirect);
        }

        return this.olrRedirect;
    }

    public final String getHomePage()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getHomePage()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.homePage);
        }

        return this.homePage;
    }

    public final String getUnavailablePage()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getUnavailablePage()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.unavailablePage);
        }

        return this.unavailablePage;
    }

    public final String getUnauthorizedPage()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getUnauthorizedPage()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.unauthorizedPage);
        }

        return this.unauthorizedPage;
    }

    public final String getContactAdminsPage()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getContactAdminsPage()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.contactAdminsPage);
        }

        return this.contactAdminsPage;
    }

    public final String getErrorResponsePage()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getErrorResponsePage()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.errorResponsePage);
        }

        return this.errorResponsePage;
    }

    public final String getSearchRequestPage()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getSearchRequestPage()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.searchRequestPage);
        }

        return this.searchRequestPage;
    }

    public final String getRequestCompletePage()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getRequestCompletePage()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.requestCompletePage);
        }

        return this.requestCompletePage;
    }

    public final String getMessageRequestCanceled()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getMessageRequestCanceled()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.messageRequestCanceled);
        }

        return this.messageRequestCanceled;
    }

    public final String getMessageEmailSendFailed()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getMessageEmailSendFailed()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.messageEmailSendFailed);
        }

        return this.messageEmailSendFailed;
    }

    public final String getMessagePasswordExpired()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getMessagePasswordExpired()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.messagePasswordExpired);
        }

        return this.messagePasswordExpired;
    }

    public final String getMessagePasswordLengthCheckFailed()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getMessagePasswordLengthCheckFailed()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.messagePasswordLengthCheckFailed);
        }

        return this.messagePasswordLengthCheckFailed;
    }

    public final String getMessageAccountNotAuthorized()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getMessageAccountNotAuthorized()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.messageAccountNotAuthorized);
        }

        return this.messageAccountNotAuthorized;
    }

    public final String getMessageUserNotLoggedIn()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getMessageUserNotLoggedIn()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.messageUserNotLoggedIn);
        }

        return this.messageUserNotLoggedIn;
    }

    public final String getMessageRequestProcessingFailure()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getMessageRequestProcessingFailure()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.messageRequestProcessingFailure);
        }

        return this.messageRequestProcessingFailure;
    }

    public final String getMessageValidationFailed()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getMessageValidationFailed()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.messageValidationFailed);
        }

        return this.messageValidationFailed;
    }

    public final String getMessageNoSearchResults()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getMessageNoSearchResults()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.messageNoSearchResults);
        }

        return this.messageNoSearchResults;
    }

    public final String getMessageEmailSentSuccess()
    {
        final String methodName = ApplicationServiceBean.CNAME + "# getMessageEmailSentSuccess()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.messageEmailSentSuccess);
        }

        return this.messageEmailSentSuccess;
    }

    public final String getThemeMessageSource()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getThemeMessageSource()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.themeMessageSource);
        }

        return this.themeMessageSource;
    }

    public final String getContactAdminsRedirect()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getContactAdminsRedirect()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.contactAdminsRedirect);
        }

        return this.contactAdminsRedirect;
    }

    public final String getExpiredRedirect()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getExpiredRedirect()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.expiredRedirect);
        }

        return this.expiredRedirect;
    }

    public final String getMessageAccountLocked()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getMessageAccountLocked()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.messageAccountLocked);
        }

        return this.messageAccountLocked;
    }

    public final String getMessageAccountSuspended()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getMessageAccountSuspended()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.messageAccountSuspended);
        }

        return this.messageAccountSuspended;
    }

	public final String getWebURL()
	{
        final String methodName = ApplicationServiceBean.CNAME + "#getWebURL()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.webURL);
        }

        return this.webURL;
	}

    public final String getPasswordMinLength()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getPasswordMinLength()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.passwordMinLength);
        }

        return this.passwordMinLength;
    }

    public final String getPasswordMaxLength()
    {
        final String methodName = ApplicationServiceBean.CNAME + "#getPasswordMaxLength()";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", this.passwordMaxLength);
        }

        return this.passwordMaxLength;
    }

    @Override
    public final String toString()
    {
    	StringBuilder sBuilder = new StringBuilder()
            .append("[" + this.getClass().getName() + "]" + Constants.LINE_BREAK + "{" + Constants.LINE_BREAK);

        for (Field field : this.getClass().getDeclaredFields())
        {
            if (!(field.getName().equals("methodName")) &&
                    (!(field.getName().equals("CNAME"))) &&
                    (!(field.getName().equals("DEBUGGER"))) &&
                    (!(field.getName().equals("DEBUG"))) &&
                    (!(field.getName().equals("ERROR_RECORDER"))) &&
                    (!(field.getName().equals("serialVersionUID"))))
            {
                try
                {
                    if (field.get(this) != null)
                    {
                        sBuilder.append("\t" + field.getName() + " --> " + field.get(this) + Constants.LINE_BREAK);
                    }
                }
                catch (final IllegalAccessException iax) {}
            }
        }

        sBuilder.append('}');

        return sBuilder.toString();
    }
}
