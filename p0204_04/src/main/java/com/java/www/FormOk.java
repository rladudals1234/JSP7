package com.java.www;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class FormOk
 */
@WebServlet("/formOk")
public class FormOk extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		//id,pw확인 - db연결해서 확인
		if(id.equals("aaa") && pw.equals("1111")) {
			//session추가
			session.setAttribute("session_id",id);
		}
		
		//doGet,doPost 모두실행가능
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head><title>서블릿페이지</title></head>");
		writer.println("<body>");
		writer.println("<h2>form정보확인</h2>");
		writer.println("<h3>"+request.getParameter("id")+"</h3>");
		writer.println("<h3>"+request.getParameter("pw")+"</h3>");
		writer.println("<a href='./main.jsp'>메인페이지 이동</a>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
	}
	
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}*/

}
