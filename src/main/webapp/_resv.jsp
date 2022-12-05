<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.table{
		margin : auto;
	}
	.title{
		text-align : center;
	}
</style>
<script type="text/javascript">
	function checkVal(){
		if(!document.data.resvno.value){
			alert("예약번호를 입력하세요");
			document.data.resvno.focus();
			return false;
		}else if(!document.data.jumin.value){
			alert("주민번호를 입력하세요");
			document.data.jumin.focus();
			return false;
		}else if(!document.data.vcode.value){
			alert("백신번호를 입력하세요");
			document.data.vcode.focus();
			return false;
		}else if(!document.data.hospcode.value){
			alert("병원코드를 입력하세요");
			document.data.hospcode.focus();
			return false;
		}else if(!document.data.resvdate.value){
			alert("예약날짜를 입력하세요");
			document.data.resvdate.focus();
			return false;
		}else if(!document.data.resvtime.value){
			alert("예약시간을 입력하세요");
			document.data.resvtime.focus();
			return false;
		}else{
			document.getElementById("data").submit();
		}
	}
	function cancel(){
		document.data.resvno.value = "";
		document.data.jumin.value = "";
		document.data.vcode.value = "";
		document.data.hospcode.value = "";
		document.data.resvdate.value = "";
		document.data.resvtime.value = "";
		
		alert("예약등록을 취소했습니다.");
		document.data.resvno.focus();
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="section">
		<h3 class="title">백신 예약</h3>
		<form id="data" name="data" method="post" action="_resvPro.jsp" onsubmit="return false">
			<table class="table" border="1">
				<tr>
					<td>예약번호</td>
					<td>
						<input type="text" name="resvno">
						예)20210011
					</td>
				</tr>
				<tr>
					<td>주민번호</td>
					<td>
						<input type="text" name="jumin">
						예)790101-1111111
					</td>
				</tr>
				<tr>
					<td>백신코드</td>
					<td>
						<input type="text" name="vcode">
						예)V001, V002, V003
					</td>
				</tr>
				<tr>
					<td>병원코드</td>
					<td>
						<input type="text" name="hospcode">
						예)H001, H002, H003, H004
					</td>
				</tr>
				<tr>
					<td>예약날짜</td>
					<td>
						<input type="text" name="resvdate">
						예)20210101
					</td>
				</tr>
				<tr>
					<td>예약시간</td>
					<td>
						<input type="text" name="resvtime">
						예)0930, 1130
					</td>
				</tr>
				
				<tr>
					<td align="center" colspan="2">
						<button onclick="checkVal()">등록</button>
						<button onclick="cancel()">취소</button>
					</td>
				</tr>
			</table>
		
		</form>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>