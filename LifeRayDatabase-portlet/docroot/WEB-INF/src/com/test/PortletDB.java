package com.test;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;

import com.liferay.counter.service.CounterLocalServiceUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.sample.model.Student;
import com.liferay.sample.service.StudentLocalServiceUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class PortletDB
 */
public class PortletDB extends MVCPortlet {
	public void addStudent(ActionRequest request, ActionResponse response)
			throws IOException, PortletException {
		try {
			String code = ParamUtil.getString(request, "code");
			String fullName = ParamUtil.getString(request, "fullName");
			Date birthday = ParamUtil.getDate(request, "birthday", new SimpleDateFormat("dd/MM/yyyy"));
			String gender = ParamUtil.getString(request, "gender");
			String address = ParamUtil.getString(request, "address");
			String backURL = ParamUtil.getString(request, "currentURL");
			if(StudentLocalServiceUtil.count(code, "", "")>0){	
				SessionErrors.add(request, "error");
				response.sendRedirect(backURL);
				return;
			}
			//set studentid auto increment
			Student std = StudentLocalServiceUtil.createStudent((int) CounterLocalServiceUtil.increment());
			std.setCode(code);
			std.setFullName(fullName);
			std.setBirthday(birthday);
			std.setGender(gender);
			std.setAddress(address);
			StudentLocalServiceUtil.addStudent(std);
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
	public void editStudent(ActionRequest request, ActionResponse response) throws IOException, PortletException, PortalException, SystemException{
		int id = ParamUtil.getInteger(request, "studentID");
		Student student = StudentLocalServiceUtil.getStudent(id);
		student.setCode(ParamUtil.getString(request, "code"));
		student.setFullName(ParamUtil.getString(request, "fullName"));
		student.setGender(ParamUtil.getString(request, "gender"));
		student.setAddress(ParamUtil.getString(request, "address"));
		student.setBirthday(ParamUtil.getDate(request,"birthday", new SimpleDateFormat("dd/MM/yyyy")));
		StudentLocalServiceUtil.updateStudent(student);
	}
}
