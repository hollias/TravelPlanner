<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../mainHeader.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="wrap">
	<!--/HGROUP-->
	<c:choose>
		<c:when test="${not empty message }">
			<script type="text/javascript">
				alert("${message}");
			</script>
		</c:when>
	</c:choose>
<div align="center">
	<form action="idFind.do" method="post" name="form">
		<table class="write_table" style="margin-left: 52px;">
			<caption class="skip">아이디찾기</caption>
			<tr>
				<th scope="row">이름을 입력하세요</th>
				<td><input type="text" name="membername"></td>
			</tr>
			<tr>
				<th scope="row">Email을 입력하세요</th>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td align="right" colspan="2"><input type="submit" value="id 찻기"></td>
			</tr>
		</table>
	</form>
</section>
</div>
</body>
</html>