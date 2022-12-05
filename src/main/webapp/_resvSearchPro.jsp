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
		
		String resvno = request.getParameter("resvno");
		
		String sql = "select v.resvno, j.name, j.jumin, h.hospname, v.resvdate, v.resvtime, v.vcode, h.hospaddr";
		sql += " from tbl_jumin_202108 j, tbl_hosp_202108 h, tbl_vaccresv_202108 v";
		sql += " where j.jumin=v.jumin and h.hospcode=v.hospcode and v.resvno="+resvno;
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()){
			String[] data = new String[8];
			data[0] = rs.getString(1);
			data[1] = rs.getString(2);
			data[2] = rs.getString(3);
			data[3] = rs.getString(4);
			data[4] = rs.getString(5);
			data[5] = rs.getString(6);
			data[6] = rs.getString(7);
			data[7] = rs.getString(8);
			list.add(data);
		}
		
		con.close();
		ps.close();
		rs.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.table{
		margin : auto;
	}
	.section{
		text-align : center;
	}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="section">
		<h3>백신예약현황</h3>
		<table class="table" border="1">
			<tr>
				<td>예약번호</td>
				<td>성명</td>
				<td>성별</td>
				<td>병원이름</td>
				<td>예약날짜</td>
				<td>예약시간</td>
				<td>백신코드</td>
				<td>병원지역</td>
			</tr>
			<%
				for(int i = 0; i < list.size(); i++){
			%>
			<tr>
				<td align="center"><%=list.get(i)[0] %></td>
				<td align="center"><%=list.get(i)[1] %></td>
				<td align="center"><%=list.get(i)[2] %></td>
				<td align="center"><%=list.get(i)[3] %></td>
				<td align="center"><%=list.get(i)[4] %></td>
				<td align="center"><%=list.get(i)[5] %></td>
				<td align="center"><%=list.get(i)[6] %></td>
				<td align="center"><%=list.get(i)[7] %></td>
			</tr>
			
			<%} %>
		</table>
			<button onclick="location.href='_resvSearch.jsp'">돌아가기</button>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>