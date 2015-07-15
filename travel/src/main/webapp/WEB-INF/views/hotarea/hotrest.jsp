<%@ page contentType="text/html;charset=UTF-8" import="java.util.*,model.*"%>
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
<link rel="stylesheet" href="css/style.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/jquery.banner.js"></script>
<script src="js/script.js"></script>
<script type="text/javascript">
	$(function() {
		$('.osx').click(function() {
			var hotid = $(this).find(".hotid").val();
			var sendData = 'hotid=' + hotid;
			$.ajaxSetup({
				type : 'POST',
				url : 'hotajax.do',
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
			<td colspan="5">
				<div id="image_list_1">
		        	<div class="clsBannerScreen" style="width: 860px">
						<c:forEach var="hotimage" items="${hotimage }" begin="0" end="4">
							<div class="images" style="display:block">
							<img src="resources/upload/${hotimage.hotimage }" width="860px" height="600px">
						</div>
						</c:forEach>
					</div>
				</div>
			</td>
		</tr>
 		<tr style="vertical-align: top;">
		<%	int a=0;
				List<Hot> ha = (List<Hot>)request.getAttribute("hotrest");
				for(int i=0 ; i<ha.size(); i++ ){a++;
					%>
						<td class="form">
							<form action="#">
								<fieldset style="padding: 0px; ">
									<legend><a href href="#" class="osx"><%=a%>위<input type="hidden" class="hotid" value="<%= ha.get(i).getHotid() %>"></a></legend>
									<div class="elements1">
									<label class="label" for="name"><p><img src="resources/upload/<%= ha.get(i).getHotimage() %>" width="130" height="130"></label>
									<label class="label" for="name"><p><%=ha.get(i).getHotname()%></label>
									<label class="label" for="name"><p><%=ha.get(i).getLocal()%></label>
									</div>
								</fieldset>
							</form>
						</td>
					<%
						if((i+1)%4==0){
					%>
							</tr><tr>
					<%
							}
						}
					%>
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
	<div id="osx-modal-content" class="msg">
	 	<div  id="osx-modal-title" ></div>
	 	<div class="close">
			<a href="#" class="simplemodal-close">x</a>
		</div>
	</div>
</body>
</html>