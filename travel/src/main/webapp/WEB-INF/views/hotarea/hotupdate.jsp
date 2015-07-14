<%@page import="model.Hot"%>
<%@page import="model.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
<%@include file="../mainHeader.jsp" %>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<style type="text/css"> 

	.contents-wrap{margin:30px 0 0 0;min-height: 500px;}
	.contents{ margin: 60px 0 0 0;}
	.recode-wrap{text-align: right; color: #888;}
	.hit-wrap{color:#888; margin: 10px 0;}
	.viewForm{margin: 20px 0 0 0;}
</style>
</head>

<body>
	<div class="container" style=" width: 1130px">
		<div class="contents panel panel-success">
			<div class="title-wrap panel-heading">
				${hotajax.hotname }
			</div>	
			<div class="panel-body">
				<div class="recode-wrap">
					글쓴이 : ${hotajax.memberId }
				</div>
				<div class="contents-wrap">
				${hotajax.hotcontent }
				</div>
				<div class="hit-wrap">
					<b>조회수</b> ${hotajax.readcount }
				</div>
			</div>
		</div>
		<form class="viewForm" method="post">
			<input type="hidden" name="hotid" value="${hotajax.hotid }" />
			<button type="button" onclick="onModify()" class="btn btn-primary">수정</button>
		<%
			Member mem  = (Member)request.getAttribute("loginUser");
			Hot bd = (Hot)request.getAttribute("hotajax");
			if (mem !=null)
			if(mem.getMemberid().equals("master")){
			%><button type="button" onclick="onDel()" class="btn btn-primary">삭제</button>
			<% }else if(mem.getMemberid().equals(bd.getMemberId())){
			%><button type="button" onclick="onDel()" class="btn btn-primary">삭제</button>
			<% }%> 
			<button type="button" onclick="onList()" class="btn btn-primary">목록</button>
		</form>	
	</div>
	
</body>
<script type="text/javascript">
	var onModify = function(){
		var form = $('.viewForm')[0];
		form.action = 'hotmodify.do';
		form.submit();
	};
	var onDel = function(){
		var form = $('.viewForm')[0];
		form.action = 'hotDel.do';
		form.submit();
	};
	var onList = function(){
		location.href='hotmain.do';
	};
</script>
</html>


