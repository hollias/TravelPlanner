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
	<fieldset>
		<legend>${dday} 일차</legend>
	</fieldset>
	<c:forEach var="list1" items="${list }">
	<fieldset>
		<table> 
		<tr>
			<td rowspan="2" style="padding-right: 10px">
				<img src="resources/upload/${list1.hotimage }" width="100">
			</td>
			<td>
				<div class="ongoing">${list1.hotname }</div>
			</td>
			<td rowspan="2">
				<input type="hidden" id="sid" value="${list1.scheduleid }">        
				<input type="button" value="취소" onclick="cancel(this)">
			</td>
		</tr>
		<tr>
			<td>
				<div class="ongoing">${list1.hotprice }	</div>
			</td>
		</tr>
		<p></p>
		</table>
</fieldset>
</c:forEach>
</body>
</html>