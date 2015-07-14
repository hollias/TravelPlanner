<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<body>
			
	<div  style="background-color: black; height: 20px " >
		<ul >
			<li style="margin-left: 1065px; float: left;">
			<c:choose>
				<c:when test="${not empty loginUser}">					
					<a href="logout.do" >로그아웃</a>					
				</c:when>
				<c:when test="${empty loginUser}">
					<a href="login.do" >로그인하기</a>
					<a href="join.do" >| 회원가입</a>
			</c:when>	
			</c:choose>
			</li>
		</ul>
	</div>
	<nav id="gnb">
		<ul>
			<li><a href="adminMain.do">관리자 페이지</a></li>
			<li><a href="joinList.do">1.회원 관리</a></li>
			<li><a href="planul.do">2.머를넣을까?</a></li>
			<li><a href="planul.do">3.여기는?</a></li>
			<li><a href="planul.do">4.여기도?</a></li>
		</ul>
	</nav>
</body>
</html>