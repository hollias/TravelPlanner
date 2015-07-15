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
	<table id="stable" border="1">	
	<tr>
		<td><img alt="" src="resources/upload/${list.hotimage }" width="100"></td><td>${list.hotname }</td>
		<td><input type="hidden" id="local" value="${list.scheduleid }">
		<input type="button" value="취소" onclick="cancel(this)"></td></tr>	
	</table>
	</c:forEach>
</body>
</html>