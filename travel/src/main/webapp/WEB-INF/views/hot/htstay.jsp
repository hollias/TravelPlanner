<%@ page contentType="text/html;charset=UTF-8" import="java.util.*,model.*"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../mainHeader.jsp" %>
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
			<li><a href="hotmain.do">전체</a></li>
			<li><a href="htrest.do">맛집</a></li>
			<li><a href="httourist.do">관광지</a></li>
			<li><a href="htstay.do">숙소</a></li>
			<li><a href="hotwrite.do">내가스팟등록하기</a></li>
		</ul>
	</div>
	<table style="width: 1092; margin-left: 74px;"> 
		<tr>
			<td colspan="5">
				<div id="image_list_1">
		        	<div class="clsBannerScreen" style="width: 1092px">
						<c:forEach var="htstay" items="${htstay }" begin="0" end="4">
							<div class="images" style="display:block">
							<img src="resources/upload/${htstay.hotimage }" width="1092px" height="600px">
						</div>
						</c:forEach>
					</div>
				</div>
			</td>
		</tr>
 		<tr>
		<%	int a=0;
				List<Hot> ha = (List<Hot>)request.getAttribute("htstay");
				for(int i=0 ; i<ha.size(); i++ ){a++;
					%>
						<td>
							<form action="#" >
								<fieldset>
									<legend><a href href="#" class="osx"><%=a%>위<input type="hidden" class="hotid" value="<%= ha.get(i).getHotid() %>"></a></legend>
									<div class="elements1">
									<label class="label" for="name"><p><img src="resources/upload/<%= ha.get(i).getHotimage() %>" width="150" height="150"></label>
									<label class="label" for="name"><p><%=ha.get(i).getHotname()%></label>
									<label class="label" for="name"><p><%=ha.get(i).getLocal()%></label>
									</div>
								</fieldset>
							</form>
						</td>
					<%
						if((i+1)%5==0){
					%>
							</tr><tr>
					<%
							}
						}
					%>
</table>
<div id="osx-modal-content" class="msg">
	<div  id="osx-modal-title" ></div>
	<div class="close">
		<a href="#" class="simplemodal-close">x</a>
	</div>
</div>
</body>
</html>