package com.java.www;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

//Servlet파일 - get,post방식
@WebServlet("/Program2")
public class Program2 extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Get/post방식으로 둘다 적용될 수 있도록 구성");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>");
		writer.println("html화면");
		writer.println("</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h2>서브페이지 오픈</h2>");
		writer.println("</body>");
		writer.println("</html>");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Get방식으로 들어온 페이지입니다.");
		doAction(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post방식으로 들어온 페이지입니다.");
		String name = request.getParameter("name");
		System.out.println(name);
		System.out.println("입력받은 데이터 확인을 해보세요.");
		doAction(request, response);
		//doGet(request, response);
	}

}
