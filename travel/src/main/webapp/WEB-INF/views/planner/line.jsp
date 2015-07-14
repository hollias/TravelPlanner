<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


</script>
</head>
<body>
	<c:forEach var="list" items="${list }">
	<table id="local" border="1">
	<tr><td><div id="itemlineorder">${list.lineorder }</div></td></tr>
	<tr><td><input type="hidden" id="local" value="${list.local }">${list.local }</td>
		<td> <select name="day"><option value="1">1박</option><option value="2">2박</option><option value="3">3박</option><option value="4">4박</option><option value="5">5박</option></select></td>
		<td><input type="button" value="취소" onclick="cancel(this)"></td></tr>
	<tr><td colspan="2">기차시간</td><td><input type="button" value="상세보기" onclick="detail(this)"></td></tr>
	<tr><td colspan="2">다음추천여행지</td><td></td></tr>
	</table>
	</c:forEach>
</body>
</html>