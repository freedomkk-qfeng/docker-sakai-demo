<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://sakaiproject.org/jsf/sakai" prefix="sakai" %>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t" %>

<f:view locale="#{UserLocale.locale}">
	<jsp:useBean id="msgs" class="org.sakaiproject.util.ResourceLoader" scope="session">
	   <jsp:setProperty name="msgs" property="baseName" value="messages"/>
	</jsp:useBean>
	<sakai:view_container title="Signup Tool">
			<style type="text/css">
				@import url("/sakai-signup-tool/css/signupStyle.css");
			</style>
			<script TYPE="text/javascript" LANGUAGE="JavaScript" src="/sakai-signup-tool/js/signupScript.js"></script>
			<script TYPE="text/javascript" LANGUAGE="JavaScript" src="/sakai-signup-tool/js/jquery.js"></script>	
			<script>jQuery.noConflict();</script>
				
		<sakai:view_content>
			<h:outputText value="#{msgs.event_error_alerts} #{messageUIBean.errorMessage}" styleClass="alertMessage" escape="false" rendered="#{messageUIBean.error}"/>      			
				
			<h:form id="meeting">
			 	<sakai:view_title value="#{msgs.event_view_userDefined_Timeslot_page_title}"/>
				
							
				<h:panelGrid columns="2" columnClasses="titleColumn,valueColumn" onmouseover="delayedRecalcDate();">
				
					<h:outputText value="&nbsp;" escape="false"/>
					<h:outputText value="&nbsp;" escape="false"/>
					
					<h:outputText value="&nbsp;" escape="false" rendered="#{UserDefineTimeslotBean.someoneSignedUp}"/>
					<h:outputText value="#{msgs.warn_reschedule_event}" styleClass="alertMessage" style="width:85%" escape="false" rendered="#{UserDefineTimeslotBean.someoneSignedUp}"/>
					
					<h:panelGroup styleClass="titleText">		           			
					           <h:outputText value ="&nbsp;" escape="false"/>
					    </h:panelGroup>
					    <t:dataTable id="userDefinedTS" value="#{UserDefineTimeslotBean.timeSlotWrpList}" 
					    	var="tsWrapper"
					    	binding="#{UserDefineTimeslotBean.tsTable}"
					    	styleClass="userDefineTsTable" 
							rowClasses="oddRow,evenRow"
							rowStyle="#{tsWrapper.errorStyle}"
							columnClasses="delTSCol, startTSCol, endTSCol, numAttnTSCol" >
								<t:column rendered="#{!tsWrapper.deleted}">
									<f:facet name="header" >								
											<h:outputText value="&nbsp;" escape="false"/>
									</f:facet>
										<h:commandLink action="#{UserDefineTimeslotBean.deleteTSblock}" rendered="#{tsWrapper.newlyAddedTS || UserDefineTimeslotBean.placeOrderBean == UserDefineTimeslotBean.copyBeanOrderName}">
											<h:graphicImage value="/images/new.png" alt="New time slot" title="#{msgs.title_tip_delete_this_ts}"  styleClass="openCloseImageIcon" rendered="#{tsWrapper.newTimeslotBlock && UserDefineTimeslotBean.placeOrderBean != UserDefineTimeslotBean.newMeetingBeanOrderName}"/>
							        		<h:graphicImage value="/images/ts_delete.png" alt="delete slot" title="#{msgs.title_tip_delete_this_ts}" style="border:none;cursor:pointer;" styleClass="openCloseImageIcon"/>
							        	</h:commandLink>
							        	<h:commandLink action="#{UserDefineTimeslotBean.deleteTSblock}" rendered="#{!tsWrapper.newlyAddedTS && UserDefineTimeslotBean.placeOrderBean != UserDefineTimeslotBean.copyBeanOrderName }" onmousedown="confirmTsCancel(this,'#{msgs.confirm_cancel}');">
							        		<h:graphicImage value="/images/ts_delete.png" alt="delete slot" title="#{msgs.title_tip_delete_this_ts}" style="border:none;cursor:pointer;" styleClass="openCloseImageIcon" />
							        	</h:commandLink>
								</t:column>
						    	<t:column rendered="#{!tsWrapper.deleted}">
						    		<f:facet name="header" >								
										<h:outputText value="#{msgs.tab_start_time}" escape="false"/>
									</f:facet>
						    		<h:panelGrid columns="1">
							    		<h:panelGroup styleClass="titleText">
					        				<t:inputDate id="startTime" type="both"  ampm="true" value="#{tsWrapper.timeSlot.startTime}" 
					        							 style="color:black;" popupCalendar="true" timeZone="#{UserTimeZone.userTimeZoneStr}"/>       						
										</h:panelGroup>
										<h:message for="startTime" errorClass="alertMessageInline"/>
									</h:panelGrid>
						    	</t:column>
						    	<t:column rendered="#{!tsWrapper.deleted}">
						    		<f:facet name="header" >								
										<h:outputText value="#{msgs.tab_end_time}" escape="false"/>
									</f:facet>
									<h:panelGrid columns="1">
										<h:panelGroup styleClass="titleText">
					        				<t:inputDate id="endTime" type="both"  ampm="true" value="#{tsWrapper.timeSlot.endTime}"
					        							 style="color:black;" popupCalendar="true" timeZone="#{UserTimeZone.userTimeZoneStr}" />										
										</h:panelGroup>
										<h:message for="endTime" errorClass="alertMessageInline"/>
									</h:panelGrid>
						    	</t:column>
						    	<t:column rendered="#{!tsWrapper.deleted}">
									<f:facet name="header" >
											<h:outputText value="#{msgs.tab_max_participants}" escape="false"/>
									</f:facet>
										<h:panelGroup styleClass="titleText" >
							        		<h:inputText id="numOfAtt" value="#{tsWrapper.timeSlot.maxNoOfAttendees}" styleClass="editText numericOnly ranged notblank" size="2" style="margin-left:12px;margin-top:6px;" />
										</h:panelGroup>
							</t:column>
					    </t:dataTable>
					    
					    <h:outputText id="addMoreTS_1" value ="&nbsp;" escape="false" styleClass="titleText" />
					    <h:panelGrid columns="1" id="addMoreTS_2">
					    	<h:commandLink id="cmdlnk90" action="#{UserDefineTimeslotBean.addOneTSBlock}" styleClass="activeTag" actionListener="#{UserDefineTimeslotBean.validateTimeslots}">
					    		<h:graphicImage value="/images/plus.gif" alt="close" style="border:none;cursor:pointer;" styleClass="openCloseImageIcon" />
					    	 	<h:outputLabel value="#{msgs.add_more_ts}"  style="font-weight:bold" styleClass="activeTag"/>
					    	 </h:commandLink>					    	  
					    </h:panelGrid>
					    
					    <h:outputText value="&nbsp;" escape="false"/>
					    <h:outputText value="&nbsp;" escape="false"/>
					    
					    <h:outputText value="&nbsp;" escape="false"/>
						<h:panelGroup  styleClass="longtext" >
								<h:selectBooleanCheckbox value="#{UserDefineTimeslotBean.putInMultipleCalendarBlocks}"/>
								<h:outputText value="#{msgs.put_In_Multiple_Calendar_Blocks_at_ScheduleTool}" escape="false"/>
						</h:panelGroup>
						
						<h:outputText value="&nbsp;" escape="false"/>
						<h:outputText value="&nbsp;" escape="false"/>
				</h:panelGrid>
				
				<sakai:button_bar>
					<h:commandButton id="doSave"  action="#{UserDefineTimeslotBean.doSave}" actionListener="#{UserDefineTimeslotBean.validateTimeslots}"   value="#{msgs.continue_button}"/>			
					<sakai:button_bar_item id="cancel" action="#{UserDefineTimeslotBean.doCancel}" value="#{msgs.cancel_button}"/>
                </sakai:button_bar>

			 </h:form>
  		</sakai:view_content>	
	</sakai:view_container>
	<f:verbatim>
		<script>
			replaceCalendarImageIcon();
			var prefix="meeting:userDefinedTS:";
			
			function setCustomEndtimeMonthDateYear(pos){
				var yearTag = document.getElementById(prefix + pos + ":startTime.year");
				if(!yearTag)
					return;
				
				var year = yearTag.value;
				var month = document.getElementById(prefix + pos + ":startTime.month").value;
				var day = document.getElementById(prefix+ pos + ":startTime.day").value;			
				var endyear = document.getElementById(prefix + pos + ":endTime.year").value;
				var endmonth = document.getElementById(prefix + pos + ":endTime.month").value;
				var endday = document.getElementById(prefix + pos + ":endTime.day").value;
						
				if (endyear > year 
						||(endyear == year) && ( endmonth > month) 
						||(endyear == year) && ( endmonth == month)&&( endday >= day) )
						return;//don't modify
					
				document.getElementById(prefix + pos + ":endTime.year").value=year;	
				document.getElementById(prefix + pos + ":endTime.month").value=month;
				document.getElementById(prefix + pos + ":endTime.day").value=day;
			}
		
			var wait=false;
			function delayedRecalcDate(){
				if (!wait){
						wait = true;
						for(i=0; i<30; i++){//control 30 ts
						 setCustomEndtimeMonthDateYear(i);
						}
					  	setTimeout("wait=false;", 1500);//1.5 sec
					}			
			}
			
			//JSF issue for onclick, this goes around 
			function confirmTsCancel(link,msg){
				if (link.onclick == confirmDelete) {
				    return;
				  }
				                
				  deleteClick = link.onclick;
				  deleteMsg = msg;
				  link.onclick = confirmDelete;
			}
			function confirmDelete() {
				  var ans = confirm(deleteMsg);
				  if (ans) {
				    return deleteClick();
				  } else {
				    return false;
				  }
			}	
			
			jQuery(document).ready(function() {
				
				var MIN_ATTENDEES = 1;
				var MAX_ATTENDEES = 500;
			    
				/**
				* check input is only numeric
				*/
				jQuery(".numericOnly").keydown(function(event) {
			        // Allow only backspace and delete
			        if ( event.keyCode == 46 || event.keyCode == 8 ) {
			            // let it happen, don't do anything
			        }
			        else {
			            // Ensure that it is a number and stop the keypress
			            if (event.keyCode < 48 || event.keyCode > 57 ) {
			                event.preventDefault(); 
			            }   
			        }
			    });
				
				/*
				* check the range of a field after it has been input, and set it to default if out of range
				* Don't do it if it's blank though as that is handled separately.
				*/
				jQuery(".ranged").keyup(function(event) {
					
					var n = jQuery(this).val();
					
					if(n.length>0 && (n < MIN_ATTENDEES || n > MAX_ATTENDEES)) {
						alert("The number of attendees must be between " + MIN_ATTENDEES + " and " + MAX_ATTENDEES + ".");
						jQuery(this).val(MIN_ATTENDEES);
					}
					
				});
				
				/*
				* check if a form field is blank. if it is, set to default
				*/
				
				jQuery(".notblank").blur(function(event) {
					
					var n = jQuery(this).val();
					
					if(n == '') {
						jQuery(this).val(MIN_ATTENDEES);
					}
					
				});
				
				
			});
	
		</script>
	</f:verbatim>
		
</f:view> 
