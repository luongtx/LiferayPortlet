<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<portlet:actionURL var="editURL" name="editEmail" >
</portlet:actionURL>

<aui:form method="POST" action="<%=editURL %>">
	<aui:input type="text" name="receiver" />
	<aui:input type="text" name="subject" />
	<aui:input type="textarea" name="body" />
	<aui:button type="submit" />
</aui:form>