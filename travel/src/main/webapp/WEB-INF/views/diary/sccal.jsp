<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<td rowspan="2">
				<div id="calendar"></div>
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