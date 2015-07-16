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
			<table style="background-color: #EBF4FB; top: auto;">
				<tr  style="vertical-align: top;">
					<th colspan="5"><legend>요약표</legend></th>
				</tr>
				<tr>
					<td><label class="label" for="name">일차</label></td>
					<td><label class="label" for="name">지역</label></td>
					<td><label class="label" for="name">일정</label></td>
					<td><label class="label" for="name">대표가격</label></td>
					<td><label class="label" for="name">상세보기</label></td>
				</tr>
				<c:forEach var="schot" items="${schot }">
					<tr>
						<td style="border-bottom:1px solid #B7DDF2;"><label class="label" for="name">${schot.dday }</label></td>
						<td style="border-bottom:1px solid #B7DDF2;"><label class="label" for="name">${schot.local }</label></td>
						<td style="border-bottom:1px solid #B7DDF2;"><label class="label" for="name">${schot.hotname }</label></td>
						<td style="border-bottom:1px solid #B7DDF2;"><label class="label" for="name">${schot.hotprice }</label></td>
						<td style="border-bottom:1px solid #B7DDF2;">
		   				 <a href="#" class="osx" style="text-decoration: none">클릭
						<input type="hidden" class="local" value="${schot.local }">
						<input type="hidden" class="hotname" value="${schot.hotname }">		
						</a></td>
					</tr>
				</c:forEach>	
			</table>
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
	 <div id="osx-modal-content" class="msg">
	 	<div id="osx-modal-title" ></div>
	 	<div class="close">
			<a href="#" class="simplemodal-close">x</a>
		</div>
	</div>
</body>
</html>