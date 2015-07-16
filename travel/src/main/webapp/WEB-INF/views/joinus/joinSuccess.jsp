<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../mainHeader.jsp" %>
<body>
<!--WRAP-->
<section id="wrap">
   <!--HGROUP-->
   <div class="hgroup"><h1>가입 성공</h1></div>
   <!--/HGROUP-->   
   <!--CONTENTS-->   
      <table class="write_table" style="margin-left: 285px;">
      <caption class="skip">가입 성공</caption>
      <col style="width:150px"><col>
      <thead>      
         <tr><th scope="row">아이디</th><td>${member.memberid }</td></tr>         
         <tr><th scope="row">비밀번호</th><td>${member.password }</td></tr>               
         <tr><th scope="row">이름</th>   <td>${member.membername }</td></tr>
         <tr><th scope="row">전화번호</th><td>${member.phone }</td></tr>
         <tr><th scope="row">email</th><td>${member.email }</td></tr>
      </thead>   
      </table>   
      <br/>   
      <div id="h" style="margin-left: 530px;"><p><a href="main.do">돌아가기</a></p></div>      
   <!--/CONTENTS-->
</section>

</body>
</html>