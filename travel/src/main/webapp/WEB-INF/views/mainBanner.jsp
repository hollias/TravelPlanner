<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
    <!--jQuery 라이브러리 추가-->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!--jQuery 플러그인 추가-->
<script src="js/jquery.banner.js"></script>
<!--jQuery 플러그인 옵션 설정 추가-->
<script src="js/script.js"></script>
<link type="text/css" href="css/osx.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.simplemodal.js"></script>
<script type="text/javascript" src="js/osx.js"></script>
<title>Insert title here</title>
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
<div align="center">
		<ul style="padding-right: 35px; padding-left: 0px;">
			<li>
			<div id="image_list_2" >
		        <div class="clsBannerScreen" >
		           <c:forEach var="hotlist" items="${hotlist }" begin="0" end="4">
						<div class="images" style="display:block">
							<img src="resources/upload/${hotlist.hotimage }" width="1102" height="600">
						</div>
					</c:forEach>
		        </div>
		        <ul class="clsBannerButton" id="label_2">
		            <c:forEach var="hotlist" items="${hotlist }" begin="0" end="4">
						<li class="fir" style="margin-left: auto;"><a href="#" class="osx" id="home">${hotlist.hotname }<input type="hidden" class="hotid" value="${hotlist.hotid }"></a></li>
					</c:forEach>
		        </ul>
			</div>     
			    <p>&nbsp;</p>
		  	    <p>&nbsp;</p>
		</li>
		</ul>
</div>
<div id="osx-modal-content" class="msg">
	<div  id="osx-modal-title" ></div>
	<div class="close">
		<a href="#" class="simplemodal-close">x</a>
	</div>
</div>
</body>
</html>