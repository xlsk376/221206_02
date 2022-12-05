<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<String[]> list = new ArrayList<>();
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		System.out.println("DB");
		
		String sql = "select resvno from tbl_vaccresv_202108";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()){
			String[] data = new String[3];
			data[0] = rs.getString(1);
			list.add(data);
		}
		
		request.setCharacterEncoding("utf-8");
		
		String resvno = request.getParameter("resvno");
		boolean check = false;
		for(int i = 0; i < list.size(); i++){
			if(resvno.equals(list.get(i)[0])){
				check = true;
				break;
			}
		}
		if(check){
			response.sendRedirect("_resvSearchPro.jsp?resvno="+resvno);
		}else{
			response.sendRedirect("_no.jsp?resvno="+resvno);
		}
		System.out.println(resvno);
		con.close();
		ps.close();
		rs.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>
