<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		System.out.println("DB");
		
		String sql = "insert into tbl_vaccresv_202108 values (?, ?, ?, ?, ?, ?)";		
		PreparedStatement ps = con.prepareStatement(sql);
		request.setCharacterEncoding("utf-8");
		
		String resvno = request.getParameter("resvno");
		String jumin = request.getParameter("jumin");
		String hospcode = request.getParameter("hospcode");
		String resvdate = request.getParameter("resvdate");
		String resvtime = request.getParameter("resvtime");
		String vcode = request.getParameter("vcode");
		
		ps.setString(1, resvno);
		ps.setString(2, jumin);
		ps.setString(3, hospcode);
		ps.setString(4, resvdate);
		ps.setString(5, resvtime);
		ps.setString(6, vcode);
		
		ps.executeUpdate();
		
		con.close();
		ps.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

		response.sendRedirect("index.jsp");

%>
