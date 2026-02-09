package com.java.www.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.www.dao.MemberDao;
import com.java.www.dto.MemberDto;

public class MLoginServiceImpl implements MemberService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDao mdao = new MemberDao();
		request.setAttribute("mdto", mdao.memberLogin(id, pw));	//서버에서 에러메세지 내려줄지 클라이언트에서 내려줄지
	}

}
