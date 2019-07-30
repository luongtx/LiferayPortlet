<%@page import="com.liferay.sample.model.Student"%>
<%@page import="com.liferay.portal.kernel.dao.search.SearchContainer"%>
<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@page import="com.liferay.portal.kernel.dao.search.ResultRow"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%
 	//lấy SearchContainer đang gọi file action.jsp
	SearchContainer searchContainer = (SearchContainer)request.getAttribute("liferay-ui:search:searchContainer");
	//lấy đối tượng student tương ứng với dòng được chọn
	ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);
	Student student = (Student)row.getObject();
%>

<liferay-ui:icon-menu>
	<portlet:renderURL var="viewDetailURL">
		<portlet:param name="studentId" value="<%= String.valueOf(student.getStudentId()) %>" />
		<portlet:param name="mvcPath" value="/html/portletdb/detail.jsp" />
	</portlet:renderURL>
	<liferay-ui:icon message="detail" iconCssClass="icon-info" url="<%= viewDetailURL %>" />
	
	<portlet:renderURL var="editURL">
		<portlet:param name="studentId" value="<%= String.valueOf(student.getStudentId()) %>" />
		<portlet:param name="mvcPath" value="/html/portletdb/edit.jsp" />
	</portlet:renderURL>
	<liferay-ui:icon message="edit" iconCssClass="icon-edit" url="<%= editURL %>" />
	
	<portlet:actionURL var="deleteURL" name="deleteStudent">
		<portlet:param name="studentId" value="<%= String.valueOf(student.getStudentId()) %>" />
	</portlet:actionURL>
	<liferay-ui:icon message="delete" iconCssClass="icon-remove" url="<%= deleteURL %>" />
	
</liferay-ui:icon-menu>
