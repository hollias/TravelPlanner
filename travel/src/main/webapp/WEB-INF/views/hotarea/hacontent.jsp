<%@ page contentType="text/html;charset=UTF-8" import="java.util.*,model.*"%>
<%@include file="../header.jsp"%>
<%@include file="../mainHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/jquery.banner.js"></script>
<script src="js/script.js"></script>
</head>
<body>
	<div id="hotmenu" style="margin-left: 74px;">
		<ul>
			<li style="margin-left :14px;"><a href="hacontent.do?local=${areaOne.local }&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">지역설명</a></li>
			<li style="margin-left :14px;"><a href="hotrest.do?local=${areaOne.local }&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">맛집</a></li>
			<li style="margin-left :14px;"><a href="hottourist.do?local=${areaOne.local }&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">관광지</a></li>
			<li style="margin-left :14px;"><a href="hotstay.do?local=${areaOne.local }&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">숙소</a></li>
			<li style="margin-left :14px;"><a href="hotmap.do?local=${areaOne.local }&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">지도</a></li>
			<li style="margin-left :14px;"><a href="hotwrite.do">내가스팟등록하기</a></li>
		</ul>
	</div>
	<table style="margin-left: 70px;">
		<tr style="vertical-align: top;">
			<td>
				<form action="#" >
					<fieldset>
						<legend>일정표</legend>
						<div class="elements">
						<label class="label" for="name"><a href="schedule.do?plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}" class="home"><p>요약표</a></label>
						<label class="label" for="name"><a href="sccal.do?plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}" class="home"><p>달력</a></label>
						</div>
					</fieldset>
				</form>
			</td>
			<td rowspan="2">
					
	<table style="width: 1092;"> 
 		<tr style="vertical-align: top;">
			<td>
			<form action="#" style="width: 880px;">
					<fieldset>
						<legend>${areaOne.local }</legend>
						<label class="label" for="name"><p style="width: 860px;"><img src="images/cc.jpg<%-- ${areaOne.areaimage } --%>" width="850px" height="500"></label>
						<label class="label" for="name"><p style="width: 860px;">${areaOne.localcontent }</label>
					</fieldset>
			</form>
			</td>
		</table>
			</td>
		</tr>
		<tr style="vertical-align: top;">
			<td>
				<form action="#" class="calendar_form">
					<fieldset>
						<legend>가이드북</legend>
						<div class="elements1">
						<c:forEach var="calendar" items="${calendar }">
						<label class="label" for="name"><a href="hotarea.do?local=${calendar.local}&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}" class="home"><p>${calendar.local }</a></label>
						</c:forEach>
						</div>
					</fieldset>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>