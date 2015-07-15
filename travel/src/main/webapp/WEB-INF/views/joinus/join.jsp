<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../mainHeader.jsp" %>
<!DOCTYPE html>
<html><head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#submit').click(function () { 
			var name = $('.memberid').val();
			var sendData = 'memberid=' + name; 			
			$.ajaxSetup({ type:"GET", url:"user.do",
				dataType : "text", 
				success: function (msg) { $('#message').html(msg); } 
			});
			$.ajax({ data: sendData }); 
				return false; 
			});
	});
	function chk2() {
		if (form.memberid.value.length < 4 || form.memberid.value.length > 12 ) {
			alert("아이디는 4 - 12글자");
			form.memberid.focus();
			return false;
		}
		var reg_pw = /^.*(?=.{4,8})(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[@!#$*()_&]).*$/; 
		if(!reg_pw.test(form.password.value)) { 
			alert("4~8자 영문 대 소문자, 숫자, 특수문자를 사용하세요."); 
			form.password.focus(); 
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<!--WRAP-->
<section id="wrap">
	<!--/HGROUP-->
	<c:choose>
		<c:when test="${not empty message }">
			<script type="text/javascript">alert("${message}");</script>
		</c:when>
	</c:choose>
	<!--CONTENTS-->
	<form action="join.do" method="post" name="form" onsubmit="return chk2()">		
		<table class="write_table" style="margin-left: 52px;">
		<caption class="skip">회원가입</caption>
		<col style="width:150px">
		<col>
		<thead>		
			<tr>
			<th scope="row">아이디</th>
			<form>
					<td><input type="text" name="memberid" class="memberid"
						 max="12" min="4" required="required" >
						 <input type="button" id="submit" value="중복확인"></td>
				</form>
				<th style="float: left;" id="message"></th>		
			</tr>			
			<tr><th scope="row">비밀번호</th>
				<td><input type="password" name="password"  class="txt t02"
				max="12" min="4" required="required">
				 * 4~12자의 영문, 숫자, 특수문자( ! # $ * ( ) _ = |) 조합 </td>
			</tr>			
			<tr><th scope="row">이름</th>
				<td><input type="text" name="membername" class="txt t02" required="required"></td>
			</tr>
			<tr><th scope="row">전화번호</th>
				<td><input type="text" name="phone" class="txt t02" required="required"></td>
			</tr>
			<tr><th scope="row">email</th>
				<td><input type="email" name="email" class="txt t01" required="required"></td>
			</tr>
		</thead>
		</table>			
		<div id="h" style="margin-left: 650px;">
			<p><input type="submit" value="등록">&nbsp;
			<input type="reset" value="취소">&nbsp;<a href="main.do">돌아가기</a></p>		
		</div>			
	</form>
	<!--/CONTENTS-->
</section>
</body>
</html>