package com.java.www.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.dao.BoardDao;

public class BListServiceImpl implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao bdao = new BoardDao();
		String paramPage = request.getParameter("page");
	    int page = (paramPage == null || paramPage.isEmpty()) ? 1 : Integer.parseInt(paramPage);
		request.setAttribute("list", bdao.selectAll(page));
	}

}
