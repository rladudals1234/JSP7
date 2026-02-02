package com.java.www;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Program1
 */
@WebServlet("/Pr1")
public class Program1 extends HttpServlet {
	
	//get방식 - url,주소입력,링크 
	// private-같은클래스,default-패키지,protected-자손클래스,public-전체
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("주소로 잘 들어와서 출력되었습니다.");
		System.out.println();
		System.out.println("1");
		System.out.println("2");
		System.out.println("3");
		System.out.print(1);
		System.out.print(1);
		System.out.print(1);
		System.out.print(1);
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	//post방식 - form->post
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
