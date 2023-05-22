<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
 * Package: theme\cws\html\en\jsp
 * File: Default.jsp
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
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isThreadSafe="true" %>
<%@include file="/theme/cws/html/en/jspf/taglibs.jspf" %>
<%@include file="/theme/cws/html/en/jspf/bundle.jspf" %>
<%@page import="com.cws.esolutions.security.enums.SecurityUserRole" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<html lang="en" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.w3.org/1999/xhtml http://www.w3.org/MarkUp/SCHEMA/xhtml2.xsd">

    <%@include file="/theme/cws/html/en/jspf/head.jspf" %>

    <body id="top">
        <div class="wrapper col1">
            <div id="header">
                <div id="logo">
                </div>
                <br class="clear" />
            </div>
        </div>

        <div class="wrapper col2">
            <div id="topbar">
                <%@include file="/theme/cws/html/en/jspf/topnav.jspf" %>
                <br class="clear" />
            </div>
        </div>

        <div class="wrapper col3">
            <div class="wrapper col5">
                <div id="container">
                    <!-- content goes here -->
