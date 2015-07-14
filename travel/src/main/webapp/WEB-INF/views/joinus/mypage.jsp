<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../mainHeader.jsp"%>
<body>
<!--WRAP-->
<section id="wrap">
	<!--HGROUP-->
	<div class="hgroup"><h1>마이 페이지</h1></div>
	<!--/HGROUP-->
	<table class="list_table">
	<caption class="skip">마이페이지</caption>	
		<col style="width:100px"><col style="width:80px">
		<col style="width:80px"><col>
		<col><col style="width:150px">
	<thead>
	<tr><th scope="col">유저ID</th><th scope="col">이름</th>
		<th scope="col">전화번호</th>	
		<th scope="col">email</th><th scope="col">비고</th></tr>
	</thead>
	<tbody>
	<tr><td>${member.memberid}</td><td>${member.membername }</td>	
		<td class="al">${member.phone }</td>
		<td>${member.email}</td>
		<td><input type="button" value="수정하기" onclick="location.href='editMember.do?memberid=${member.memberid}'">
			<input type="button" value="탈퇴하기" onclick="location.href='memberClear.do?memberid=${member.memberid}'">
		</td>
	</tr>
	</tbody>
	</table>		
</section>	
</body>
</html>