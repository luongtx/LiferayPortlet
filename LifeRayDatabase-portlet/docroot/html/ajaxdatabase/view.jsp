<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.liferay.sample.service.StudentLocalServiceUtil"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui" %>
<portlet:defineObjects />
<style>
	table, th, td {
		border: 1px solid black;
	}
	
	th, td {
		padding: 15px;
	}	
	thead {
		background-color: #408080;
	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<script src="<%=request.getContextPath() %>/js/main.js">
var rows = document.getElementsByTagName("tr");
alert(rows.length);
</script>
<p id="txt" > text </p>
<input type="text" name="searchInput" id="searchInput" placeholder="Enter student code" />
<button id="searchButton" onClick="onSearch()" type="button">Search</button>
<br/>
<select name="gender" id="dropdown" onChange="onSearch()">
	<option value="select gender">unknown</option>
	<option value="male">male</option>
	<option value="female">female</option>
</select>
<body onload="onSearch()">
<table>
	<thead>
		<tr>
			<th>Student Code</th>
			<th>FullName</th>
			<th>Gender</th>
			<th>BirthDay</th>
			<th>Address</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
	</thead>
	<tbody id="body">
		
	</tbody>
</table>
</body>
<portlet:resourceURL var="resourceURL" >
</portlet:resourceURL>
<portlet:renderURL var="editURL">

</portlet:renderURL>
<portlet:actionURL var="deleteURL" name="deleteStudent">
</portlet:actionURL>
	
<% SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); %>
<aui:script use="aui-base,aui-node,aui-io-request,liferay-portlet-url">
	Liferay.provide(
		window, 
		"onSearch", 
		function() {
			var txtCode = AUI().one('#searchInput').val();
			var txtGender = AUI().one('#dropdown').val();
			var resourceURL = '<%= resourceURL.toString()%>';
			var allRow="";
			var ajaxrequest = AUI().io.request(
				resourceURL,
				{
					data: {
						'<portlet:namespace/>txtCode': txtCode,
						'<portlet:namespace/>txtGender': txtGender
					},
					dataType: 'json',
					method: 'post',
					autoLoad: false,
					sync: true,
					on: {
						success: function() {
							var data = this.get('responseData');
							AUI().Array.each(data,function(student){
				
								var tbRow =
								"<tr><td>" +student.code+ "</td>"
								+"<td>" +student.fullname+ "</td>"
								+"<td>" +student.gender+ "</td>"
								+"<td>" +student.birthday+ "</td>"
								+"<td>" +student.address+ "</td>"
								+"<td>" +
							      "<a href='<%=editURL%>'"+
						              "class='btn btn-default'>" +
						              "<span class='glyphicon glyphicon-edit' />" +
							      "</a>"
							    +"</td>"
							    +"<td>" +
							    	"<button type='button' "+
							    		"onclick=''"+
							    		"class='btn btn-default'>"+
							    		"<span class='glyphycon glyphicon-remove' />" +
							    	"</button>"
							    +"</td></tr>"
								allRow = allRow + tbRow;
							});
							AUI().one('#body').setHTML(allRow);
						}
					}
				}
			);
			ajaxrequest.start();
		}
	);
</aui:script>
