<%@page import="com.liferay.portal.util.SessionClicks"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui"%>

<%@page import="javax.portlet.PortletURL"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>

<portlet:defineObjects />
<liferay-theme:defineObjects />
<%
// 	get stt in session
	String status = SessionClicks.get(request, "status", "");
%>

<aui:row>
	<div class='<%= status != null && status.equals("hide") ? "hide" : ""%>' id="divId">
		<img alt="chingovan.blogspot.com" src='<%= request.getContextPath() +  "/images/chingovan.blogspot.com.png"%>'>
	</div>
</aui:row>
<aui:row>
	<aui:col span="4">
		<portlet:renderURL var="refreshURL">
		</portlet:renderURL>
		<aui:a href="<%= refreshURL.toString() %>">Refresh</aui:a>
	</aui:col>
	
<!-- 	call js function with param specifies status -->
	<aui:col span="4">
		<aui:a href='<%= "javascript:setStatus(\'show\');" %>'>Show</aui:a>
	</aui:col>
	
	<aui:col span="4">
		<aui:a href='<%= "javascript:setStatus(\'hide\');" %>'>Hide</aui:a>
	</aui:col>
</aui:row>

<!-- define js function -->
<aui:script use="aui-base,aui-node,aui-toggler,liferay-store">
	Liferay.provide(
		window,
		'setStatus',
		function(stt){
			var divTag = AUI().one('#divId');
			
// 			to show or hide images
			if( stt == 'show') {
				divTag.removeClass('hide');
			} else if( stt == 'hide') {
				divTag.addClass('hide');
			}
// 			store stt in session
			Liferay.Store('status', stt);
		}
	);
</aui:script>