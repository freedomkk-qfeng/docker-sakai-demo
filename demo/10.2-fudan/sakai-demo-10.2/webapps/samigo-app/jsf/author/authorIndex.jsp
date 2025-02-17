<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://www.sakaiproject.org/samigo" prefix="samigo" %>
<!DOCTYPE html
     PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
   
<!--
* $Id: authorIndex.jsp 311430 2014-07-31 02:23:57Z enietzel@anisakai.com $
<%--
**********************************************************************************
*
* Copyright (c) 2004, 2005, 2006 The Sakai Foundation.
*
* Licensed under the Educational Community License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*      http://www.osedu.org/licenses/ECL-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License. 
*
**********************************************************************************/
--%>
-->
  <f:view>
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
      <head><%= request.getAttribute("html.head") %>
      <title><h:outputText value="#{authorFrontDoorMessages.auth_front_door}" /></title>
      </head>
      <body onload="<%= request.getAttribute("html.body.onload") %>">
      <div class="portletBody">

<script type="text/javascript" src="/library/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/samigo-app/js/info.js"></script>
<script type="text/javascript" src="/library/js/jquery/ui/1.10.3/jquery-ui.1.10.3.full.min.js"></script>
<script type="text/javascript" src="/library/js/jquery/tablesorter/2.0.3/jquery.tablesorter-2.0.3.min.js"></script>
<link type="text/css" href="/samigo-app/css/ui-lightness/jquery-ui-1.7.2.custom.css" rel="stylesheet" media="all"/>
<link type="text/css" href="/samigo-app/css/tool_sam.css" rel="stylesheet" media="all"/>
<script type="text/JavaScript">

function clickPendingSelectActionLink(field){
var insertlinkid= field.id.replace("pendingSelectAction", "pendingHiddenlink");
var newindex = 0;
for (i=0; i<document.links.length; i++) {
  if(document.links[i].id == insertlinkid)
  {
    newindex = i;
    break;
  }
}

document.links[newindex].onclick();
}

function clickPublishedSelectActionLink(field){
var id = field.id;
var insertlinkid= field.id.replace(/publishedSelectAction./, "publishedHiddenlink");
var newindex = 0;
for (i=0; i<document.links.length; i++) {
  if(document.links[i].id == insertlinkid)
  {
    newindex = i;
    break;
  }
}

document.links[newindex].onclick();
}

function clickInactivePublishedSelectActionLink(field){
var insertlinkid= field.id.replace(/inactivePublishedSelectAction./, "inactivePublishedHiddenlink");
var newindex = 0;
for (i=0; i<document.links.length; i++) {
  if(document.links[i].id == insertlinkid)
  {
    newindex = i;
    break;
  }
}

document.links[newindex].onclick();
}

// PRESENT TWO LIVE TABS USING JQUERY UI TABS
$(document).ready(function() {
	var selectedTab = 0;
	<h:outputText rendered="#{author.justPublishedAnAssessment}" value="selectedTab = 1;" />

	$("#tabs").tabs({ selected: selectedTab });

	// SET THE HEIGHT ON TABS CONTAINER IF PUBLISHED IS LARGER THAN WORKING COPIES
	if ($('#tabs-2').height() > $('#tabs-1').height()) {
		$("#tabs").height($('#tabs-2').height() + 170);
	}

	// ALLOW ACTIVE, ALL, INACTIVE LINKS FOR PUBLISHED ITEMS
	$("#assessment-link-status-all").click(
		function() {
			$("#authorIndexForm\\:published-assessments tr").show();
			$("#assessment-status-limiter a").removeClass('active');
			$(this).addClass('active');
			$("#authorIndexForm\\:assessment-retracted").show();
		}
	);
	$("#assessment-link-status-active").click(
		function() {
			$("#authorIndexForm\\:published-assessments tbody tr").show();
			$("#authorIndexForm\\:published-assessments tbody tr span.status_false").parent().parent().hide();
			$("#assessment-status-limiter a").removeClass('active');
			$(this).addClass('active');
			$("#authorIndexForm\\:assessment-retracted").hide();
		}
	);
	$("#assessment-link-status-inactive").click(
		function() {
			$("#authorIndexForm\\:published-assessments tbody tr").show();
			$("#authorIndexForm\\:published-assessments tbody tr span.status_true").parent().parent().hide();
			$("#assessment-status-limiter a").removeClass('active');
			$(this).addClass('active');
			$("#authorIndexForm\\:assessment-retracted").show();
		}
	);
	
	$("#authorIndexForm\\:coreAssessments").tablesorter( {
		sortList: [[1,0]],
		headers: { 
            0: { 
                sorter: false 
            }, 
            2: { 
                sorter: false 
            }        
		}
	});
	
	$("#authorIndexForm\\:published-assessments").tablesorter( {
		sortList: [[2,0], [1,0]],
		headers: { 
            0: { 
                sorter: false 
            }, 
            3: { 
                sorter: false 
            }, 
            4: { 
                sorter: false 
            }, 
            8: { 
                sorter: false 
            }            
		}
	}); 
});
</script>

<!-- content... -->

<h:form id="authorIndexForm">
  <!-- HEADINGS -->
   <%@ include file="/jsf/author/assessmentHeadings.jsp" %>

  <h3>
    <h:outputText value="#{authorFrontDoorMessages.assessments}"/>
  </h3>
<p>
  <h:messages styleClass="messageSamigo" rendered="#{! empty facesContext.maximumSeverity}" layout="table"/>
</p>

<div class="tier1">
  <h:outputText escape="false" rendered="#{authorization.createAssessment}" value="<h4>"/>
    <h:outputText value="#{authorFrontDoorMessages.assessment_new}" rendered="#{authorization.createAssessment}" />
  <h:outputText escape="false" rendered="#{authorization.createAssessment}" value="</h4><br/>"/>

  <div id="samigo-create-container">
 	<div id="samigo-create-new">
		<div>
		  	<h:outputText escape="false" rendered="#{authorization.createAssessment}" value="<h4>"/>
	  		<h:outputText value="#{authorFrontDoorMessages.assessment_scratch}" rendered="#{authorization.createAssessment}" />
	  		<h:outputText escape="false" rendered="#{authorization.createAssessment}" value="</h4>"/>
    	</div>

    	<div>
		  <f:verbatim><span class="new_assessment"></f:verbatim>
	      <h:outputText value="#{authorFrontDoorMessages.assessment_create}"/>
	      <f:verbatim></span></f:verbatim>
		  <h:inputText id="title" maxlength="255" value="#{author.assessTitle}" size="32" />
    	</div>

    	<div>
			<h:selectOneRadio layout="pageDirection" value="#{author.assessCreationMode}" rendered="#{samLiteBean.visible}">
		      <f:selectItem itemValue="1" itemLabel="#{authorFrontDoorMessages.assessmentBuild}" />
		      <f:selectItem itemValue="2" itemLabel="#{authorFrontDoorMessages.markupText}" />
		    </h:selectOneRadio>
    	</div>

  		<div>
		  	<h:outputText value="#{authorFrontDoorMessages.assessment_choose} " rendered="#{author.showTemplateList}" />
			<h:selectOneMenu id="assessmentTemplate" value="#{author.assessmentTemplateId}" rendered="#{author.showTemplateList}">
		      <f:selectItem itemValue="" itemLabel="#{generalMessages.select_menu}"/>
		      <f:selectItems value="#{author.assessmentTemplateList}" />
		    </h:selectOneMenu>
      	</div>
    
		<div>
	      <h:commandButton id="createnew" type="submit" value="#{authorFrontDoorMessages.button_create}" action="#{author.getOutcome}">
	        <f:actionListener type="org.sakaiproject.tool.assessment.ui.listener.author.AuthorAssessmentListener" />
	      </h:commandButton>
    	</div>
  </div>

  <div id="samigo-create-or">
    <h:outputText value="#{authorFrontDoorMessages.label_or}"/>
  </div>

 <div id="samigo-create-import">
	  <div>
		<span class="new_assessment">
      		<h:outputText value="#{authorFrontDoorMessages.assessment_import}" rendered="#{authorization.createAssessment}"/>
		</span>
    <h:commandButton id="import" value="#{authorFrontDoorMessages.button_import}" immediate="true" type="submit" 
      rendered="#{authorization.createAssessment}" action="importAssessment">
    </h:commandButton>
	  </div>
  </div>
</div>

<div id="tabs">
	<ul>
		<h:outputText escape="false" value="<li><a href=\"#tabs-1\">" rendered="#{authorization.adminCoreAssessment}"/>
		<h:outputText escape="false" value="#{authorFrontDoorMessages.assessment_pending}:" rendered="#{authorization.adminCoreAssessment}"/>
		<h:outputText escape="false" value="<span class=\"samigo-tab-sub\">" rendered="#{authorization.adminCoreAssessment}"/>
		<h:outputText escape="false" value="#{authorFrontDoorMessages.assessment_pending_sub}" rendered="#{authorization.adminCoreAssessment}"/>
		<h:outputText escape="false" value="</span></a></li>" rendered="#{authorization.adminCoreAssessment}"/>
		
		<h:outputText escape="false" value="<li><a href=\"#tabs-2\">" rendered="#{authorization.adminPublishedAssessment}"/>
		<h:outputText escape="false" value="#{authorFrontDoorMessages.assessment_pub}:" rendered="#{authorization.adminPublishedAssessment}"/>
		<h:outputText escape="false" value="<span class=\"samigo-tab-sub\">" rendered="#{authorization.adminPublishedAssessment}"/>
		<h:outputText escape="false" value="#{authorFrontDoorMessages.assessment_pub_sub}" rendered="#{authorization.adminPublishedAssessment}"/>
		<h:outputText escape="false" value="</span></a></li>" rendered="#{authorization.adminPublishedAssessment}"/>
	</ul>
 <!-- CORE ASSESSMENTS-->
 <h:outputText escape="false" rendered="#{authorization.createAssessment}" value="<div id=\"tabs-1\">"/>
  <t:dataTable cellpadding="0" cellspacing="0" rowClasses="list-row-even,list-row-odd" styleClass="tablesorter" id="coreAssessments" value="#{author.assessments}" var="coreAssessment" rendered="#{authorization.adminCoreAssessment}" summary="#{authorFrontDoorMessages.sum_coreAssessment}">
    <t:column headerstyleClass="selectAction" styleClass="selectAction">
      <f:facet name="header" >
	   <h:outputText value="#{authorFrontDoorMessages.select_action}"/>
	  </f:facet>

	  <h:selectOneMenu id="pendingSelectAction1" value="select" onchange="clickPendingSelectActionLink(this);" rendered="#{coreAssessment.questionSize > 0 }">
		<f:selectItems value="#{author.pendingSelectActionList1}" />
		<f:valueChangeListener	type="org.sakaiproject.tool.assessment.ui.listener.author.ActionSelectListener" />
	  </h:selectOneMenu>
	  
	  <h:selectOneMenu id="pendingSelectAction2" value="select" onchange="clickPendingSelectActionLink(this);" rendered="#{coreAssessment.questionSize == 0 }">
		<f:selectItems value="#{author.pendingSelectActionList2}" />
		<f:valueChangeListener	type="org.sakaiproject.tool.assessment.ui.listener.author.ActionSelectListener" />
	  </h:selectOneMenu>
 
	  <h:commandLink id="pendingHiddenlink1" action="#{author.getOutcome}" value="" >
	    <f:param name="editType" value="pendingAssessment" />
        <f:param name="assessmentId" value="#{coreAssessment.assessmentBaseId}"/>
	  </h:commandLink>
	
	<h:commandLink id="pendingHiddenlink2" action="#{author.getOutcome}" value="" >
	    <f:param name="editType" value="pendingAssessment" />
        <f:param name="assessmentId" value="#{coreAssessment.assessmentBaseId}"/>
	  </h:commandLink>
	</t:column>

    <t:column headerstyleClass="titlePending" styleClass="titlePending">
      <f:facet name="header">
  	  	<h:outputText value="#{authorFrontDoorMessages.assessment_title} " />
      </f:facet>

      <h:outputText id="assessmentTitle2" value="#{coreAssessment.title}" />
    </t:column>
    
    <t:column headerstyleClass="lastModified" styleClass="lastModified">
      <f:facet name="header">
        <h:outputText value="#{authorFrontDoorMessages.header_last_modified}"/>
	  </f:facet>
  	  <h:outputText value="#{coreAssessment.lastModifiedBy}" />
      <h:outputText escape="false" value="<br />"/>
      <h:outputText value="#{coreAssessment.lastModifiedDateForDisplay}"/>      
    </t:column>
  </t:dataTable>
 <h:outputText escape="false" rendered="#{authorization.createAssessment}" value="</div>"/>

	<!-- PUBLISHED ASSESSMENTS-->
<div id="tabs-2">
  <div id="assessment-status-limiter">
    <span><h:outputText value="#{authorFrontDoorMessages.assessment_view}" />:</span>
    <span id="assessment-status-all">
      <a class="active" id="assessment-link-status-all"><h:outputText value="#{authorFrontDoorMessages.assessment_view_all}" /></a>
    </span>
    <span class="separator">|</span>
    <span id="assessment-status-active">
      <a id="assessment-link-status-active"><h:outputText value="#{authorFrontDoorMessages.assessment_status_active}" /></a>:
    </span>
    <span><h:outputText value="#{authorFrontDoorMessages.assessment_status_active_sub}" /></span>
    <span class="separator">|</span>
    <span id="assessment-status-inactive">
      <a id="assessment-link-status-inactive"><h:outputText value="#{authorFrontDoorMessages.assessment_status_inactive}" /></a>:
    </span>
    <span><h:outputText value="#{authorFrontDoorMessages.assessment_status_inactive_sub}" /></span>
  </div>

  <t:dataTable id="published-assessments" rowClasses="list-row-even,list-row-odd" cellpadding="0" cellspacing="0" styleClass="tablesorter" rendered="#{authorization.adminPublishedAssessment}"
    value="#{author.publishedAssessments}" var="publishedAssessment" summary="#{authorFrontDoorMessages.sum_publishedAssessment}">
    <t:column headerstyleClass="selectAction" styleClass="selectAction">
	  <f:facet name="header" >
	   <h:outputText value="#{authorFrontDoorMessages.select_action}"/>
	  </f:facet>
	  <%/* Because selectItem has no rendered attribute, we have to put this in selectOneMenu. So there are four set
	  of selectOneMenu because there are four cases. 
	  Note: I have tried itemDisabled but it doesn't work in IE. Javascript workaround is needed. I decide to replicate the code as 
	  this is what in the original spec */%>
	  <h:selectOneMenu id="publishedSelectAction1" value="select" onchange="clickPublishedSelectActionLink(this);" rendered="#{(author.isGradeable && publishedAssessment.submittedCount > 0) && (author.isEditable && (!author.editPubAssessmentRestricted || !publishedAssessment.hasAssessmentGradingData))}">
		<f:selectItem itemLabel="#{authorMessages.select_action}" itemValue="select"/>
		<f:selectItem itemLabel="#{authorMessages.action_scores}" itemValue="scores" />
		<f:selectItem itemLabel="#{commonMessages.edit_action}" itemValue="edit_published" />
		<f:selectItems value="#{author.publishedSelectActionList}" />
		<f:valueChangeListener	type="org.sakaiproject.tool.assessment.ui.listener.author.ActionSelectListener" />
	  </h:selectOneMenu>
	  <h:selectOneMenu id="publishedSelectAction2" value="select" onchange="clickPublishedSelectActionLink(this);" rendered="#{(author.isGradeable && publishedAssessment.submittedCount > 0) && !(author.isEditable && (!author.editPubAssessmentRestricted || !publishedAssessment.hasAssessmentGradingData))}">
		<f:selectItem itemLabel="#{authorMessages.select_action}" itemValue="select"/>
		<f:selectItem itemLabel="#{authorMessages.action_scores}" itemValue="scores"/>
		<f:selectItems value="#{author.publishedSelectActionList}" />
		<f:valueChangeListener	type="org.sakaiproject.tool.assessment.ui.listener.author.ActionSelectListener" />
	  </h:selectOneMenu>
	  <h:selectOneMenu id="publishedSelectAction3" value="select" onchange="clickPublishedSelectActionLink(this);" rendered="#{!(author.isGradeable && publishedAssessment.submittedCount > 0) && (author.isEditable && (!author.editPubAssessmentRestricted || !publishedAssessment.hasAssessmentGradingData))}">
		<f:selectItem itemLabel="#{authorMessages.select_action}" itemValue="select"/>
		<f:selectItem itemLabel="#{commonMessages.edit_action}" itemValue="edit_published"/>
		<f:selectItems value="#{author.publishedSelectActionList}" />
		<f:valueChangeListener	type="org.sakaiproject.tool.assessment.ui.listener.author.ActionSelectListener" />
	  </h:selectOneMenu>
	  <h:selectOneMenu id="publishedSelectAction4" value="select" onchange="clickPublishedSelectActionLink(this);" rendered="#{!(author.isGradeable && publishedAssessment.submittedCount > 0) && (author.isEditable && !(!author.editPubAssessmentRestricted || !publishedAssessment.hasAssessmentGradingData))}">
		<f:selectItem itemLabel="#{authorMessages.select_action}" itemValue="select"/>
		<f:selectItems value="#{author.publishedSelectActionList}" />
		<f:valueChangeListener	type="org.sakaiproject.tool.assessment.ui.listener.author.ActionSelectListener" />
	  </h:selectOneMenu>

	  <h:commandLink id="publishedHiddenlink" action="#{author.getOutcome}" value="" >
	    <f:param name="editType" value="publishedAssessment" />
        <f:param name="assessmentId" value="#{publishedAssessment.publishedAssessmentId}"/>
		<f:param name="publishedId" value="#{publishedAssessment.publishedAssessmentId}" />
        <f:param name="publishedAssessmentId" value="#{publishedAssessment.publishedAssessmentId}"/>
        <f:param name="allSubmissionsT" value="3"/>
	  </h:commandLink>
	</t:column>

	<t:column headerstyleClass="titlePub" styleClass="titlePub">
      <f:facet name="header">
        <h:outputText value="#{authorFrontDoorMessages.assessment_title} " />
      </f:facet>

      <h:outputText id="publishedAssessmentTitle2" value="#{publishedAssessment.title}" />
      <h:outputText value="#{authorFrontDoorMessages.asterisk_2}" rendered="#{publishedAssessment.status == 3}" styleClass="validate"/> 
    </t:column>

	<%/* Status */%>
	<t:column headerstyleClass="status" styleClass="status">
	  <f:facet name="header">
        <h:outputText value="#{authorFrontDoorMessages.assessment_status}"/>
	  </f:facet>

	 <h:panelGroup>
	  <f:verbatim><span class="status_</f:verbatim><h:outputText value="#{publishedAssessment.activeStatus}" /><f:verbatim>"></f:verbatim>
	    <h:outputText value="#{authorFrontDoorMessages.assessment_status_active}" rendered="#{publishedAssessment.activeStatus==true}"/>
	    <h:outputText value="#{authorFrontDoorMessages.assessment_status_inactive}" rendered="#{publishedAssessment.activeStatus==false}"/>
	  <f:verbatim></span></f:verbatim>
     </h:panelGroup>
	</t:column>

	<%/* In Progress */%>
	<t:column headerstyleClass="inProgress" styleClass="inProgress">
	  <f:facet name="header">
        <h:outputText value="#{authorFrontDoorMessages.assessment_in_progress}"/>
	  </f:facet>

	 <h:panelGroup>
	  <h:outputText value="#{publishedAssessment.inProgressCount}"/>
     </h:panelGroup>
	</t:column>

	<%/* Submitted */%>
	<t:column headerstyleClass="submitted" styleClass="submitted">
	  <f:facet name="header">
        <h:outputText value="#{authorFrontDoorMessages.assessment_submitted}"/>
	  </f:facet>

	 <h:panelGroup>
 	   <h:panelGroup rendered="#{publishedAssessment.submittedCount==0 or !(authorization.gradeAnyAssessment or authorization.gradeOwnAssessment)}">
	    <h:outputText value="#{publishedAssessment.submittedCount}"/>
       </h:panelGroup>

 	   <h:panelGroup rendered="#{publishedAssessment.submittedCount>0 and (authorization.gradeAnyAssessment or authorization.gradeOwnAssessment)}">
         <h:commandLink title="#{authorFrontDoorMessages.t_score}" action="#{author.getOutcome}" immediate="true" id="authorIndexToScore1" >
		   <h:outputText value="#{publishedAssessment.submittedCount}" />
           <f:actionListener type="org.sakaiproject.tool.assessment.ui.listener.evaluation.ResetTotalScoreListener" />
           <f:actionListener type="org.sakaiproject.tool.assessment.ui.listener.evaluation.TotalScoreListener" />
           <f:param name="publishedId" value="#{publishedAssessment.publishedAssessmentId}" />
           <f:param name="allSubmissionsT" value="3"/>
           </h:commandLink>
       </h:panelGroup>
     </h:panelGroup>
    </t:column>

	<t:column headerstyleClass="releaseTo" styleClass="releaseTo">
      <f:facet name="header">
        <h:outputText value="#{authorFrontDoorMessages.assessment_release} "/>
      </f:facet>

      <h:outputText value="#{authorFrontDoorMessages.anonymous_users}" rendered="#{publishedAssessment.releaseTo eq 'Anonymous Users'}" />
      <h:outputText value="#{authorFrontDoorMessages.entire_site}" rendered="#{publishedAssessment.releaseTo ne 'Anonymous Users' && publishedAssessment.releaseTo ne 'Selected Groups'}" />
      
        <t:div>
            <t:div id="groupsHeader" onclick="#{publishedAssessment.groupCount gt 0 ? 'toggleGroups( this );' : ''}" styleClass="#{publishedAssessment.groupCount gt 0 ? 'collapse' : ''}">
                <h:outputText value="#{publishedAssessment.groupCount} " rendered ="#{publishedAssessment.releaseTo eq 'Selected Groups'}" />
                <h:outputText value="#{authorFrontDoorMessages.selected_groups} " rendered="#{publishedAssessment.releaseTo eq 'Selected Groups' and (publishedAssessment.groupCount gt 1 or publishedAssessment.groupCount eq 0)}"/>
                <h:outputText value="#{authorFrontDoorMessages.selected_group} " rendered="#{publishedAssessment.releaseTo eq 'Selected Groups' and publishedAssessment.groupCount eq 1}"/>
            </t:div>
            <t:div id="groupsPanel" style="display: none;">
                <t:dataList layout="unorderedList" value="#{publishedAssessment.releaseToGroupsList}" var="group">
                    <h:outputText value="#{group}" />
                </t:dataList>
            </t:div>
        </t:div>

		</t:column>

    <t:column headerstyleClass="releaseDate" styleClass="releaseDate">
      <f:facet name="header">
        <h:outputText value="#{authorFrontDoorMessages.assessment_date} " />
      </f:facet>
      <h:outputText value="#{publishedAssessment.startDate}" >
          <f:convertDateTime pattern="#{generalMessages.output_date_picker}"/>
        </h:outputText>
    </t:column>
   
	<t:column headerstyleClass="dueDate" styleClass="dueDate">
      <f:facet name="header">
        <h:outputText value="#{authorFrontDoorMessages.assessment_due} " />
      </f:facet>
      <h:outputText value="#{publishedAssessment.dueDate}" >
          <f:convertDateTime pattern="#{generalMessages.output_date_picker}"/>
      </h:outputText>
    </t:column>

    <t:column headerstyleClass="lastModified" styleClass="lastModified">
      <f:facet name="header">
        <h:outputText value="#{authorFrontDoorMessages.header_last_modified}"/>
	  </f:facet>

  	  <h:outputText value="#{publishedAssessment.lastModifiedBy}" />
      <h:outputText escape="false" value="<br />"/>
      <h:outputText value="#{publishedAssessment.lastModifiedDateForDisplay}"/>
    </t:column>

  </t:dataTable>

  <h:panelGrid columns="1">
    <h:outputText id="assessment-retracted" value="#{authorFrontDoorMessages.asterisk_2} #{authorFrontDoorMessages.retracted_for_edit}" rendered="#{author.isAnyAssessmentRetractForEdit == true}" styleClass="validate"/>
  </h:panelGrid>

</div>
</div>

</h:form>
<!-- end content -->
	  </div>
      </body>
    </html>
  </f:view>
