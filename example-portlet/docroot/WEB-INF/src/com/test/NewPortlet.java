package com.test;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;

import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class NewPortlet
 */
public class NewPortlet extends MVCPortlet {

	@Override
	public void processAction(ActionRequest actionRequest,
			ActionResponse actionResponse) throws IOException, PortletException {
		javax.portlet.PortletPreferences prefs = actionRequest.getPreferences();
		String greeting = actionRequest.getParameter("greeting");
		try {
            prefs.setValue("greeting", greeting);
            prefs.store();
            SessionMessages.add(actionRequest, "success");
        }catch(Exception e){
        	SessionErrors.add(actionRequest,"error");
        }
        
        super.processAction(actionRequest, actionResponse);
	}
}
