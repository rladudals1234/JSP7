package com.java.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.java.www.dto.BoardDto;

public class BoardDao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource dataSource;
	String query;
	private int bno,bgroup,bstep,bindent,bhit;		//String으로도 받을 수 있음
	private String btitle,bcontent,id,bfile;
	private Timestamp bdate;		//날짜+시간+밀리세컨드
	
	//생성자
	public BoardDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle21");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//회원전체리스트 메소드 선언
	public List<BoardDto> boardList() {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try {
			conn = dataSource.getConnection();
			query = "select * from board order by bno desc";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bno=rs.getInt("bno");
				btitle=rs.getString("btitle");
				bcontent=rs.getString("bcontent");
				id=rs.getString("id");
				bgroup=rs.getInt("bgroup");
				bstep=rs.getInt("bstep");
				bindent=rs.getInt("bindent");
				bhit=rs.getInt("bhit");
				bfile=rs.getString("bfile");
				bdate=rs.getTimestamp("bdate");
				list.add(new BoardDto(bno,bgroup,bstep,bindent,bhit,btitle,bcontent,id,bfile,bdate));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
