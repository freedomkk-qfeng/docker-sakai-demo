<?xml version="1.0" encoding="UTF-8" ?>
<!--
/**********************************************************************************
 * $URL: https://source.sakaiproject.org/svn/rwiki/tags/sakai-10.2/rwiki-tool/tool/src/webapp/WEB-INF/command-pages/fragmentpreview.jsp $
 * $Id: fragmentpreview.jsp 34228 2007-08-21 23:03:53Z ian@caret.cam.ac.uk $
 ***********************************************************************************
 *
 * Copyright (c) 2003, 2004, 2005, 2006 The Sakai Foundation.
 *
 * Licensed under the Educational Community License, Version 1.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.opensource.org/licenses/ecl1.php
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 **********************************************************************************/
-->
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0" 
  xmlns:c="http://java.sun.com/jsp/jstl/core"
  ><jsp:directive.page language="java"
		contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	/>
	<c:set var="currentRWikiObject" value="${requestScope.rsacMap.currentRWikiObject}"/>
	<c:set var="editBean" value="${requestScope.rsacMap.editBean}"/>
	<c:set var="renderBean" value="${requestScope.rsacMap.renderBean}"/>
	<c:set var="rlb" value="${requestScope.rsacMap.resourceLoaderBean}"/>		
	<c:set var="currentContent" value="${currentRWikiObject.content}"/>
	<c:set target="${currentRWikiObject}" property="content" value="${editBean.previousContent}"/>	    
	<c:out value="${renderBean.previewPage}" escapeXml="false"/><br/>
<!--
	Previous: <c:out value="${editBean.previousContent}" escapeXml="false"/><br/>
-->
	<c:set target="${currentRWikiObject}" property="content" value="${currentContent}"/>	    
</jsp:root>
