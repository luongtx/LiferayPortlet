<%@page import="com.liferay.sample.service.StudentLocalServiceUtil"%>
<%@page import="com.liferay.portal.kernel.util.Http.Response"%>
<%@page import="javax.portlet.RenderResponse"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<portlet:defineObjects/>
<liferay-ui:error key="error" message="duplicate student code" />
<portlet:actionURL var="addURL" name="addStudent" windowState="maximized">
</portlet:actionURL>
<portlet:renderURL var="backURL" windowState="maximized">
	<portlet:param name="mvcPath" value="/html/portletdb/view.jsp"/>
</portlet:renderURL>

<portlet:renderURL var="currentURL" windowState="maximized">
	<portlet:param name="mvcPath" value="/html/portletdb/add.jsp"/>
</portlet:renderURL>

<aui:form method="POST" action="<%=addURL%>" >
	<aui:input type="text" name="code" value="B16DCAT">
		<aui:validator name="required"></aui:validator>
		<aui:validator name="minLength">10</aui:validator>
		<aui:validator name="maxLength">15</aui:validator>
		<aui:validator name="alphanum"></aui:validator>
	</aui:input>
	<aui:input type="text" name="fullName" >
		<aui:validator name="required"></aui:validator>
		<aui:validator name="minLength">5</aui:validator>
		<aui:validator name="maxLength">50</aui:validator>
		
	</aui:input>
	<aui:input type="Date" name="birthday">
		<aui:validator name="required"></aui:validator>
	</aui:input>
	<aui:select name="gender"> 
		<aui:option label="male" value="male"/>
		<aui:option label="female" value="female"/>
	</aui:select>
	<aui:input type="text" name="address" value="@gmail.com">
		<aui:validator name="email"></aui:validator>
		<aui:validator name="maxLength">150</aui:validator>
	</aui:input>
	<aui:input type="hidden" name="currentURL" value="${currentURL}" />
	<aui:button type="submit" value="save"/>
	<aui:button type="cancel" href="${backURL}" value="cancel"/>
</aui:form>