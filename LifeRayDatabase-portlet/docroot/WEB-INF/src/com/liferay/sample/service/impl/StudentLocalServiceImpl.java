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

package com.liferay.sample.service.impl;

import java.util.List;

import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.sample.NoSuchStudentException;
import com.liferay.sample.model.Student;
import com.liferay.sample.service.base.StudentLocalServiceBaseImpl;

/**
 * The implementation of the student local service.
 *
 * <p>
 * All custom service methods should be put in this class. Whenever methods are added, rerun ServiceBuilder to copy their definitions into the {@link com.liferay.sample.service.StudentLocalService} interface.
 *
 * <p>
 * This is a local service. Methods of this service will not have security checks based on the propagated JAAS credentials because this service can only be accessed from within the same VM.
 * </p>
 *
 * @author luongtx
 * @see com.liferay.sample.service.base.StudentLocalServiceBaseImpl
 * @see com.liferay.sample.service.StudentLocalServiceUtil
 */
public class StudentLocalServiceImpl extends StudentLocalServiceBaseImpl {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never reference this interface directly. Always use {@link com.liferay.sample.service.StudentLocalServiceUtil} to access the student local service.
	 */
	public List<Student> search(String code, String fullName, String gender, int start, int end){
		String bufferCode = (code!=null)?"%"+code+"%":"%%";
		String bufferFullName = (fullName!=null)? "%"+fullName+"%":"%%";
		List<Student> students = null;
		try{
			if(gender.equals("male") || gender.equals("female")){
				students = studentPersistence.findByC_F_G(bufferCode, bufferFullName, gender,start,end);
			}else{
				students = studentPersistence.findByC_F(bufferCode, bufferFullName);
			}
		}catch(SystemException e){
			e.printStackTrace();
		}
		return students;
	}
	
	public int count(String code, String fullName, String gender) throws Exception{
		String bufferCode = (code!=null)?"%"+code+"%":"%%";
		String bufferFullName = (fullName!=null)? "%"+fullName+"%":"%%";
		if(gender.equals("male") || gender.equals("female")){
			return studentPersistence.countByC_F_G(bufferCode, bufferFullName, gender);
		}else{
			return studentPersistence.countByC_F(bufferCode, bufferFullName);
		}
	}
}