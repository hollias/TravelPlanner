<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<%@include file="../mainHeader.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="resources/se/js/HuskyEZCreator.js" charset="utf-8" ></script>
<script type="text/javascript" src="resources/se/js/jindo.min.js" charset="utf-8" ></script>
<link href="<%=request.getContextPath() %>/css/demo.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<style type="text/css">
#boardWriteForm{margin: 30px 0;}
</style>
</head>
<body>
<div class="container" style=" width: 1130px">
	<form id="boardWriteForm" method="post" >
		<div>
			<div><b>제목</b></div>
			<input type="text" id="title" name="title" value="" maxlength="100" style="width: 100%;"/>
		</div>
		<div class="contentDiv">
		 	<textarea id="txtContent" name="content" rows="30" style="width:100%;"></textarea>
		</div>
		<div class="buttonDiv">
			<c:if test="${modify == 'true'}">
				<button type="button" class="btn btn-primary" onclick="onModify()">수정</button>
			</c:if>
			<c:if test="${modify != 'true'}">
				<button type="button" class="btn btn-primary" onclick="onWrite()">쓰기</button>
			</c:if>
			 <button type="button" class="btn btn-primary" onclick="history.go(-1);"> 취소</button>
			 <input type="hidden" name="boardid" value="${board.boardid }"/>
			 <input type="hidden" name="memberid" value="${loginUser.getMemberid() }"/> 
		</div>
	</form>
</div>
</body>
<script type="text/javascript">
var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: document.getElementById('txtContent'), // html editor가 들어갈 textarea id
	sSkinURI: "resources/se/SmartEditor2Skin.html",  // html editor가 skin url
	fOnAppLoad: function () { 
        //수정모드를 구현할 때 사용할 부분. 로딩이 끝난 후 값이 체워지게 하는 구현을 하면 된다.
         var title = '${item.title}';               
         var content = '${item.content}';         //db에서 불러온 값을 여기에서 체워넣으면 됨.
         document.getElementById("title").value = title;     
         oEditors.getById["txtContent"].exec("PASTE_HTML", [content]); //로딩이 끝나면 contents를 txtContent에 넣음
     },
     fCreator: "createSEditor2"
 });

var onWrite = function(){
	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
	var boardWriteForm = document.getElementById("boardWriteForm");  
	boardWriteForm.action ="writeSubmit.do";              
	boardWriteForm.submit();  
};

var onModify = function(){
	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
	var boardWriteForm = document.getElementById("boardWriteForm");  
	boardWriteForm.action ="modifySubmit.do";              
	boardWriteForm.submit();  
};

var pasteHTML = function(filename){
    var sHTML = '<img src="${pageContext.request.contextPath}/resources/upload/'+filename+'">';
    oEditors.getById["txtContent"].exec("PASTE_HTML", [sHTML]);
};
</script>
</html>