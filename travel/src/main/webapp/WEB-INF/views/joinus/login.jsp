<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../mainHeader.jsp" %>
<body>
<!--WRAP-->
<section id="wrap">
   <!--HGROUP-->
   <div class="hgroup"><h1>로그인</h1></div>
   <!--/HGROUP-->   
      <c:choose>
         <c:when test="${not empty message }">
            <script type="text/javascript">alert("${message}");</script>
         </c:when>
      </c:choose>
      <!--CONTENTS-->
   <article>
      <div class="login">
      <form action="login.do" method="post">
         <fieldset>
            <ul>
               <li><label><span>아이디</span><input type="text" name="memberid"></label></li>
               <li><label><span>비밀번호</span><input type="password" name="password"></label></li>
            </ul>
            <p><input type="submit" value="로그인" style="width: 100px; height: 60px;" /></p>
         </fieldset>
      </form>         
      </div>
   </article>   
      <div id="h"><p><a href="join.do">회원가입</a></p></div>        
    
   <!--/CONTENTS-->
</section>
</body>
</html>