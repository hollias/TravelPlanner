<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../mainHeader.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--/HGROUP-->	
		<c:choose>
			<c:when test="${not empty message }">
				<script type="text/javascript">alert("${message}");</script>
			</c:when>
		</c:choose>
<form action="pwFind.do" method="post">
		<div align="center">
			<ul>
				<li>이름을 입력하세요<input type="text" name="membername"></li>
				<li>Email을 입력하세요<input type="email" name="email"></li>
				<li>연락처를 입력하세요<input type="text" name="phone" ></li>
				<li><input type="submit" value="비밀번호 찻기">
				<input type="reset" value="취소"></li>
			</ul>
		</div>
	</form>
</body>
</html>