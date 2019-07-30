<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui" %>
<portlet:defineObjects />

<input type="text" name="searchInput" id="searchInput" placeholder="Enter student code" />
<button id="searchButton" onClick="onSearch()" type="button">Search</button>
<br />

<table width="100%">
	<thead>
		<tr>
			<td>StudentCode</td>
			<td>FullName</td>
			<td>Gender</td>
			<td>Birthday</td>
			<td>Address</td>
		</tr>
	</thead>
	<tbody id="body">

	</tbody>
</table>

<portlet:resourceURL var="resourceURL" >
</portlet:resourceURL>

<aui:script use="aui-base,aui-node,aui-io-request,liferay-portlet-url">
	Liferay.provide(
		window, 
		"onSearch", 
		function() {
			var txtSearch = AUI().one('#searchInput').val();
			
			var resourceURL = '<%= resourceURL.toString()%>';
			
			var ajaxrequest = AUI().io.request(
				resourceURL,
				{
					data: {'<portlet:namespace/>txtSearch': txtSearch},
					dataType: 'json',
					method: 'post',
					autoLoad: false,
					sync: true,
					on: {
						success: function() {
							var data = this.get('responseData');
							alert(data);
						}
					}
				}
			);
			ajaxrequest.start();
		}
	);
</aui:script>