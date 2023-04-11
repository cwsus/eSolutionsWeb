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
 * File: ApplicationManagementController.java
 *
 * History
 *
 * Author               Date                            Comments
 * ----------------------------------------------------------------------------
 * cws-khuntly          11/23/2008 22:39:20             Created.
 */
import java.util.List;
import java.util.Enumeration;
import org.springframework.ui.Model;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.cws.esolutions.web.Constants;
import com.cws.esolutions.security.dto.UserAccount;
import com.cws.esolutions.web.ApplicationServiceBean;
import com.cws.esolutions.core.processors.dto.Article;
import com.cws.esolutions.web.validators.ArticleValidator;
import com.cws.esolutions.security.processors.dto.RequestHostInfo;
import com.cws.esolutions.core.processors.dto.KnowledgeManagementRequest;
import com.cws.esolutions.core.processors.dto.KnowledgeManagementResponse;
import com.cws.esolutions.core.processors.enums.ArticleStatus;
import com.cws.esolutions.core.processors.impl.KnowledgeManagementProcessorImpl;
import com.cws.esolutions.core.processors.exception.KnowledgeManagementException;
import com.cws.esolutions.core.processors.interfaces.IKnowledgeManagementProcessor;
/**
 * @author cws-khuntly
 * @version 1.0
 * @see org.springframework.stereotype.Controller
 */
@Controller
@RequestMapping("/knowledge-management")
public class KnowledgeManagementController
{
    private String serviceId = null;
    private int recordsPerPage = 20;
	private String defaultPage = null;
	private String addArticlePage = null;
	private String viewArticlePage = null;
	private String viewArticlesPage = null;
	private String messageArticleAdded = null;
	private ArticleValidator validator = null;
	private String messageNoArticlesFound = null;
	private String messageArticleAddFailed = null;
    private ApplicationServiceBean appConfig = null;

    private static final String CNAME = KnowledgeManagementController.class.getName();

    private static final Logger DEBUGGER = LogManager.getLogger(Constants.DEBUGGER);
    private static final boolean DEBUG = DEBUGGER.isDebugEnabled();
    private static final Logger ERROR_RECORDER = LogManager.getLogger(Constants.ERROR_LOGGER + CNAME);

    public final void setServiceId(final String value)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#setServiceId(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.serviceId = value;
    }

    public final void setAppConfig(final ApplicationServiceBean value)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#setAppConfig(final ApplicationServiceBean value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.appConfig = value;
    }

    public final void setRecordsPerPage(final int value)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#setRecordsPerPage(final int value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.recordsPerPage = value;
    }

    public final void setValidator(final ArticleValidator value)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#setValidator(final ArticleValidator value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.validator = value;
    }

    public final void setDefaultPage(final String value)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#setDefaultPage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.defaultPage = value;
    }

    public final void setViewArticlePage(final String value)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#setViewArticlePage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.viewArticlePage = value;
    }

    public final void setViewArticlesPage(final String value)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#setViewArticlesPage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.viewArticlesPage = value;
    }

    public final void setAddArticlePage(final String value)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#setAddArticlePage(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.addArticlePage = value;
    }

    public final void setMessageNoArticlesFound(final String value)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#setMessageNoArticlesFound(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageNoArticlesFound = value;
    }

    public final void setMessageArticleAdded(final String value)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#setMessageArticleAdded(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageArticleAdded = value;
    }

    public final void setMessageArticleAddFailed(final String value)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#setMessageArticleAddFailed(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageArticleAddFailed = value;
    }

    @RequestMapping(value = "/default", method = RequestMethod.GET)
    public final ModelAndView showDefaultPage(final Model model)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#showDefaultPage(final Model model)";

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

        mView.addObject(Constants.COMMAND, new Article());
		mView.setViewName(this.defaultPage);

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }

    @RequestMapping(value = "/list-articles", method = RequestMethod.GET)
    public final ModelAndView listAvailableArticles(final Model model)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#listInstalledApplications(final Model model)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
        }

        ModelAndView mView = new ModelAndView();

        final ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        final HttpServletRequest hRequest = requestAttributes.getRequest();
        final HttpSession hSession = hRequest.getSession();
        final UserAccount userAccount = (UserAccount) hSession.getAttribute(Constants.USER_ACCOUNT);
        final IKnowledgeManagementProcessor processor = (IKnowledgeManagementProcessor) new KnowledgeManagementProcessorImpl();

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

            KnowledgeManagementRequest request = new KnowledgeManagementRequest();
            request.setApplicationId(this.appConfig.getApplicationId());
            request.setApplicationName(this.appConfig.getApplicationName());
            request.setRequestInfo(reqInfo);
            request.setServiceId(this.serviceId);
            request.setUserAccount(userAccount);

            if (DEBUG)
            {
                DEBUGGER.debug("KnowledgeManagementRequest: {}", request);
            }

            KnowledgeManagementResponse response = processor.listArticles(request);

            if (DEBUG)
            {
                DEBUGGER.debug("KnowledgeManagementResponse: {}", response);
            }

            switch (response.getRequestStatus())
            {
				case FAILURE:
	                mView.addObject(Constants.ERROR_RESPONSE, this.appConfig.getMessageNoSearchResults());
	                mView.setViewName(this.defaultPage);
	
					break;
				case SUCCESS:
					List<Article> articleList = response.getArticleList();

					if (DEBUG)
					{
						DEBUGGER.debug("List<Article>: {}", articleList);
					}

	                if ((articleList != null) && (articleList.size() != 0))
	                {
	                    mView.addObject(Constants.SEARCH_RESULTS, articleList);
	                    mView.setViewName(this.viewArticlesPage);
	                }
	                else
	                {
	                    mView.addObject(Constants.ERROR_MESSAGE, this.messageNoArticlesFound);
	                    mView.setViewName(this.defaultPage);
	                }
	
					break;
				case UNAUTHORIZED:
					mView.setViewName(this.appConfig.getUnauthorizedPage());
	
					break;
				default:
					mView.addObject(Constants.ERROR_RESPONSE, this.appConfig.getMessageRequestProcessingFailure());
	                mView.setViewName(this.defaultPage);
	
					break;
            }
        }
        catch (final KnowledgeManagementException kmx)
        {
            ERROR_RECORDER.error(kmx.getMessage(), kmx);

            mView.setViewName(this.appConfig.getErrorResponsePage());
        }

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }

    @RequestMapping(value = "/list-articles/pending-approval", method = RequestMethod.GET)
    public final ModelAndView listPendingArticles(final Model model)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#listPendingArticles(final Model model)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
        }

        ModelAndView mView = new ModelAndView();

        final ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        final HttpServletRequest hRequest = requestAttributes.getRequest();
        final HttpSession hSession = hRequest.getSession();
        final UserAccount userAccount = (UserAccount) hSession.getAttribute(Constants.USER_ACCOUNT);
        final IKnowledgeManagementProcessor processor = (IKnowledgeManagementProcessor) new KnowledgeManagementProcessorImpl();

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

            Article article = new Article();
            article.setStatus(ArticleStatus.PENDING);

            if (DEBUG)
            {
            	DEBUGGER.debug("Article: {}", article);
            }

            KnowledgeManagementRequest request = new KnowledgeManagementRequest();
            request.setApplicationId(this.appConfig.getApplicationId());
            request.setApplicationName(this.appConfig.getApplicationName());
            request.setRequestInfo(reqInfo);
            request.setServiceId(this.serviceId);
            request.setUserAccount(userAccount);
            request.setArticle(article);

            if (DEBUG)
            {
                DEBUGGER.debug("KnowledgeManagementRequest: {}", request);
            }

            KnowledgeManagementResponse response = processor.listArticlesByAttribute(request);

            if (DEBUG)
            {
                DEBUGGER.debug("KnowledgeManagementResponse: {}", response);
            }

            switch (response.getRequestStatus())
            {
				case FAILURE:
					mView.addObject(Constants.COMMAND, new Article());
	                mView.addObject(Constants.ERROR_RESPONSE, this.appConfig.getMessageNoSearchResults());
	                mView.setViewName(this.defaultPage);
	
					break;
				case SUCCESS:
					List<Article> articleList = response.getArticleList();

					if (DEBUG)
					{
						DEBUGGER.debug("List<Article>: {}", articleList);
					}

	                if ((articleList != null) && (articleList.size() != 0))
	                {
	                    mView.addObject(Constants.SEARCH_RESULTS, articleList);
	                    mView.setViewName(this.viewArticlesPage);
	                }
	                else
	                {
	                	mView.addObject(Constants.COMMAND, new Article());
	                    mView.addObject(Constants.ERROR_MESSAGE, this.messageNoArticlesFound);
	                    mView.setViewName(this.defaultPage);
	                }
	
					break;
				case UNAUTHORIZED:
					mView.setViewName(this.appConfig.getUnauthorizedPage());
	
					break;
				default:
					mView.addObject(Constants.COMMAND, new Article());
					mView.addObject(Constants.ERROR_RESPONSE, this.appConfig.getMessageRequestProcessingFailure());
	                mView.setViewName(this.defaultPage);
	
					break;
            }
        }
        catch (final KnowledgeManagementException kmx)
        {
            ERROR_RECORDER.error(kmx.getMessage(), kmx);

            mView.setViewName(this.appConfig.getErrorResponsePage());
        }

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }

    @RequestMapping(value = "article/{guid}", method = RequestMethod.GET)
    public final ModelAndView showArticle(@PathVariable("guid") final String guid, final Model model)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#showArticle(@PathVariable(\"guid\") final String guid, final Model model)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", guid);
        }

        ModelAndView mView = new ModelAndView();

        final ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        final HttpServletRequest hRequest = requestAttributes.getRequest();
        final HttpSession hSession = hRequest.getSession();
        final UserAccount userAccount = (UserAccount) hSession.getAttribute(Constants.USER_ACCOUNT);
        final IKnowledgeManagementProcessor processor = (IKnowledgeManagementProcessor) new KnowledgeManagementProcessorImpl();

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

            Article reqArticle = new Article();
            reqArticle.setArticleId(guid);

            if (DEBUG)
            {
                DEBUGGER.debug("Article: {}", reqArticle);
            }

            KnowledgeManagementRequest request = new KnowledgeManagementRequest();
            request.setApplicationId(this.appConfig.getApplicationId());
            request.setApplicationName(this.appConfig.getApplicationName());
            request.setServiceId(this.serviceId);
            request.setRequestInfo(reqInfo);
            request.setUserAccount(userAccount);
            request.setArticle(reqArticle);

            if (DEBUG)
            {
                DEBUGGER.debug("KnowledgeManagementRequest: {}", request);
            }

            KnowledgeManagementResponse response = processor.getArticleData(request);

            if (DEBUG)
            {
                DEBUGGER.debug("KnowledgeManagementResponse: {}", response);
            }

            switch (response.getRequestStatus())
            {
				case FAILURE:
	                mView.addObject(Constants.ERROR_RESPONSE, this.appConfig.getMessageNoSearchResults());
	                mView.setViewName(this.defaultPage);
	
					break;
				case SUCCESS:
	                Article resArticle = response.getArticle();

	                if (DEBUG)
	                {
	                    DEBUGGER.debug("Article: {}", resArticle);
	                }

	                mView.addObject("articleData", resArticle);
	                mView.setViewName(this.viewArticlePage);
	
					break;
				case UNAUTHORIZED:
					mView.setViewName(this.appConfig.getUnauthorizedPage());
	
					break;
				default:
					mView.addObject(Constants.ERROR_RESPONSE, this.appConfig.getMessageRequestProcessingFailure());
	                mView.setViewName(this.defaultPage);
	
					break;
            }
        }
        catch (final KnowledgeManagementException kmx)
        {
            ERROR_RECORDER.error(kmx.getMessage(), kmx);

            mView.setViewName(this.appConfig.getErrorResponsePage());
        }

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }

    @RequestMapping(value = "add-article", method = RequestMethod.GET)
    public final ModelAndView showAddArticle(final Model model)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#showAddArticle(final Model model)";

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

        mView.addObject(Constants.COMMAND, new Article());
        mView.setViewName(this.addArticlePage);

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }

    @RequestMapping(value = "search", method = RequestMethod.POST)
    public final ModelAndView doArticleSearch(@ModelAttribute("article") final Article article, final BindingResult bindResult, final Model model)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#submitApplicationSearch(@ModelAttribute(\"article\") final Article article, final BindingResult bindResult, final Model model)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Article: {}", article);
        }

        ModelAndView mView = new ModelAndView();

        final ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        final HttpServletRequest hRequest = requestAttributes.getRequest();
        final HttpSession hSession = hRequest.getSession();
        final UserAccount userAccount = (UserAccount) hSession.getAttribute(Constants.USER_ACCOUNT);
        final IKnowledgeManagementProcessor processor = (IKnowledgeManagementProcessor) new KnowledgeManagementProcessorImpl();

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

            KnowledgeManagementRequest request = new KnowledgeManagementRequest();
            request.setApplicationId(this.appConfig.getApplicationId());
            request.setApplicationName(this.appConfig.getApplicationName());
            request.setRequestInfo(reqInfo);
            request.setServiceId(this.serviceId);
            request.setUserAccount(userAccount);
            request.setArticle(article);

            if (DEBUG)
            {
                DEBUGGER.debug("KnowledgeManagementRequest: {}", request);
            }

            KnowledgeManagementResponse response = processor.listArticlesByAttribute(request);

            if (DEBUG)
            {
                DEBUGGER.debug("KnowledgeManagementResponse: {}", response);
            }

            switch (response.getRequestStatus())
            {
				case FAILURE:
                    mView.addObject(Constants.ERROR_RESPONSE, this.appConfig.getMessageNoSearchResults());
                    mView.addObject(Constants.COMMAND, new Article());
                    mView.setViewName(this.defaultPage);

					break;
				case SUCCESS:
                    mView.addObject("pages", (int) Math.ceil(response.getEntryCount() * 1.0 / this.recordsPerPage));
                    mView.addObject("page", 1);
                    mView.addObject(Constants.COMMAND, new Article());
                    mView.addObject(Constants.SEARCH_RESULTS, response.getArticleList());
                    mView.setViewName(this.defaultPage);

					break;
				case UNAUTHORIZED:
					mView.setViewName(this.appConfig.getUnauthorizedPage());

					break;
				default:
					mView.addObject(Constants.ERROR_RESPONSE, this.appConfig.getMessageRequestProcessingFailure());
                    mView.addObject(Constants.COMMAND, new Article());
                    mView.setViewName(this.defaultPage);

					break;
            }
        }
        catch (final KnowledgeManagementException kmx)
        {
            ERROR_RECORDER.error(kmx.getMessage(), kmx);

            mView.setViewName(this.appConfig.getErrorResponsePage());
        }

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }

    @RequestMapping(value = "add-article", method = RequestMethod.POST)
    public final ModelAndView doAddArticle(@ModelAttribute("article") final Article article, final BindingResult bindResult, final Model model)
    {
        final String methodName = KnowledgeManagementController.CNAME + "#doAddApplication(@ModelAttribute(\"request\") final Application request, final BindingResult bindResult, final Model model)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", article);
        }

        ModelAndView mView = new ModelAndView();

        final ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        final HttpServletRequest hRequest = requestAttributes.getRequest();
        final HttpSession hSession = hRequest.getSession();
        final UserAccount userAccount = (UserAccount) hSession.getAttribute(Constants.USER_ACCOUNT);
        final IKnowledgeManagementProcessor processor = (IKnowledgeManagementProcessor) new KnowledgeManagementProcessorImpl();

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

        this.validator.validate(article, bindResult);

        if (bindResult.hasErrors())
        {
            // validation failed
            ERROR_RECORDER.error("Errors: {}", bindResult.getAllErrors());

            mView.addObject(Constants.ERROR_MESSAGE, this.appConfig.getMessageValidationFailed());
            mView.addObject(Constants.BIND_RESULT, bindResult.getAllErrors());
            mView.addObject(Constants.COMMAND, new Article());
            mView.setViewName(this.addArticlePage);
        }
        else
        {
            try
            {
                RequestHostInfo reqInfo = new RequestHostInfo();
                reqInfo.setHostName(hRequest.getRemoteHost());
                reqInfo.setHostAddress(hRequest.getRemoteAddr());

                if (DEBUG)
                {
                    DEBUGGER.debug("RequestHostInfo: {}", reqInfo);
                }

                KnowledgeManagementRequest request = new KnowledgeManagementRequest();
                request.setApplicationId(this.appConfig.getApplicationId());
                request.setApplicationName(this.appConfig.getApplicationName());
                request.setRequestInfo(reqInfo);
                request.setServiceId(this.serviceId);
                request.setUserAccount(userAccount);
                request.setArticle(article);

                if (DEBUG)
                {
                	DEBUGGER.debug("KnowledgeManagementRequest: {}", request);
                }

                KnowledgeManagementResponse response = processor.addArticleData(request);

                if (DEBUG)
                {
                	DEBUGGER.debug("KnowledgeManagementResponse: {}", response);
                }

                switch (response.getRequestStatus())
                {
					case FAILURE:
		                mView.addObject(Constants.ERROR_RESPONSE, this.messageArticleAddFailed);
		                mView.setViewName(this.addArticlePage);

						break;
					case SUCCESS:
						mView.addObject(Constants.COMMAND, new Article());
	                    mView.addObject(Constants.RESPONSE_MESSAGE, this.messageArticleAdded);
	                    mView.setViewName(this.addArticlePage);

						break;
					case UNAUTHORIZED:
						mView.setViewName(this.appConfig.getUnauthorizedPage());

						break;
					default:
						mView.addObject(Constants.ERROR_RESPONSE, this.appConfig.getMessageRequestProcessingFailure());
		                mView.setViewName(this.defaultPage);

						break;
                }
            }
            catch (final KnowledgeManagementException kmx)
            {
                ERROR_RECORDER.error(kmx.getMessage(), kmx);

                mView.setViewName(this.appConfig.getErrorResponsePage());
            }
        }

        if (DEBUG)
        {
            DEBUGGER.debug("ModelAndView: {}", mView);
        }

        return mView;
    }
}
