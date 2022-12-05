<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
		String resvno = request.getParameter("resvno");
	System.out.println(resvno);
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
		예약번호 <%=resvno %> 로 조회된 결과가 없습니다.<br>
		<br>
		<button onclick="location.href='index.jsp'">홈으로</button>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>