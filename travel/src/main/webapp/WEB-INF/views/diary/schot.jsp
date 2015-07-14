<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="osx-modal-title">${hotone.hotname }</div>
	<div class="close">
		<a href="#" class="simplemodal-close">x</a>
	</div>
	<div id="osx-modal-data">
		<h2>이름 : ${hotone.hotname }</h2>
		<p>대표 가격: ${hotone.hotprice }</p>
		<p>${hotone.hotcontent}</p>
	</div>
</body>
</html>