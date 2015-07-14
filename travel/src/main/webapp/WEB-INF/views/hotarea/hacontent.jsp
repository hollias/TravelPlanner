<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/jquery.banner.js"></script>
<script src="js/script.js"></script>
</head>
<body>
	<table border="1">
		<tr>
			<td>
				<table border="1">
					<tr><td><h2>일정표</h2></td></tr>
					<tr><td><a href="schedule.do?plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">요약표</a></td></tr>
					<tr><td><a href="sccal.do?plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">달력</a></td></tr>
				</table>
			</td>
			<td rowspan="2" style="width:750px; height:750px">
				<table border="1">
					<tr>
						<td colspan="6">
							<div id="image_list_1">
						        <div class="clsBannerScreen">
						        	<c:forEach var="hotimage" items="${hotimage }" begin="0" end="4">
						            <div class="images" style="display:block">
						                <img src="resources/upload/${hotimage.hotimage }" width="650" height="400">
						            </div>
						            </c:forEach>
						        </div>
							</div>
						</td>
					</tr>
					<tr>
						<td><a href="hacontent.do?local=${areaOne.local }&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">지역설명</a></td>
						<td><a href="hotrest.do?local=${areaOne.local }&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">맛집</a></td>
						<td><a href="hottourist.do?local=${areaOne.local }&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">관광지</a></td>
						<td><a href="hotstay.do?local=${areaOne.local }&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">숙소</a></td>
						<td>지도</td>
					</tr>
					<tr>
						<td align="right" colspan="5"><a href="hotwrite.do">내가스팟등록하기</a></td>
					</tr>
					<tr>
						<td width="100%">${areaOne.local }</td>
					</tr>
					<tr>
						<td width="100%"><img src="images/${areaOne.areaimage }"></td>
					</tr>
					<tr>
						<td width="100%">${areaOne.localcontent }</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1">
					<tr><td><h3>가이드북/지도</h3></td></tr>
 					<c:forEach var="calendar" items="${calendar }">
					<tr><td><a href="hotarea.do?local=${calendar.local}&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">${calendar.local}</a></td></tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>