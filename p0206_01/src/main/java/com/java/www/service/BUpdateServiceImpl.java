package com.java.www.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.www.dao.BoardDao;

public class BUpdateServiceImpl implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {e.printStackTrace();}
		BoardDao bdao = new BoardDao();
		int bno = Integer.parseInt(request.getParameter("bno"));
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		System.out.println(id+" "+btitle+" "+bcontent);
		request.setAttribute("bno", bno);
		request.setAttribute("flag", bdao.boardUpdate(bno, btitle, bcontent, id));		//업데이트 행개수
	}

}
