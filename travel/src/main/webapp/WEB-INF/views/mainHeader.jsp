<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<link href="<%=request.getContextPath() %>/css/login.css" type="text/css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   $('a.login-window').click(function() {
      
      // Getting the variable's value from a link 
      var loginBox = $(this).attr('href');

      //Fade in the Popup and add close button
      $(loginBox).fadeIn(300);
      
      //Set the center alignment padding + border
      var popMargTop = ($(loginBox).height() + 24) / 2; 
      var popMargLeft = ($(loginBox).width() + 24) / 2; 
      
      $(loginBox).css({ 
         'margin-top' : -popMargTop,
         'margin-left' : -popMargLeft
      });
      
      // Add the mask to body
      $('body').append('<div id="mask"></div>');
      $('#mask').fadeIn(300);
      
      return false;
   });
   
   // When clicking on the button close or the mask layer the popup closed
   $('a.close, #mask').click('click', function() { 
     $('#mask , .login-popup').fadeOut(300 , function() {
      $('#mask').remove();  
   }); 
   return false;
   });
});
</script>
<body>
   <nav id="cssmenu">
      <ul>
         <li class='active'><a style="padding: 9px 0 11px;" href="main.do"> <img
               src="images/logo_s.png" height="26px;"></a></li>
         <li><a href="planner.do">플레너</a></li>
         <li><a href="diary.do">여행일지</a></li>
         <li><a href="hotmain.do">전국 맛집</a></li>
         <li><a href="boardlist.do">게시판</a></li>
      </ul>
   </nav>
      <div style="background-color:#007DD5 ; height: 25px ;width: 1100px; margin-left:74px; margin-top: -15px;">
      <ul>
         <li style="margin-left: 1000px; float: left;">
         <c:choose>
            <c:when test="${not empty loginUser}">               
               <a href="logout.do" style="float: left;" id="h">로그아웃</a>               
            </c:when>
            <c:when test="${empty loginUser}">
            <!--로그인  -->
            <div class="container">
            <div id="content">
                  <a href="#login-box" class="login-window" id="h">로그인</a>
                    <div id="login-box" class="login-popup" style="background-color: #FFF;">
                     <a href="#" class="close" ><img src="images/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
                      <form method="post" class="signin" action="login.do">
                            <fieldset class="textbox" style="background-color: #E5EDF4;">
                           <label class="memberid">
                            <span>아이디</span>
                            <input id="memberid" name="memberid" value="" type="text" autocomplete="on" style="background-color: #FFFFFF;color: black;">
                            </label>
                            <label class="password">
                            <span>패스워드</span>
                            <input id="password" name="password" value="" type="password" style="background-color: #FFFFFF; color: black;">
                            </label>
                            <input type="submit" value="로그인"  />
                            <p>
                            <a class="ongoing" href="join.do" style="text-decoration:none">회원가입</a><br>
                            <a class="ongoing" href="idFind.do" style="text-decoration:none">아이디/비밀번호 찾기</a>
                            </p>
                            </fieldset>
                      </form>
                  </div>
                </div>
         </div>
         </c:when>   
         </c:choose>
         </li>
      </ul>
   </div>  
    
   <p>    
</body>
</html>