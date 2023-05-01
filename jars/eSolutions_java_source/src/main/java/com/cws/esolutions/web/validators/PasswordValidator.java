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
 * File: PasswordValidator.java
 *
 * History
 *
 * Author               Date                            Comments
 * ----------------------------------------------------------------------------
 * cws-khuntly          11/23/2008 22:39:20             Created.
 */
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.validation.ValidationUtils;

import com.cws.esolutions.web.Constants;
import com.cws.esolutions.security.processors.dto.AccountChangeData;
/**
 * @author cws-khuntly
 * @version 1.0
 * @see org.springframework.validation.Validator
 */
public class PasswordValidator implements Validator
{
	private int passwordMinLength = 8; // default
	private int passwordMaxLength = 128; // default
    private String messageNewPasswordRequired = null;
    private String messagePasswordSizeRequirement = null;
    private String messageConfirmPasswordRequired = null;
    private String messageCurrentPasswordRequired = null;

    private static final String CNAME = PasswordValidator.class.getName();

    private static final Logger DEBUGGER = LogManager.getLogger(Constants.DEBUGGER);
    private static final boolean DEBUG = DEBUGGER.isDebugEnabled();

    public final void setPasswordMinLength(final int value)
    {
        final String methodName = PasswordValidator.CNAME + "#setPasswordMinLength(final int value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.passwordMinLength = value;
    }

    public final void setPasswordMaxLength(final int value)
    {
        final String methodName = PasswordValidator.CNAME + "#setPasswordMaxLength(final int value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.passwordMaxLength = value;
    }

    public final void setMessageCurrentPasswordRequired(final String value)
    {
        final String methodName = PasswordValidator.CNAME + "#setMessageCurrentPasswordRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageCurrentPasswordRequired = value;
    }

    public final void setMessageNewPasswordRequired(final String value)
    {
        final String methodName = PasswordValidator.CNAME + "#setMessageNewPasswordRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageNewPasswordRequired = value;
    }

    public final void setMessageConfirmPasswordRequired(final String value)
    {
        final String methodName = PasswordValidator.CNAME + "#setMessageConfirmPasswordRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageConfirmPasswordRequired = value;
    }

    public final void setMessagePasswordSizeRequirement(final String value)
    {
        final String methodName = PasswordValidator.CNAME + "#setMessagePasswordSizeRequirement(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messagePasswordSizeRequirement = value;
    }

    public final boolean supports(final Class<?> value)
    {
        final String methodName = PasswordValidator.CNAME + "#supports(final Class<?> value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Class: {}", value);
        }

        final boolean isSupported = AccountChangeData.class.isAssignableFrom(value);

        if (DEBUG)
        {
            DEBUGGER.debug("isSupported: {}", isSupported);
        }

        return isSupported;
    }

    public final void validate(final Object target, final Errors errors)
    {
        final String methodName = PasswordValidator.CNAME + "#validate(final <Class> request)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
        }

        final AccountChangeData changeReq = (AccountChangeData) target;

        if (!(changeReq.isReset()))
        {
        	DEBUGGER.debug("current mismatch");
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "currentPassword", this.messageCurrentPasswordRequired);
        }

        if ((changeReq.getNewPassword().length < this.passwordMinLength) || (changeReq.getNewPassword().length > this.passwordMaxLength))
        {
        	DEBUGGER.debug("length mismatch");
        	errors.reject("newPassword", this.messagePasswordSizeRequirement);
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "newPassword", this.messageNewPasswordRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", this.messageConfirmPasswordRequired);
    }
}
