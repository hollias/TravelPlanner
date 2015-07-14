<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="adminMain.jsp" %>
<body>
<!--WRAP-->
<section id="wrap">
	<!--CONTENTS-->	
		<table class="write_table">
		<col style="width:150px"><col>
		<thead>		
			<tr><th scope="row">아이디</th><td>${member.memberid }</td></tr>			
			<tr><th scope="row">비밀번호</th><td>${member.password }</td></tr>					
			<tr><th scope="row">이름</th>	<td>${member.membername }</td></tr>
			<tr><th scope="row">전화번호</th><td>${member.phone }</td></tr>
			<tr><th scope="row">E-메일</th><td>${member.email }</td></tr>
		</thead>	
		</table>	
		<br/>	
		<div id="h"><p><a href="joinList.do">돌아가기</a></p></div>		
	<!--/CONTENTS-->
</section>
</body>
</html>