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
		
		String sql = "select h.hospaddr, count(v.hospcode) from tbl_hosp_202108 h, tbl_vaccresv_202108 v";
		sql += " where h.hospcode=v.hospcode(+)";
		sql += " group by h.hospaddr";
		sql += " order by h.hospaddr";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()){
			String[] data = new String[3];
			String num = rs.getString(1);
			data[0] = num;
			if(num.equals("10")){
				data[1] = "서울";
			}else if(num.equals("20")){
				data[1] = "대전";
			}else if(num.equals("30")){
				data[1] = "대구";
			}else if(num.equals("40")){
				data[1] = "광주";
			}
			data[2] = rs.getString(2);
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
				<td>병원지역</td>
				<td>병원지역명</td>
				<td>접종예약건수</td>
			</tr>
			<%
				for(int i = 0; i < list.size(); i++){
			%>
			<tr>
				<td align="center"><%=list.get(i)[0] %></td>
				<td align="center"><%=list.get(i)[1] %></td>
				<td align="center"><%=list.get(i)[2] %></td>
			</tr>
			<%} %>
			<%
				int num = 0;
				for(int i = 0; i < list.size(); i++){
					num += Integer.parseInt(list.get(i)[2]);
			%>
			
			<%} %>
			<tr>
				<td colspan="2">총합</td>
				<td><%=num %></td>
			</tr>
		</table>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>