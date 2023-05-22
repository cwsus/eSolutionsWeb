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
 * File: ServerValidator.java
 *
 * History
 *
 * Author               Date                            Comments
 * ----------------------------------------------------------------------------
 * cws-khuntly          11/23/2008 22:39:20             Created.
 */
import java.util.regex.Pattern;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.apache.commons.lang3.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.validation.ValidationUtils;

import com.cws.esolutions.web.Constants;
import com.cws.esolutions.core.processors.dto.Server;
import com.cws.esolutions.core.processors.enums.ServerType;
/**
 * @author cws-khuntly
 * @version 1.0
 * @see org.springframework.validation.Validator
 */
public class ServerValidator implements Validator
{
    private String messageOsNameRequired = null;
    private String messageCpuTypeRequired = null;
    private String messageCpuCountRequired = null;
    private String messageDatacenterRequired = null;
    private String messageDomainNameRequired = null;
    private String messageServerTypeRequired = null;
    private String messageManagerUrlRequired = null;
    private String messageNasHostnameRequired = null;
    private String messageOperAddressRequired = null;
    private String messageServerModelRequired = null;
    private String messageOperHostnameRequired = null;
    private String messageSerialNumberRequired = null;
    private String messageServerStatusRequired = null;
    private String messageServerRegionRequired = null;
    private String messageServerAddressInvalid = null;
    private String messageBackupHostnameRequired = null;
    private String messageNasHostAddressRequired = null;
    private String messageInstalledMemoryRequired = null;
    private String messageNetworkPartitionRequired = null;
    private String messageBackupHostAddressRequired = null;
    private String messageManagementHostnameRequired = null;
    private String messageManagementHostAddressRequired = null;

    private static final String CNAME = ServerValidator.class.getName();

    private static final Logger DEBUGGER = LogManager.getLogger(Constants.DEBUGGER);
    private static final boolean DEBUG = DEBUGGER.isDebugEnabled();

    public final void setMessageOsNameRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageOsNameRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageOsNameRequired = value;
    }

    public final void setMessageServerTypeRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageServerTypeRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageServerTypeRequired = value;
    }

    public final void setMessageServerStatusRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageServerStatusRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageServerStatusRequired = value;
    }

    public final void setMessageServerRegionRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageServerRegionRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageServerRegionRequired = value;
    }

    public final void setMessageManagementHostnameRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageManagementHostnameRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageManagementHostnameRequired = value;
    }

    public final void setMessageManagementHostAddressRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageManagementHostAddressRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageManagementHostAddressRequired = value;
    }

    public final void setMessageBackupHostnameRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageBackupHostnameRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageBackupHostnameRequired = value;
    }

    public final void setMessageBackupHostAddressRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageBackupHostAddressRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageBackupHostAddressRequired = value;
    }

    public final void setMessageNasHostnameRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageNasHostnameRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageNasHostnameRequired = value;
    }

    public final void setMessageNasHostAddressRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageNasHostAddressRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageNasHostAddressRequired = value;
    }

    public final void setMessageServerAddressInvalid(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageServerAddressInvalid(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageServerAddressInvalid = value;
    }

    public final void setMessageManagerUrlRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageManagerUrlRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageManagerUrlRequired = value;
    }

    public final void setMessageCpuCountRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageCpuCountRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageCpuCountRequired = value;
    }

    public final void setMessageCpuTypeRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageCpuTypeRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageCpuTypeRequired = value;
    }

    public final void setMessageInstalledMemoryRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageInstalledMemoryRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageInstalledMemoryRequired = value;
    }

    public final void setMessageDomainNameRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageDomainNameRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageDomainNameRequired = value;
    }

    public final void setMessageDatacenterRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageDatacenterRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageDatacenterRequired = value;
    }

    public final void setMessageServerModelRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageServerModelRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageServerModelRequired = value;
    }

    public final void setMessageSerialNumberRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageSerialNumberRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageSerialNumberRequired = value;
    }

    public final void setMessageOperHostnameRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageOperHostnameRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageOperHostnameRequired = value;
    }

    public final void setMessageOperAddressRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageOperAddressRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageOperAddressRequired = value;
    }

    public final void setMessageNetworkPartitionRequired(final String value)
    {
        final String methodName = ServerValidator.CNAME + "#setMessageNetworkPartitionRequired(final String value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        this.messageNetworkPartitionRequired = value;
    }

    public final boolean supports(final Class<?> value)
    {
        final String methodName = ServerValidator.CNAME + "#supports(final Class<?> value)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Value: {}", value);
        }

        final boolean isSupported = Server.class.isAssignableFrom(value);

        if (DEBUG)
        {
            DEBUGGER.debug("isSupported: {}", isSupported);
        }

        return isSupported;
    }

    public final void validate(final Object target, final Errors errors)
    {
        final String methodName = ServerValidator.CNAME + "#validate(final Object target, final Errors errors)";

        if (DEBUG)
        {
            DEBUGGER.debug(methodName);
            DEBUGGER.debug("Object: {}", target);
            DEBUGGER.debug("Errors: {}", errors);
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cpuCount", this.messageCpuCountRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "osName", this.messageOsNameRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cpuType", this.messageCpuTypeRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "installedMemory", this.messageInstalledMemoryRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "domainName", this.messageDomainNameRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "serverModel", this.messageServerModelRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "serialNumber", this.messageSerialNumberRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "operHostName", this.messageOperHostnameRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "operIpAddress", this.messageOperAddressRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "serverType", this.messageServerTypeRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "serverStatus", this.messageServerStatusRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "serverRegion", this.messageServerRegionRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "networkPartition", this.messageNetworkPartitionRequired);

        final Server request = (Server) target;
        final Pattern pattern = Pattern.compile("^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])$");

        if (DEBUG)
        {
            DEBUGGER.debug("Server: {}", request);
        }

        if ((StringUtils.isNotEmpty(request.getMgmtHostName())) && (StringUtils.isBlank(request.getMgmtIpAddress()))
                || (StringUtils.isNotEmpty(request.getMgmtIpAddress())) && (StringUtils.isBlank(request.getMgmtHostName())))
        {
            errors.reject("mgmtHostName", this.messageManagementHostnameRequired);
            errors.reject("mgmtIpAddress", this.messageManagementHostAddressRequired);
        }
        else if ((StringUtils.isNotEmpty(request.getBkHostName())) && (StringUtils.isBlank(request.getBkIpAddress()))
                || (StringUtils.isNotEmpty(request.getBkIpAddress())) && (StringUtils.isBlank(request.getBkHostName())))
        {
            errors.reject("bkHostName", this.messageBackupHostnameRequired);
            errors.reject("bkIpAddress", this.messageBackupHostAddressRequired);
        }
        else if ((StringUtils.isNotEmpty(request.getNasHostName())) && (StringUtils.isBlank(request.getNasIpAddress()))
                || (StringUtils.isNotEmpty(request.getNasIpAddress())) && (StringUtils.isBlank(request.getNasHostName())))
        {
            errors.reject("nasHostName", this.messageNasHostnameRequired);
            errors.reject("nasIpAddress", this.messageNasHostAddressRequired);
        }
        else if ((StringUtils.isNotEmpty(request.getNatAddress())) && (!(pattern.matcher(request.getNatAddress()).matches())))
        {
            // properly formatted nat addr
            errors.reject("natAddress", this.messageServerAddressInvalid);
        }
        else
        {
            if (!(pattern.matcher(request.getOperIpAddress()).matches()))
            {
                errors.reject("operIpAddress", this.messageServerAddressInvalid);
            }
            else if ((StringUtils.isNotEmpty(request.getMgmtIpAddress())) && (!(pattern.matcher(request.getMgmtIpAddress()).matches())))
            {
                errors.reject("mgmtIpAddress", this.messageServerAddressInvalid);
            }
            else if ((StringUtils.isNotEmpty(request.getBkIpAddress())) && (!(pattern.matcher(request.getBkIpAddress()).matches())))
            {
                errors.reject("bkIpAddress", this.messageServerAddressInvalid);
            }
            else if ((StringUtils.isNotEmpty(request.getNasIpAddress())) && (!(pattern.matcher(request.getNasIpAddress()).matches())))
            {
                errors.reject("nasIpAddress", this.messageServerAddressInvalid);
            }
            else if (request.getServerType() == ServerType.VIRTUALHOST)
            {
                errors.reject("vboxManagerUrl", this.messageManagerUrlRequired);
            }
        }
    }
}