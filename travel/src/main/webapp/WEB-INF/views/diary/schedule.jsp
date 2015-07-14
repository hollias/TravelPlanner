<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../header.jsp"%>
<%@include file="../mainHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" href="css/osx.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.simplemodal.js"></script>
<script type="text/javascript" src="js/osx.js"></script>
<script type="text/javascript">
	$(function() {
		$('.osx').click(function() {
			var local = $(this).find(".local").val();
			var hotname = $(this).find(".hotname").val();
			var sendData = 'local=' + local + '&hotname=' + hotname;
			$.ajaxSetup({
				type : 'POST',
				url : 'schot.do',
				dataType : 'html',
				success : function(msg) {
					$('.msg').html(msg).model();
				}
			});
			$.ajax({
				data : sendData
			});
		});
	});
</script>

</head>
<body>
	<table border="1">
		<tr>
			<td>
				<form action="#" class="calendar_form">
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
			<table border="1">
				<tr>
					<th colspan="5"><h2>일정표</h2></th>
				</tr>
				<tr>
					<td>일차</td>
					<td>지역</td>
					<td>일정</td>
					<td>대표가격</td>
					<td>상세보기</td>
				</tr>
				<c:forEach var="schot" items="${schot }">
					<tr>
						<td>${schot.dday }</td>
						<td>${schot.local }</td>
						<td>${schot.hotname }</td>
						<td>${schot.hotprice }</td>
						<td>
		   				 <a href="#" class="osx">클릭
						<input type="hidden" class="local" value="${schot.local }">
						<input type="hidden" class="hotname" value="${schot.hotname }">		
						</a></td>
					</tr>
				</c:forEach>	
			</table>
		</tr>
		<tr>
			<td>
<%-- 				<table border="1">
					<tr><td><h3>가이드북/지도</h3></td></tr>
					<c:forEach var="calendar" items="${calendar }">
					<tr><td><a href="hotarea.do?local=${calendar.local}&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">${calendar.local }</a></td></tr>
					</c:forEach>
				</table> --%>
				<form action="#" class="calendar_form">
					<fieldset>
						<legend>가이드북</legend>
						<div class="elements">
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
	 <div id="osx-modal-content" class="msg">
	 	<div  id="osx-modal-title" ></div>
	 	<div class="close">
			<a href="#" class="simplemodal-close">x</a>
		</div>
	</div>
</body>
</html>