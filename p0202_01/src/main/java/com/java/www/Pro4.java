package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Enumeration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/Pro4")
public class Pro4 extends HttpServlet {

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		//post 한글처리
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String[] hobby = request.getParameterValues("hobby");
		Enumeration e = request.getParameterNames();
		while(e.hasMoreElements()) {
			System.out.println(e.nextElement());
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head><title>결과</title></head>");
		writer.println("<body>");
		writer.println("<h2>결과화면출력</h2>");
		writer.println("<h3>아이디 : "+id+"</h3>");
		writer.println("<h3>비밀번호 : "+password+"</h3>");
		writer.println("<h3>이름 : "+name+"</h3>");
		writer.println("<h3>취미 : "+Arrays.toString(hobby)+"</h3>");		
		while(e.hasMoreElements()) {
			writer.println("<h3>"+e.nextElement()+"</h3>");
		}
		/*for(int i=0;i<hobby.length;i++) {
			writer.println("<h3>취미 : "+hobby[i]+"</h3>");
		}*/
		writer.println("</body>");
		writer.println("</html>");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}

}
