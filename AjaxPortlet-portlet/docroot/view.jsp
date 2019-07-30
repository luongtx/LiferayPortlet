<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />
<%
	String currentTime = new SimpleDateFormat("dd:MM:yyyy HH:mm:ss").format(new Date());
%>
<script type="text/javascript">
 	function setCurrentDateTime(){
 		var xhr = new XMLHttpRequest();
 		var url = "<%=request.getContextPath()%>/DateTimeServlet";
 		xhr.open("GET",url,true);
 		xhr.send();
 		//event listener
 		xhr.onreadystatechange = function(){
 			if(xhr.readyState==4){
 				document.getElementById("datetime").innerHTML= xhr.responseText;
 			}
 		}
 	}
</script>
<div id="datetime">Hello Luong <i><%=currentTime%></i> </div>
<br>
<a href="#" onclick="setCurrentDateTime();"> Refresh </a>
