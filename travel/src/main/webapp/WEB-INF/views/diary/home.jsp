<%@ page contentType="text/html;charset=UTF-8" import="java.util.*,model.*"%>
<%@include file="../header.jsp"%>
<%@include file="../mainHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="js/fullcalendar.css" rel="stylesheet" type="text/css">
<link href="js/fullcalendar.print.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.11.custom.min.js"></script>
<script type="text/javascript" src="js/fullcalendar.min.js"></script>
<%
   List<PlannerS> cal = (List<PlannerS>)request.getAttribute("calendar");
   PlannerS[] pl = new PlannerS[cal.size()];
   for(int i = 0; i < cal.size() ; i++ ) {
      pl[i] = cal.get(i);
   }
%>   
<script type="text/javascript">
	$(document).ready(function() {

		var date = new Date();
		var y = date.getFullYear();

		
		$('#calendar').fullCalendar ({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month'
			},
			editable : false,
			events:[
					<%for(int i = 0 ; i < cal.size() ; i++){%>
					   {
					     title : '<%=pl[i].getLocal()%>',
					     start : new Date(y, <%=pl[i].getMm()%>-1, <%=pl[i].getDd()%>),
					     end : new Date(y, <%=pl[i].getMm()%>-1, <%=pl[i].getDd()%>+<%=pl[i].getDay()%>)
					    },<%}%>
			       ]   
		});
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="1100px" style="margin-left: 72px">
		<tr>
			<td align="center">
				<legend style="font-size: 30px; width: 1085px">플래너 : ${plannerName.plannername }</legend>
			</td>
		</tr>
	</table>
	
	<table width="1100px" style="margin-left: 72px">
		<tr>
			<td>
				<form action="#" class="registration_form" style="margin: 0px; padding: 0px;">
					<fieldset>
					<legend>지도</legend>
					<iframe src="diaryMap.do?plannername=${plannerName.plannername }&memberid=${memberid}" class="iframe"></iframe>
					</fieldset>
				</form>
			</td>
			<td>
				<form action="#" class="registration_form" style="">
					<fieldset style="width:500px; height: 300px;">
					<legend><a href="schedule.do?plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}" class="schedule">예약정보</a></legend>
					<div class="elements">
						<label class="label" for="name">음식점가격</label>
						<label class="label" for="name">${restaurant.hotprice } 원</label>
					</div>
					<div class="elements">
						<label class="label" for="name">관광지</label>
						<label class="label" for="name">${tourist.hotprice } 원</label>
					</div>
					<div class="elements">
						<label class="label" for="name">숙소</label>
						<label class="label" for="name">${stay.hotprice } 원</label>
					</div>
						<div class="elements">
						<label class="label" for="name">총비용</label>
						<label class="label" for="name">${total.hotprice } 원</label>
					</div>
					</fieldset>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<form action="#" class="calendar_form">
					<fieldset class="calendar">
						<legend><a href="sccal.do?plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}" class="schedule">달력보기</a></legend>
						<div id="calendar" ></div>
					</fieldset>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>