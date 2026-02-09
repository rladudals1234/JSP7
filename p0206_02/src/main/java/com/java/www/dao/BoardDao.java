package com.java.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
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
	private int bno,bgroup,bstep,bindent,bhit;
	private String btitle,bcontent,id,bfile;
	private Timestamp bdate;
	List<BoardDto> list;
	BoardDto bdto;
	
	//생성자
	public BoardDao() {}
	
	Connection getConnection() throws Exception{
		Connection connection = null;
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle21");
			connection = dataSource.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	//게시판 전체리스트
	public List<BoardDto> selectAll(int page) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try {
			conn = getConnection();
			query = "select bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate "
					+ ",count(*) over() as total_cnt "
					+ "from board order by bno desc "
					+ "OFFSET (?*0) ROWS FETCH NEXT 10 ROWS ONLY ";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, page);
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
	
	public BoardDto selectOne(int bno) {
		bdto = null;
		try {
			conn = getConnection();
			query = "select bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate "
					+ "from board "
					+ "where bno=? "
					+ "OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY ";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bno);
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
				bdto = new BoardDto(bno,bgroup,bstep,bindent,bhit,btitle,bcontent,id,bfile,bdate);
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
		return bdto;
	}
	
	public int boardInsert(String btitle, String bcontent, String id, String bfile) {
		int resultCnt = 0;
		try {
			conn = getConnection();
			//query = "insert into board(bno, btitle, bcontent, id, bfile) values(board_seq.nextval,?,?,?,?)";
			query = "insert into board(bno, btitle, bcontent, id) values(board_seq.nextval,?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, btitle);
			pstmt.setString(2, bcontent);
			pstmt.setString(3, id);
			//pstmt.setString(4, bfile);
			resultCnt = pstmt.executeUpdate();	//insert, update, delete -> executeUpdate
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
		return resultCnt;
	}

	public int boardDelete(int bno) {
		int resultCnt = 0;
		try {
			conn = getConnection();
			query = "delete from board where bno = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bno);
			resultCnt = pstmt.executeUpdate();	//insert, update, delete -> executeUpdate
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
		return resultCnt;
	}

	public int boardUpdate(int bno, String btitle, String bcontent, String id) {
		int resultCnt = 0;
		try {
			conn = getConnection();
			query = "update board set btitle=?, bcontent=?, id=?, bdate=sysdate where bno = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, btitle);
			pstmt.setString(2, bcontent);
			pstmt.setString(3, id);
			pstmt.setInt(4, bno);
			resultCnt = pstmt.executeUpdate();	//insert, update, delete -> executeUpdate
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
		return resultCnt;
	}
}
