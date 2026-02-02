package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/Pro3")
public class Pro3 extends HttpServlet {

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");		//post 한글처리
		
		//넘어온 데이터 확인방법 - getParameter, getParameterValues-checkbox일때만
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head><title>결과</title></head>");
		writer.println("<body>");
		writer.println("<h2>결과화면출력</h2>");
		writer.println("<h3>아이디 : "+id+"</h2>");
		writer.println("<h3>이름 : "+name+"</h2>");
		writer.println("</body>");
		writer.println("</html>");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

}
