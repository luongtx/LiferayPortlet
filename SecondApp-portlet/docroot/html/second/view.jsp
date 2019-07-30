<%@taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<portlet:defineObjects />

<% 
String message = ParamUtil.getString(renderRequest,"message"); 
%>
This is the <b>Second Portlet</b>; portlet in View mode.
<br/>
<%=message%>
<portlet:renderURL var="editNameURL">
    <portlet:param name="mvcPath" value="/html/second/name.jsp" />
</portlet:renderURL>
<p> <a href="<%=editNameURL%>"> Enter name link</a> </p>
<portlet:renderURL var="emailURL">
    <portlet:param name="mvcPath" value="/html/second/email.jsp" />
</portlet:renderURL>
<p> <a href="<%=emailURL%>"> Enter email link</a> </p>
	