<%@include file="/html/multirender/init.jsp" %>
This is the <b>Multi Render</b> portlet in View mode.

<!-- define action URL "editURL" to perform update,edit,delete -->
<portlet:actionURL var="editURL" name="editName"> </portlet:actionURL>
<!-- create a form -->
<aui:form action="<%=editURL %>" method="POST">
	<aui:input type="text" label="name" name="name" />
	<aui:button type="submit" />
 </aui:form>
