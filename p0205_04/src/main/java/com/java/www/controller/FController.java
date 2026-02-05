package com.java.www.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.service.MemberListServiceImpl;
import com.java.www.service.MemberService;

/**
 * Servlet implementation class FController
 */
@WebServlet("*.do")
public class FController extends HttpServlet {

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String fileName = uri.substring(contextPath.length());
		
		System.out.println("uri : " + uri);
		System.out.println("contextPath : " + contextPath);
		System.out.println("fileName : " + fileName);
		
		String viewPage = "";
		switch(fileName) {
			case "/main.do":
				viewPage = "./main.jsp";
				break;
			case "/member.do":
				MemberService mService = new MemberListServiceImpl();
				mService.execute(request, response);
				viewPage = "./member.jsp";
				break;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

}
