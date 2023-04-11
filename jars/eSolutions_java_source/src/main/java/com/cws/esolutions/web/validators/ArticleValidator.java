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
package com.cws.esolutions.web.validators;
/*
 * Project: eSolutions_java_source
 * Package: com.cws.esolutions.web.validators
 * File: ApplicationValidator.java
 *
 * History
 *
 * Author               Date                            Comments
 * ----------------------------------------------------------------------------
 * cws-khuntly   		11/23/2008 22:39:20             Created.
 */
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.validation.ValidationUtils;

import com.cws.esolutions.web.Constants;
import com.cws.esolutions.core.processors.dto.Article;
/**
 * @author cws-khuntly
 * @version 1.0
 * @see org.springframework.validation.Validator
 */
public class ArticleValidator implements Validator
{
	private String messageTitleRequired = null;
    private String messageCauseRequired = null;
    private String messageKeywordsRequired = null;
    private String messageResolutionRequired = null;
    
    private static final String CNAME = ArticleValidator.class.getName();

    private static final Logger DEBUGGER = LogManager.getLogger(Constants.DEBUGGER);
    private static final boolean DEBUG = DEBUGGER.isDebugEnabled();

    public final void setMessageTitleRequired(final String value)
    {
        final String methodName = ArticleValidator.CNAME + "#setMessageTitleRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageTitleRequired = value;
    }

    public final void setMessageCauseRequired(final String value)
    {
        final String methodName = ArticleValidator.CNAME + "#setMessageCauseRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageCauseRequired = value;
    }

    public final void setMessageKeywordsRequired(final String value)
    {
        final String methodName = ArticleValidator.CNAME + "#setMessageKeywordsRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageKeywordsRequired = value;
    }

    public final void setMessageResolutionRequired(final String value)
    {
        final String methodName = ArticleValidator.CNAME + "#setMessageResolutionRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageResolutionRequired = value;
    }

    public final boolean supports(final Class<?> value)
    {
        final String methodName = ArticleValidator.CNAME + "#supports(final Class<?> value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        final boolean isSupported = Article.class.isAssignableFrom(value);

        if (DEBUG)
        {
            DEBUGGER.debug("isSupported: {}", isSupported);
        }

        return isSupported;
    }

    public final void validate(final Object target, final Errors errors)
    {
        final String methodName = ArticleValidator.CNAME + "#validate(final Object target, final Errors errors)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Object: {}", target);
            DEBUGGER.debug("Errors: {}", errors);
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", this.messageTitleRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cause", this.messageCauseRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "keywords", this.messageKeywordsRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "resolution", this.messageResolutionRequired);
    }
}
