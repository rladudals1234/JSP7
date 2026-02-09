package com.java.www.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.www.dao.BoardDao;

public class BInsertServiceImpl implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {e.printStackTrace();}
		BoardDao bdao = new BoardDao();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		
		System.out.println(id+" "+btitle+" "+bcontent);
		//insert,update,delete -> return없음 / select -> return있음.
		//String bfile = request.getParameter("bfile");
		String bfile = "";
		request.setAttribute("flag", bdao.boardInsert(btitle, bcontent, id, bfile));
	}

}
