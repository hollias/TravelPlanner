<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="../header.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../mainHeader.jsp" %>
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#aa').click(function() {
			var plannerid = $('.plannerid').val();
			var plannername = $('.plannername').val();
			var sendData = 'plannerid=' + plannerid + '&plannername=' + plannername;
			$.ajaxSetup({
				type : 'POST',
				url : 'diarycheck.do',
				dataType : 'text',
				success : function(msg) {
					$('#msg').html(msg);
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
<form action="#" class="registration_form" style="margin: 0px; padding: 0px;">
	<fieldset style="margin-left: 70px; width: 1080px;">
		<legend>현재플래너</legend>
		<a href="home.do?plannername=${ plannerOne.plannername}&plannerid=${plannerOne.plannerid}">
			<table>
				<tr>
					<td rowspan="2">
						<iframe src="diaryMap.do?plannername=${plannerName.plannername}" class="iframe"></iframe>
					</td>
					<td>
						<p style="font-size: 35px;">제목 :  ${plannerOne.plannername }</p>
					</td>
				</tr> 
				<tr>
					<td>
						<table>
							<tr>
								<td>
									<p style="font-size: 25px;">경로  : </p>
								</td>
								<c:forEach var="diary" items="${diary }">
								<td><p style="font-size: 25px;">${diary.local } -></p></td>
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
</form>
<form action="#" class="registration_form" style="margin-left: 70px;">
	<div id="aa"><legend>지난플래너</legend>
	<c:forEach var="list" items="${list }">
	<input type="hidden" class="plannerid" value="${list.plannerid }">
	<input type="hidden" class="plannername" value="${list.plannername }">
	</c:forEach>
</div>
</form>
<div id="msg"></div>
</body>
</html>