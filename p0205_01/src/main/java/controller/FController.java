package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.Member;

/**
 * Servlet implementation class FController
 */
@WebServlet("/FController")
public class FController extends HttpServlet {
    
    protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("FController doAction");
		List<Member> list = new ArrayList<Member>();	//접근제어자 설정안하면 default로 설정되어 에러발생 public 붙일것
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
		String id="",pw="",name="",phone="",email="",gender="",hobby="";
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Oracle21");
			conn = ds.getConnection();
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
				list.add(new Member(id,pw,name,phone,email,gender,hobby));
			}
			request.setAttribute("list", list);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//request.setAttribute("list", list);
		//response.sendRedirect("./j02.jsp");
		RequestDispatcher dispatcher = request.getRequestDispatcher("./j02.jsp");
		dispatcher.forward(request,response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}

}
