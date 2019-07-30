<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@page import="com.liferay.sample.service.StudentLocalServiceUtil"%>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="com.liferay.sample.model.*" %>

<%
	int studentID = ParamUtil.getInteger(request,"studentId");
	Student student = StudentLocalServiceUtil.getStudent(studentID);
	request.setAttribute("student", student);
%>
<h1>Student Infor:</h1>
<h4>studentCode: ${student.code}</h4>
<h4>Full name: ${student.fullName}</h4>
<h4>Address: ${student.address}</h4>
<h4>Gender: ${student.gender}</h4>
<h4>Birth day: ${student.birthday}</h4>

<portlet:renderURL var="backURL">
	<portlet:param name="mvcPath" value="/html/portletdb/view.jsp"/>
</portlet:renderURL>
<aui:button href="${backURL}" value="Back" />