<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	function check(){
		if(!document.data.resvno.value){
			alert("예약번호를 입력하세요");
			document.data.resvno.focus();
			return false;
		}else{
			document.getElementById("data").submit();
		}
	}
</script>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="section">
		<h3>백신예약조회</h3>
		<form id="data" name="data" method="post" action="check.jsp" onsubmit="return false">
			<table class="table" border="1">
				<tr>
					<td>예약번호</td>
					<td>
						<input type="text" name="resvno">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button onclick="check()">조회하기</button>
						<button onclick="location href=index.jsp">홈으로</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>