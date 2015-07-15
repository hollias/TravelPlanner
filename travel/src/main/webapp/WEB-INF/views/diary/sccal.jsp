<%@ page contentType="text/html;charset=UTF-8" import="java.util.*,model.*"%>
<%@include file="../header.jsp"%>
<%@include file="../mainHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
				
				<form action="#" style="width: 865px;">
					<fieldset>
						<legend>달력</legend>
						<div id="calendar" ></div>
					</fieldset>
				</form>
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