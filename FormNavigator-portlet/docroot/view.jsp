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
<%@ taglib uri = "http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

<%
	String[] CATEGORIES_NAMES = {"Basic Infor", "Educations", "Hobbies"};
	String[] basicInfor = {"profile","contact"};
	String[] education = {"university","high_school"};
	String[] hobbies = {"sport","entertainment"};
	String[][] categories_sections = {basicInfor, education, hobbies};
%>
<portlet:actionURL var = "formaction"></portlet:actionURL>
<aui:form method = "POST" action = "<%=formaction %>" >
	<liferay-ui:form-navigator
		categoryNames = "<%=CATEGORIES_NAMES %>"
		categorySections = "<%=categories_sections %>"
		jspPath = "/html/navform/subjsp/"
	/>
</aui:form>