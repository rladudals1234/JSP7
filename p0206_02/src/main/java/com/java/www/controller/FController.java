package com.java.www.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.www.dto.MemberDto;
import com.java.www.service.BDeleteServiceImpl;
import com.java.www.service.BInsertServiceImpl;
import com.java.www.service.BListServiceImpl;
import com.java.www.service.BUpdateServiceImpl;
import com.java.www.service.BViewServiceImpl;
import com.java.www.service.BoardService;
import com.java.www.service.MInsertServiceImpl;
import com.java.www.service.MListServiceImpl;
import com.java.www.service.MLoginServiceImpl;
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
		MemberService memberService = null; 
		BoardService boardService = null;
		String viewPage = "";
		switch(fileName) {
			case "/":
				viewPage = "/index.jsp";
				break;
			case "/main.do":
				viewPage = "/index.jsp";
				break;
			case "/login.do":
				viewPage = "/member/login.jsp";
				break;
			case "/doLogin.do":
				//데이터가 있는지 확인 id,pw가 회원이 존재하는지 확인
				//String id = request.getParameter("id");
				//String pw = request.getParameter("pw");
				//
				memberService = new MLoginServiceImpl();
				memberService.execute(request, response);
				MemberDto mdto = (MemberDto) request.getAttribute("mdto");
				if(mdto == null) {
					System.out.println("아이디 또는 패스워드가 일치하지 않습니다.");
				} else {
					System.out.println("로그인이 되었습니다.");
					HttpSession session = request.getSession();
					session.setAttribute("session_id", mdto.getId());
					session.setAttribute("session_name", mdto.getName());
				}
				viewPage = "/member/doLogin.jsp";
				//response.sendRedirect(contextPath + "/");
				//return;
				break;
			case "/membership.do":
				viewPage = "/member/membership.jsp";
				break;
			case "/doMembership.do":
				memberService = new MInsertServiceImpl();
				memberService.execute(request, response);
				//viewPage = "/member/doMembership.jsp";
				viewPage = "/member/membership2.jsp";
				break;
			case "/logout.do":
				request.getSession().invalidate();
				request.setAttribute("logout", 1);
				viewPage = "/member/doLogout.jsp";
				//viewPage = contextPath + "/";
				//response.sendRedirect(viewPage);
				//return;
				break;
			case "/member.do":
				System.out.println("member.do");
				memberService = new MListServiceImpl();
				memberService.execute(request, response);
				viewPage = "/member/member.jsp";
				break;
			case "/board.do":
				boardService = new BListServiceImpl();
				boardService.execute(request, response);
				viewPage = "/board/board.jsp";
				break;
			case "/boardView.do":
				boardService = new BViewServiceImpl();
				boardService.execute(request, response);
				viewPage = "/board/boardView.jsp";
				break;
			case "/boardWrite.do":
				viewPage = "/board/boardWrite.jsp";
				break;
			case "/doBoardWrite.do":
				boardService = new BInsertServiceImpl();
				boardService.execute(request, response);
				viewPage = "/board/flag.jsp";
				break;
			case "/boardDelete.do":
				boardService = new BDeleteServiceImpl();
				boardService.execute(request, response);
				viewPage = "/board/doBoardDelete.jsp";
				break;
			case "/boardUpdate.do":
				boardService = new BViewServiceImpl();
				boardService.execute(request, response);
				viewPage = "/board/boardUpdate.jsp";
				break;
			case "/doBoardUpdate.do":
				boardService = new BUpdateServiceImpl();
				boardService.execute(request, response);
				viewPage = "/board/doBoardUpdate.jsp";
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
