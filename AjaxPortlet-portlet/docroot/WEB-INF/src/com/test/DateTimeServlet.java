package com.test;


import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DateTimeServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String localDate = new SimpleDateFormat("dd:MM:yyyy HH:mm:ss").format(new Date());
		String message = "Hello Word "+"<i>"+localDate+"</i>";
		OutputStream out = response.getOutputStream();
		out.write(message.getBytes());
	}
}
