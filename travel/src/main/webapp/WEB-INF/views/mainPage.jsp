<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
		<ul>
			<li><%@include file="mainBanner.jsp"%></li>
		</ul>
	</div>
	<div align="center" style="font-size: 20px;">
	=============================새로 만들어진 플레너=============================</div>
	<table style="height: 300">
		<tr>
		<c:forEach var="pl" items="${pl }">
			<td style=" width: 300; height:300;margin-top:0; ">
			<a href="planul.do">
			<h2>제목 : ${pl.getPlannername()}</h2>
			<iframe src="introMap.do?plannername=${pl.getPlannername()}" >
			</iframe><b>
			이거슨 플레너</b></a>
				</td>
			</c:forEach>
			</tr>
	</table>
</body>
</html>