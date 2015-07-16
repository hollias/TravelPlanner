<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


</script>
</head>
<body>
   <c:forEach var="list1" items="${list}">
   
   <table border="1">   
   <tr>
      <td><img alt="" src="resources/upload/${list1.hotimage }" width="100"></td><td>${list1.hotname }</td>
      <td><input type="hidden" id="sid" value="${list1.scheduleid }">
      <input type="button" value="취소" onclick="cancel(this)"></td></tr>   
   </table>
   </c:forEach>
</body>
</html>