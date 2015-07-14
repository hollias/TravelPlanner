<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../main.jsp"%>
<body>
<!--WRAP-->
<section id="wrap">
	<!--HGROUP-->
	<div class="hgroup"><h1>회원 정보 수정</h1></div>
	<!--/HGROUP-->
	<!--CONTENTS-->
	<form action="editMember.do" name="form" method="post" >		
		<table class="write_table">
		<caption class="skip">정보 수정 </caption>
		<col style="width:150px">
		<col>
		<thead>		
			<tr><th scope="row">아이디</th>
				<td>${member.mId}<input type="hidden" name="memberid" value="${member.memberid}"></td>
			</tr>
			<tr><th scope="row">비밀번호</th>
				<td><input type="password" name="password" value="${member.password }"  class="txt t02"> * 4~12자의 영문, 숫자, 특수문자( ! # $ * ( ) _ = |) 조합 </td>
			</tr>				
			<tr><th scope="row">이름</th>
				<td><input type="text" name="mName" value="${member.membername }" class="txt t02"></td>
			</tr>
			<tr><th scope="row">전화번호</th>
				<td><input type="text" name="address" value="${member.phone }" class="txt t01"></td>
			</tr>
			<tr><th scope="row">email</th>
				<td><input type="text" name="email" value="${member.email }" class="txt t01"></td>
			</tr>
		</thead>	
		</table>	
		<br/>	
		<div id="h">
			<p><input type="submit" value="등록">&nbsp;<input type="reset" value="취소">&nbsp;<a href="mypage.do?memberid=${member.memberid }">돌아가기</a></p>		
		</div>		
	</form>
	<!--/CONTENTS-->
</section>
</body>
</html>