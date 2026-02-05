package com.java.www.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.service.MemberService;
import com.java.www.service.MemberServiceImpl;

/**
 * Servlet implementation class FController
 */
@WebServlet("*.do")
public class FController extends HttpServlet {

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		String viewPage = null;
		String uri = request.getRequestURI();				// /p0205_02/login.do
		String contextPath = request.getContextPath();		// /p0205_02
		String fileName = uri.substring(contextPath.length());	// /login.do
		System.out.println("uri : "+uri);
		System.out.println("contextPath"+contextPath);
		System.out.println("fileName : "+fileName);
		
		MemberService mService = null;
		
		if(fileName.equals("/login.do")) {
			viewPage = "./login.jsp";
			//response.sendRedirect("./login.jsp");
		} else if(fileName.equals("/membership.do")) {
			viewPage = "./membership.jsp";
		} else if(fileName.equals("/logout.do")) {
			viewPage = "./logout.jsp";
		} else if(fileName.equals("/board.do")) {
			viewPage = "./board.jsp";
		} else if(fileName.equals("/member.do")) {
			mService = new MemberServiceImpl();
			mService.execute(request, response);		//member모든정보
			viewPage = "./member.jsp";
		}
		//response.sendRedirect(viewPage);
		
		//request의 데이터가 함께 포워드
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request,response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}

}
