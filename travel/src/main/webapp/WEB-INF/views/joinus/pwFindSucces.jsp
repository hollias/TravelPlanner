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
<table>
<tr>
	<td align="center" style="padding: 100 0 100 0;font-size: 30px">회원님의 아이디는 : [ ${member.memberid } ] 이고</td></tr>
<tr>
<td align="center" style="padding: 100 0 100 0;font-size: 30px">회원님의 비밀번호는 : [ ${member.password } ] 입니다</td></tr>
<tr>
	<td><a href="login.do"><button type="button" >로그인하기</td></a>
</table>

</body>
</html>