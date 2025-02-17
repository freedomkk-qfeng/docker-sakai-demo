<!-- $Id: questionTreeTable.jsp 305964 2014-02-14 01:05:35Z ktsao@stanford.edu $
<%--
***********************************************************************************
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
<STYLE type="text/css">
<!-- 
table.checkall td {padding-top:0px;padding-bottom:0px;margin-top:0px;margin-bottom:0px}
-->
</STYLE>

 <h:dataTable cellpadding="0" cellspacing="0" value="#{questionpool.allItems}" var="question" styleClass="listHier">

<h:column id="colremove" rendered="#{questionpool.importToAuthoring == 'false'}" >
  <f:facet name="header">
    <h:selectManyCheckbox immediate="true" id="selectall" onclick="toggleRemove();checkUpdate()" title="#{questionPoolMessages.t_checkAll}" styleClass="checkall">
      <f:selectItem itemValue="1"/>
    </h:selectManyCheckbox>
  </f:facet>
  <h:selectManyCheckbox immediate="true" id="removeCheckbox" onclick="checkUpdate()" onkeypress="checkUpdate()"  value="#{questionpool.destItems}">
    <f:selectItem itemValue="#{question.itemIdString}" itemLabel=""/>
  </h:selectManyCheckbox>
</h:column>

    <h:column>
      <f:facet name="header">      
		<h:panelGroup>
        <h:commandLink title="#{questionPoolMessages.t_sortQuestionText}" id="sortByTitleAction" immediate="true" action="editPool" rendered="#{questionpool.sortQuestionProperty ne 'text'}">
          <h:outputText value="#{questionPoolMessages.q_text}" />
          <f:param name="orderBy" value="text"/>
          <f:param name="ascending" value="true"/>
          <f:actionListener type="org.sakaiproject.tool.assessment.ui.listener.questionpool.SortQuestionListListener" />
        </h:commandLink>

        <h:commandLink title="#{questionPoolMessages.t_sortQuestionText}" immediate="true" action="editPool" rendered="#{questionpool.sortQuestionProperty=='text' && questionpool.sortQuestionAscending}">
          <h:outputText value="#{questionPoolMessages.q_text}" />
          <f:param name="orderBy" value="text"/>
          <f:param name="ascending" value="false"/>
          <h:graphicImage alt="#{questionPoolMessages.alt_sortQuestionTextDescending}" rendered="#{author.publishedAscending}" url="/images/sortascending.gif"/>
          <f:actionListener type="org.sakaiproject.tool.assessment.ui.listener.questionpool.SortQuestionListListener" />
        </h:commandLink>

        <h:commandLink title="#{questionPoolMessages.t_sortQuestionText}" immediate="true" action="editPool" rendered="#{questionpool.sortQuestionProperty=='text' && !questionpool.sortQuestionAscending}">
          <h:outputText value="#{questionPoolMessages.q_text}" />
          <f:param name="orderBy" value="text"/>
          <f:param name="ascending" value="true"/>
          <h:graphicImage alt="#{questionPoolMessages.alt_sortQuestionTextAscending}" rendered="#{author.publishedAscending}" url="/images/sortdescending.gif"/>          
          <f:actionListener type="org.sakaiproject.tool.assessment.ui.listener.questionpool.SortQuestionListListener" />
        </h:commandLink>
        </h:panelGroup>
      </f:facet>

<h:commandLink title="#{questionPoolMessages.t_editQuestion}" id="modify" action="#{itemauthor.doit}">

    <h:outputText escape="false" value="#{question.themeText}" rendered="#{question.typeId == 14}"/>
    <h:outputText escape="false" value="#{question.textHtmlStripped}" rendered="#{question.typeId ne 14}"/>
    <f:actionListener
      type="org.sakaiproject.tool.assessment.ui.listener.author.ItemModifyListener" />
    <f:param name="itemid" value="#{question.itemId}"/>
    <f:param name="poolId" value="#{questionpool.currentPool.id}"/>
    <f:param name="target" value="questionpool"/>
</h:commandLink>

<f:verbatim><br/></f:verbatim>

 <f:verbatim><span class="itemAction"></f:verbatim>
<h:commandLink title="#{questionPoolMessages.t_copyQuestion}" rendered="#{questionpool.importToAuthoring != 'true'}" id="copylink" immediate="true" action="#{questionpool.startCopyQuestion}">
  <h:outputText id="copy" value="#{questionPoolMessages.copy}"/>
    <f:param name="itemid" value="#{question.itemId}"/>
</h:commandLink>
<h:outputText  rendered="#{questionpool.importToAuthoring != 'true'}" value=" #{questionPoolMessages.separator} " />

<h:commandLink title="#{questionPoolMessages.t_moveQuestion}" rendered="#{questionpool.importToAuthoring != 'true'}" id="movelink" immediate="true" action="#{questionpool.startMoveQuestion}">
  <h:outputText id="move" value="#{questionPoolMessages.move}"/>
    <f:param name="itemid" value="#{question.itemId}"/>
</h:commandLink>

 <f:verbatim></span></f:verbatim>
    </h:column>


    <h:column>
      <f:facet name="header">
        <h:panelGroup>
        <h:commandLink title="#{questionPoolMessages.t_sortQuestionType}" id="sortByTypeAction" immediate="true" action="editPool" rendered="#{questionpool.sortQuestionProperty ne 'keyword'}">
          <h:outputText value="#{questionPoolMessages.q_type}" />
          <f:param name="orderBy" value="keyword"/>
          <f:param name="ascending" value="true"/>
          <f:actionListener type="org.sakaiproject.tool.assessment.ui.listener.questionpool.SortQuestionListListener" />
        </h:commandLink>

        <h:commandLink title="#{questionPoolMessages.t_sortQuestionType}" immediate="true" action="editPool" rendered="#{questionpool.sortQuestionProperty=='keyword' && questionpool.sortQuestionAscending}">
          <h:outputText value="#{questionPoolMessages.q_type}" />
          <f:param name="orderBy" value="keyword"/>
          <f:param name="ascending" value="false"/>
          <h:graphicImage alt="#{questionPoolMessages.alt_sortQuestionTypeDescending}" rendered="#{author.publishedAscending}" url="/images/sortascending.gif"/>
          <f:actionListener type="org.sakaiproject.tool.assessment.ui.listener.questionpool.SortQuestionListListener" />
        </h:commandLink>

        <h:commandLink title="#{questionPoolMessages.t_sortQuestionType}" immediate="true" action="editPool" rendered="#{questionpool.sortQuestionProperty=='keyword' && !questionpool.sortQuestionAscending}">
          <h:outputText value="#{questionPoolMessages.q_type}" />
          <f:param name="orderBy" value="keyword"/>
          <f:param name="ascending" value="true"/>
          <h:graphicImage alt="#{questionPoolMessages.alt_sortQuestionTypeAscending}" rendered="#{author.publishedAscending}" url="/images/sortdescending.gif"/>          
          <f:actionListener type="org.sakaiproject.tool.assessment.ui.listener.questionpool.SortQuestionListListener" />
        </h:commandLink>
        </h:panelGroup>
      </f:facet>
     <h:outputText rendered="#{question.typeId== 1}" value="#{authorMessages.multiple_choice_type}"/>
     <h:outputText rendered="#{question.typeId== 2}" value="#{authorMessages.multiple_choice_type}"/>
     <h:outputText rendered="#{question.typeId== 3}" value="#{authorMessages.multiple_choice_surv}"/>
     <h:outputText rendered="#{question.typeId== 4}" value="#{authorMessages.true_false}"/>
     <h:outputText rendered="#{question.typeId== 5}" value="#{authorMessages.short_answer_essay}"/>
     <h:outputText rendered="#{question.typeId== 6}" value="#{authorMessages.file_upload}"/>
     <h:outputText rendered="#{question.typeId== 7}" value="#{authorMessages.audio_recording}"/>
     <h:outputText rendered="#{question.typeId== 8}" value="#{authorMessages.fill_in_the_blank}"/>
     <h:outputText rendered="#{question.typeId== 9}" value="#{authorMessages.matching}"/>
     <h:outputText rendered="#{question.typeId== 11}" value="#{authorMessages.fill_in_numeric}"/>
     <h:outputText rendered="#{question.typeId== 12}" value="#{authorMessages.multiple_choice_type}"/>
     <h:outputText rendered="#{question.typeId== 14}" value="#{authorMessages.extended_matching_items}"/>
     <h:outputText rendered="#{question.typeId== 13}" value="#{authorMessages.matrix_choice_surv}"/>
     <h:outputText rendered="#{question.typeId== 15}" value="#{authorMessages.calculated_question}"/><!-- // CALCULATED_QUESTION -->

    </h:column>

    <h:column id="colimport" rendered="#{questionpool.importToAuthoring == 'true'}" >
      <f:facet name="header">
        <h:outputText value="#{questionPoolMessages.impToAuthor}"/>
      </f:facet>
 	  <h:selectManyCheckbox immediate="true" id="importCheckbox" value="#{questionpool.destItems}">
        <f:selectItem itemValue="#{question.itemIdString}" itemLabel=""/>
 	  </h:selectManyCheckbox>
     </h:column>


  </h:dataTable>
