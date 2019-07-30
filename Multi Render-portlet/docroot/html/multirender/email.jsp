<%@include file="/html/multirender/init.jsp" %>

<portlet:actionURL var="editURL" name="editEmail" >	
</portlet:actionURL>

<aui:form method="POST" action="<%=editURL%>">
	<aui:input type="text" name="receiver" />
	<aui:input type="text" name="subject" />
	<aui:input type="textarea" name="body" />
	<aui:button type="submit" />
</aui:form>