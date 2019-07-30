package com.test;

import java.io.File;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.util.PortalUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

public class UploadFilePortlet extends MVCPortlet {
	public void uploadFile(ActionRequest request, ActionResponse response){
		UploadPortletRequest uploadRequest = PortalUtil.getUploadPortletRequest(request);
		File file = uploadRequest.getFile("fileData");
		if(file!=null && file.getName()!=null){
			System.out.println("file name: "+file.getName());
		}else{
			System.out.println("file not found");
		}
	}
}
