<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../admin/adminMain.jsp" %>
<body>
<!--WRAP-->
<section id="wrap">
	<!--HGROUP-->
	<div class="hgroup"><h1>회원 리스트</h1>
	</div>
	<!--/HGROUP-->
	<c:set var="num" value="${pb.num }" />
	<table class="list_table">
	<caption class="skip">회원 리스트</caption>	
		<col style="width:50px"><col style="width:80px">
		<col style="width:80px"><col style="width:80px">
		<col style="width:150px">
	<thead>
	<tr>
		<th scope="col">번호</th>	<th scope="col">유저ID</th>
		<th scope="col">이름</th>	<th scope="col">전화번호</th>
		<th scope="col">E-메일</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach  items="${memberList }" var="member">
	<tr><td>${num }</td><td>${member.memberid}</td>			
		<td class="al"><a href="adminMember.do?memberid=${member.memberid }">${member.membername }</a></td>	
		<td>${member.phone }</td>	
		<td>${member.email}</td>
	</tr>
	<c:set var="num" value="${num -1 }" />
	</c:forEach>
	</tbody>
	</table>	
	<!--페이징-->
	<p align="center" >
		<c:forEach var="i" begin="${pb.firstPage }" end="${pb.lastPage }">
		<c:if test="${i <= pb.totalPage }">
			<a style="color: black;" href="joinList.do?currentPage=${i }">${i }</a>
		</c:if>
		</c:forEach>
	</p>
	<!--/페이징-->		
	</section>	
</body>
</html>