package com.java.www.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.dao.MemberDao;
import com.java.www.dto.MemberDto;

public class MemberList implements MemberService {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//List<MemberDto> list = new ArrayList<MemberDto>();
		//list.add(new MemberDto("aaa","1111","홍길동","010-1111-1111","aaa@naver.com","남자","게임"));
		//list.add(new MemberDto("bbb","222","유관순","010-2222-2222","bbb@naver.com","여자","골프"));
		//request.setAttribute("list", list);	//참조변수라 리턴할 필요없음
		
		//List<MemberDto> list = new ArrayList<MemberDto>();
		MemberDao mdao = new MemberDao();
		List<MemberDto> list = mdao.memberList();
		//list = mdao.memberList();
		request.setAttribute("list", list);
	}
}
