<%@page import="model.Board"%>
<%@page import="model.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="../header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<html>
<head>
<%@include file="../mainHeader.jsp" %>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link href="<%=request.getContextPath() %>/css/demo.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<style type="text/css"> 

	.contents-wrap{margin:30px 0 0 0;min-height: 500px;}
	.contents{ margin: 60px 0 0 0;}
	.recode-wrap{text-align: right; color: #888;}
	.hit-wrap{color:#888; margin: 10px 0;}
	.viewForm{margin: 20px 0 0 0;}
	.contents-wrap > p{
			border-bottom:none;
			margin-bottom:20px;
			padding-bottom:10px;
	}
</style>
</head>

<body>
	<div class="container" style=" width: 1130px">
		<div class="contents panel panel-success">
			<div class="title-wrap panel-heading">
				${item.title }
			</div>	
			<div class="panel-body">
				<div class="recode-wrap">
					${item.memberid } | <fmt:formatDate value="${item.regdate }" pattern="yyyy-MM-dd"/> 
				</div>
				<div class="contents-wrap">
				${item.content }
				</div>
				<div class="hit-wrap">
					<b>조회수</b> ${item.readcount }
				</div>
			</div>
		</div>
		<form class="viewForm" method="post">
			<input type="hidden" name="boardid" value="${item.boardid }" />
			<button type="button" onclick="onModify()" class="btn btn-primary">수정</button>
		<%
			Member mem  = (Member)request.getAttribute("loginUser");
			Board bd = (Board)request.getAttribute("item");
			if (mem !=null)
			if(mem.getMemberid().equals("master")){
			%><button type="button" onclick="onDel()" class="btn btn-primary">삭제</button>
			<% }else if(mem.getMemberid().equals(bd.getMemberid())){
			%><button type="button" onclick="onDel()" class="btn btn-primary">삭제</button>
			<% }%> 
			<button type="button" onclick="onList()" class="btn btn-primary">목록</button>
		</form>	
	</div>
	
</body>
<script type="text/javascript">
	var onModify = function(){
		var form = $('.viewForm')[0];
		form.action = 'modify.do';
		form.submit();
	};
	var onDel = function(){
		var form = $('.viewForm')[0];
		form.action = 'boardDel.do';
		form.submit();
	};
	var onList = function(){
		location.href='boardlist.do';
	};
</script>
</html>


