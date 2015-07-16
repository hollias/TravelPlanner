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
<c:forEach var="item" items="${list }">
	<fieldset>
		<div id="itemlineorder">${item.lineorder }</div>
		<legend>${item.local }</legend>
		<table>
			<tr><td><input type="hidden" id="local" value="${item.local }" class="ongoing">
			<label class="ongoing" for="name">${item.local }</label></td>
			<td>
				<select name="day" class="ongoing">
					<option value="1">1박</option>
		            <option value="2">2박</option>
		            <option value="3">3박</option>
		            <option value="4">4박</option>
		            <option value="5">5박</option>
			     </select>
			</td>
			<td rowspan="2"><input type="button" value="취소" onclick="cancel(this)" ></td></tr>
			<tr><td class="ongoing">다음추천여행지</td><td class="ongoing">${nextArea }</td></tr>
		</table>
	</fieldset>
</c:forEach>
</body>
</html>