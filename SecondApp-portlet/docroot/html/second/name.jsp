<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<portlet:defineObjects />

This is the <b>Second Portlet</b> ;portlet in Edit mode.

<!-- define action URL "editURL" to perform update,edit,delete -->
<portlet:actionURL var="editURL" name="editName"> </portlet:actionURL>
<!-- create a form -->
<aui:form action="<%=editURL %>" method="POST">
	<aui:input type="text" label="name" name="name" />
	<aui:button type="submit" />
 </aui:form>
