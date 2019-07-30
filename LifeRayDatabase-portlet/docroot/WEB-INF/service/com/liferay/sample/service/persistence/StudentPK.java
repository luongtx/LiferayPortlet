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

package com.liferay.sample.service.persistence;

import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringPool;

import java.io.Serializable;

/**
 * @author luongtx
 * @generated
 */
public class StudentPK implements Comparable<StudentPK>, Serializable {
	public long studentId;
	public String code;

	public StudentPK() {
	}

	public StudentPK(long studentId, String code) {
		this.studentId = studentId;
		this.code = code;
	}

	public long getStudentId() {
		return studentId;
	}

	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public int compareTo(StudentPK pk) {
		if (pk == null) {
			return -1;
		}

		int value = 0;

		if (studentId < pk.studentId) {
			value = -1;
		}
		else if (studentId > pk.studentId) {
			value = 1;
		}
		else {
			value = 0;
		}

		if (value != 0) {
			return value;
		}

		value = code.compareTo(pk.code);

		if (value != 0) {
			return value;
		}

		return 0;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof StudentPK)) {
			return false;
		}

		StudentPK pk = (StudentPK)obj;

		if ((studentId == pk.studentId) && (code.equals(pk.code))) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public int hashCode() {
		return (String.valueOf(studentId) + String.valueOf(code)).hashCode();
	}

	@Override
	public String toString() {
		StringBundler sb = new StringBundler(10);

		sb.append(StringPool.OPEN_CURLY_BRACE);

		sb.append("studentId");
		sb.append(StringPool.EQUAL);
		sb.append(studentId);

		sb.append(StringPool.COMMA);
		sb.append(StringPool.SPACE);
		sb.append("code");
		sb.append(StringPool.EQUAL);
		sb.append(code);

		sb.append(StringPool.CLOSE_CURLY_BRACE);

		return sb.toString();
	}
}