<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ page import="com.liferay.sample.model.Student"%>
<%@ page import="com.liferay.sample.service.StudentLocalServiceUtil"%>
<portlet:defineObjects />

<link rel = "stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<%
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
%>
<input type="text" id="txtSearch" placeholder="search any fields..." onkeyup="filter_all()" />

<select name="gender" id="gender" onchange="filter_all()">
	<option value="" >select gender</option>
	<option value="male">male</option>
	<option value="female">female</option>
</select>
<liferay-ui:search-container delta="5">
	<liferay-ui:search-container-results
		results="<%=StudentLocalServiceUtil.getStudents(0, StudentLocalServiceUtil.getStudentsCount())%>"
		total="<%=StudentLocalServiceUtil.getStudentsCount() %>"
	/>
	<liferay-ui:search-container-row
		className="com.liferay.sample.model.Student" modelVar="student">
		
		<liferay-ui:search-container-column-text property="code" />

		<liferay-ui:search-container-column-text property="fullName" name="Fullname"/>

		<liferay-ui:search-container-column-text name="Birthday" value="<%=sdf.format(student.getBirthday()) %>"/>
		
		<liferay-ui:search-container-column-text property="address" />
		
		<liferay-ui:search-container-column-text property="gender"/>
		
		<liferay-ui:search-container-column-jsp path="/html/portletdb/action.jsp" name="Actions" />
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator paginate="true"/>
</liferay-ui:search-container>
<portlet:renderURL var="addURL">
	<portlet:param name="mvcPath" value="/html/portletdb/add.jsp" />
</portlet:renderURL>
<aui:button type="button" href="${addURL}" value="add"/>
