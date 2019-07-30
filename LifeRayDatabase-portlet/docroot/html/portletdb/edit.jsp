<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.liferay.sample.service.StudentLocalServiceUtil"%>
<%@page import="com.liferay.portal.kernel.util.Http.Response"%>
<%@page import="javax.portlet.RenderResponse"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@ page import="com.liferay.sample.model.*"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%
	int studentID = ParamUtil.getInteger(request,"studentId");
	Student student = StudentLocalServiceUtil.getStudent(studentID);
	request.setAttribute("student", student);
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
%>
<portlet:renderURL var="backURL" windowState="maximized">
	<portlet:param name="mvcPath" value="/html/portletdb/view.jsp"/>
</portlet:renderURL>
<portlet:defineObjects/>

<portlet:actionURL var="editURL" name="editStudent" >
	<portlet:param name="studentID" value="${student.studentId}"/>
</portlet:actionURL>
<aui:form method="POST" action="<%=editURL%>" >
	<aui:input type="text" name="code" value="${student.code}">
		<aui:validator name="required"></aui:validator>
		<aui:validator name="minLength">10</aui:validator>
		<aui:validator name="maxLength">10</aui:validator>
		<aui:validator name="alphanum"></aui:validator>
	</aui:input>
	<aui:input type="text" name="fullName" value="${student.fullName}" >
		<aui:validator name="required"></aui:validator>
		<aui:validator name="minLength">5</aui:validator>
		<aui:validator name="maxLength">50</aui:validator>
	</aui:input>
	<aui:input type="Date" name="birthday">
		<aui:validator name="required"></aui:validator>
	</aui:input>
	<aui:select name="gender" value="${student.gender}"> 
		<aui:option label="male" value="male"/>
		<aui:option label="female" value="female"/>
	</aui:select>
	<aui:input type="text" name="address" value="${student.address}">
		<aui:validator name="email"></aui:validator>
		<aui:validator name="maxLength">150</aui:validator>
	</aui:input>
	<aui:button type="submit" value="save"/>
	<aui:button type="cancel" href="${backURL}" value="cancel"/>
</aui:form>
