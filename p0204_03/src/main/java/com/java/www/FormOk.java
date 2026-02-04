package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FormOk
 */
@WebServlet("/formOk")
public class FormOk extends HttpServlet {

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		//doGet,doPost 모두실행가능
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head><title>서블릿페이지</title></head>");
		writer.println("<body>");
		writer.println("<h2>form정보확인</h2>");
		writer.println("<h3>"+request.getParameter("id")+"</h3>");
		writer.println("<h3>"+request.getParameter("pw")+"</h3>");
		writer.println("</body>");
		writer.println("</html>");
	}
	
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}*/

}
