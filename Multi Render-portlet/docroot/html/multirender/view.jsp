<%@include file="/html/multirender/init.jsp" %>

This is the <b>Multi Render</b> portlet in View mode.
<portlet:renderURL var="editNameURL">
    <portlet:param name="mvcPath" value="/html/multirender/name.jsp" />
</portlet:renderURL>
<p> <a href="<%=editNameURL%>"> Enter name link</a> </p>

<portlet:renderURL var="sendmailURL">
	<portlet:param name="mvcPath" value="/html/multirender/email.jsp"/>
</portlet:renderURL>
<a href="<%=sendmailURL%>"> Enter email link</a>
<% String msg = ParamUtil.getString(renderRequest, "message"); %>
<%=msg %>
