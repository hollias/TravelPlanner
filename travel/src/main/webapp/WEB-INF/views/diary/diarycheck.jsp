<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="list" items="${list }">
	<form action="#" class="registration_form" style="margin: 0px; padding: 0px;">
	<fieldset style="margin-left: 70px; width: 1080px;">
		<a href="home.do?plannername=${list.plannername }&plannerid=${list.plannerid}">
			<table>
				<tr>
					<td rowspan="2">
						<iframe src="diaryMap.do?plannername=${list.plannername}" class="iframe"></iframe>
					</td>
					<td>
						<p style="font-size: 35px;">제목 :  ${list.plannername }</p>
					</td>
				</tr> 
				<tr>
					<td>
						<table>
							<tr>
								<td>
									<p style="font-size: 25px;">경로  : </p>
								</td>
								<c:forEach var="diarycheck" items="${diarycheck }">
								<td><p style="font-size: 25px;">${diarycheck.local } -></p></td>
								</c:forEach>
								<td>
									<p style="font-size: 25px;">끝</p>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table></a>
	</fieldset>
	</c:forEach>
</form>
</body>
</html>
	
			