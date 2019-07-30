package com.liferay.tutorial;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;

import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class SecondPortlet
 */
public class SecondPortlet extends MVCPortlet {
	public void editName(ActionRequest request, ActionResponse response)
			throws IOException, PortletException {
		// get value from client: value of input "name"
		String name = ParamUtil.getString(request, "name");
		// declare return message
		String message;
		if (name == null || name.equals("")) {
			message = "Hello world";
		} else {
			message = "Hello" + " " + name;
		}
		// set value to render parameter "message"
		response.setRenderParameter("message", message);
		// //call parent method
		// super.processAction(request, response);
	}

	public void editEmail(ActionRequest request, ActionResponse response)
			throws IOException, PortletException {
		String rcv = ParamUtil.getString(request, "receiver");
		String sbj = ParamUtil.getString(request, "subject");
		String body = ParamUtil.getString(request, "body");
		String sendmail = "receiver: " + rcv + "<br>" + "subject: " + sbj + "<br>" + "body: " + body;
		response.setRenderParameter("message", sendmail);
	}
}
