<%@include file="/html/multirender/init.jsp" %>
<% String msg = ParamUtil.getString(renderRequest, "message"); %>
Email was sent successfully
<br/>
<%=msg %>
