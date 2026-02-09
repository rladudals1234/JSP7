package com.java.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.java.www.dto.MemberDto;

public class MemberDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DataSource dataSource = null;
	String query="";
	//dto에 맞는 변수
	String id="",pw="",name="",phone="",email="",gender="",hobby="";
	List<MemberDto> list = new ArrayList<MemberDto>();
	MemberDto mdto = null;
	
	//생성자
	public MemberDao() {}
	
	Connection getConnection() throws Exception{
		Connection connection = null;
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle21");
			connection = dataSource.getConnection();
		}catch (Exception e) {e.printStackTrace();}
		return connection;
	}
	
	public MemberDto memberLogin(String id, String pw) {
		try {
			conn = getConnection();
			query = "select * from member where id=? and pw=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			while(rs.next()){
				id = rs.getString("id");
				pw = rs.getString("pw");
				name = rs.getString("name");
				phone = rs.getString("phone");
				email = rs.getString("email");
				gender = rs.getString("gender");
				hobby = rs.getString("hobby");
				mdto = new MemberDto(id,pw,name,phone,email,gender,hobby);
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
		return mdto;
	}
	
	//회원전체리스트 메소드 선언
	public List<MemberDto> selectAll() {
		try {
			conn = getConnection();
			query = "select * from member";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()){
				id = rs.getString("id");
				pw = rs.getString("pw");
				name = rs.getString("name");
				phone = rs.getString("phone");
				email = rs.getString("email");
				gender = rs.getString("gender");
				hobby = rs.getString("hobby");
				list.add(new MemberDto(id,pw,name,phone,email,gender,hobby));
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
	
	public int memberInsert(String id, String pw, String name, String phone, String email, String gender, String[] hobby) {
		int resultCnt = 0;
		try {
			conn = getConnection();
			query = "insert into member(id, pw, name, phone, email, gender, hobby) values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, phone);
			pstmt.setString(5, email);
			pstmt.setString(6, gender);
			pstmt.setString(7, Arrays.toString(hobby));
			resultCnt = pstmt.executeUpdate();
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
