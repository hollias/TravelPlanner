<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<table border="1">
		<tr>
			<td colspan="5">
				<div id="image_list_1">
					<div class="clsBannerScreen">
						<c:forEach var="htstay" items="${htstay }" begin="0" end="4">
							<div class="images" style="display:block">
								<img src="resources/upload/${htstay.hotimage }" width="650" height="400">
							</div>
						</c:forEach>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td><a href="hotmain.do">전체</a></td>
			<td><a href="htrest.do">맛집</a></td>
			<td><a href="httourist.do">관광지</a></td>
			<td><a href="htstay.do">숙소</a></td>
		</tr>
		<tr>
			<td align="right" colspan="5"><a href="hotwrite.do">내가스팟등록하기</a></td>
		</tr>
 		<tr>
		<%	int a=0;
				List<Hot> ha = (List<Hot>)request.getAttribute("htstay");
				for(int i=0 ; i<ha.size();i++ ){a++;
					%>
						<td>
							<table border="1">
								<tr><td><a href href="#" class="osx">
								<img src="resources/upload/<%= ha.get(i).getHotimage() %>" width="150" height="150">
								<input type="hidden" class="hotid" value="<%= ha.get(i).getHotid() %>">
								</a></td></tr>
								<tr><td><%=a%>위. <%=ha.get(i).getHotname()%></td></tr>
							</table>
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