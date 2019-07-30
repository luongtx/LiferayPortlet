package com.test;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.json.JSONArray;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.sample.model.Student;
import com.liferay.sample.service.StudentLocalServiceUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class AJAXPortlet
 */
public class AjaxDatabase extends MVCPortlet {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.liferay.util.bridges.mvc.MVCPortlet#serveResource(javax.portlet.
	 * ResourceRequest, javax.portlet.ResourceResponse)
	 */
	@Override
	public void serveResource(ResourceRequest request, ResourceResponse response) throws IOException, PortletException {

		String code = ParamUtil.getString(request, "txtCode");
		String gender = ParamUtil.getString(request,"txtGender");
		try {
			List<Student> students = StudentLocalServiceUtil.search(code, "", gender, -1, -1);
			
			JSONArray jsonArray = JSONFactoryUtil.createJSONArray();
			JSONObject jsonObject = null;
			
			for(Student student: students){
				jsonObject = JSONFactoryUtil.createJSONObject();
				jsonObject.put("id", student.getStudentId());
				jsonObject.put("code", student.getCode());
				jsonObject.put("fullname", student.getFullName());
				jsonObject.put("gender", student.getGender());
				jsonObject.put("birthday", new SimpleDateFormat("dd/MM/yyyy").format(student.getBirthday()));
				jsonObject.put("address", student.getAddress());
				jsonArray.put(jsonObject);
			}
			response.setContentType("text/javascript");
			response.setCharacterEncoding("UTF-8");
			PrintWriter printWriter = response.getWriter();
			printWriter.write(jsonArray.toString());

			printWriter.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	public void deleteStudent(ActionRequest request, ActionResponse response)
			throws IOException, PortletException {
		// TODO Auto-generated method stub
		int id = ParamUtil.getInteger(request, "studentId");
		
		try {
			StudentLocalServiceUtil.deleteStudent(id);
		} catch (PortalException | SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}