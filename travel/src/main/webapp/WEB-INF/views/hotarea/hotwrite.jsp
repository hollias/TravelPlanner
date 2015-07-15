<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="../header.jsp"%>
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
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">
#boardWriteForm{margin: 30px 0;}
</style>
</head>
<body>
<table>
	<tr style="vertical-align: top;">
		<td style="padding-left: 55px; width: 620px;">
			<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=f8806ad6dbda4e31e95fb79cf04dbe14"></script>

				<fieldset style="margin-left: 17px; width: 500px">
					<legend>지도</legend>
					<div id = "testMap" style="border:1px solid #000; width:700px; height:400px; margin:20px; display:block;"></div>
				</fieldset>

			<script type="text/javascript">
				var oPoint = new nhn.api.map.LatLng(37.5010226, 127.0396037);
				var oPoint2 = new nhn.api.map.LatLng(37.5055226, 127.0452037);
				nhn.api.map.setDefaultPoint('LatLng');
				oMap = new nhn.api.map.Map('testMap', {
							center : oPoint,
							level : 2, // - 초기 줌 레벨은 10이다.
							enableWheelZoom : true,
							enableDragPan : true,
							enableDblClickZoom : false,
							mapMode : 0,
							activateTrafficMap : false,
							activateBicycleMap : false,
							activateRealtyMap : true,
							minMaxLevel : [ 1, 14 ],
							size : new nhn.api.map.Size(500, 400)
				});
	
				var mapZoom = new nhn.api.map.ZoomControl(); // - 줌 컨트롤 선언
				mapZoom.setPosition({left:80, bottom:40}); // - 줌 컨트롤 위치 지정.
				oMap.addControl(mapZoom); // - 줌 컨트롤 추가.
				
				var oSize = new nhn.api.map.Size(28, 37);
				var oOffset = new nhn.api.map.Size(14, 37);
				var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
	
				// - Draggable Marker 의 경우 Icon 인자는 Sprite Icon이 된다.
				// - 따라서 Sprite Icon 을 사용하기 위해 기본적으로 사용되는 값을 지정한다.
				// - Sprite Icon 을 사용하기 위해서 상세한 내용은 레퍼런스 페이지의 nhn.api.map.SpriteIcon 객체를 참조하면 된다.
				var testdefaultSpriteIcon = {
						url:"http://static.naver.com/maps2/icons/pin_api2.png", 
						size:{width:19, height:24},
						spriteSize:{width:190, height:96},
						imgOrder:0, 
						offset : {width: 10, height: 24}
				};
				// - 위에서 지정한 기본값을 이용해 실제로 SpriteIcon 을 생성한다.
				var testDupSpriteIcon_first = new nhn.api.map.SpriteIcon(testdefaultSpriteIcon.url, testdefaultSpriteIcon.size, testdefaultSpriteIcon.spriteSize, 0, testdefaultSpriteIcon.offset); 
	
				var DraggableMarker = new nhn.api.map.DraggableMarker(testDupSpriteIcon_first , {	
					title : '드레그후 선택하세요',
					point : oPoint,
					zIndex : 1,
					smallSrc :  testDupSpriteIcon_first});		
				oMap.addOverlay(DraggableMarker);
				
				var mapInfoTestWindow = new nhn.api.map.InfoWindow(); // - info window 생성.
				mapInfoTestWindow.setVisible(false); // - infowindow 표시 여부 지정.
				oMap.addOverlay(mapInfoTestWindow);	// - 지도에 info window를 추가한다.	 
				
				oMap.attach('click', function(oCustomEvent) {
					var oPoint = oCustomEvent.point;
					var oTarget = oCustomEvent.target;
					mapInfoTestWindow.setVisible(false);
					// 마커를 클릭했을 때.
					if (oTarget instanceof nhn.api.map.DraggableMarker) {
						// 겹침 마커를 클릭했을 때.
						if (oCustomEvent.clickCoveredMarker) {
							return;
						}
						mapInfoTestWindow.setContent('<DIV style="border-top:1px solid; border-bottom:2px groove black; border-left:1px solid; border-right:2px groove black;margin-bottom:1px;color:black;background-color:white; width:auto; height:auto;">'+
								'<span style="color: #000000 !important;display: inline-block;font-size: 12px !important;font-weight: bold !important;letter-spacing: -1px !important;white-space: nowrap !important; padding: 2px 5px 2px 2px !important">' + 
								'좌표를 선택하세요 <br/><span></div>');
						mapInfoTestWindow.setPoint(oTarget.getPoint());
						mapInfoTestWindow.setVisible(true);
						mapInfoTestWindow.autoPosition();
						return;
					}
				});
				function appendItem(item){
					var mapx = $(item).parent().parent().find("#mapxx").val();
					var mapy = $(item).parent().parent().find("#mapyy").val();
			        frm.x.value=mapx;
			        frm.y.value=mapy;
				};
				
				var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언
				oMap.addOverlay(oLabel); // - 마커 라벨을 지도에 추가한다. 기본은 라벨이 보이지 않는 상태로 추가됨.
	
				oMap.attach("mouseenter", function(oEvent){
					var oTarget = oEvent.target;
					if(oTarget instanceof nhn.api.map.DraggableMarker){
						oLabel.setVisible(true, oTarget); // - 특정 마커를 지정하여 해당 마커의 title을 보여준다.
					}
				});
				
				oMap.attach("mouseleave", function(oEvent) {
					var oTarget = oEvent.target;
					if(oTarget instanceof nhn.api.map.DraggableMarker){
						oLabel.setVisible(false);
					}
				});
				/*
				* draggable marker 의 자체 이벤트로 changePosition 이 있다.
				* 이 이벤트는, 사용자가 drag 를 이용해 마커의 위치를 옮길 때 발생한다.
				* oEvent 의 파라미터는 두 개로, oldPoint 와 newPoint 이다.
				* oldPoint 는 drag 하기 전의 마커 위치이며, newPoint 는 drag 한 이후의 마커 위치가 된다..
				*/
				DraggableMarker.attach("changePosition" , function (oEvent) {
					//if(mapInfoTestWindow.getVisible() != false){
						mapInfoTestWindow.setVisible(false); // - infowindow 의 표시 여부 지정.
						// - infoWindow 의 내용은 사용자가 임의로 지정할 수 있습니다. 단 HTML 로 지정을 하셔야 합니다. 
						mapInfoTestWindow.setContent('<DIV style="border-top:1px solid; border-bottom:2px groove black; border-left:1px solid; border-right:2px groove black;margin-bottom:1px;color:black;background-color:white; width:auto; height:auto;">'+
								'<span style="color: #000000 !important;display: inline-block;font-size: 12px !important;font-weight: bold !important;letter-spacing: -1px !important;white-space: nowrap !important; padding: 2px 5px 2px 2px !important">' + 
								'<input id="btn" type="button" value="선택" onclick="appendItem(this)"><input type="hidden" id="mapxx" value="'+oEvent.newPoint.getLng()+'"><input type="hidden" id="mapyy" value="'+oEvent.newPoint.getLat()+'"><span></div>');
						mapInfoTestWindow.setPoint(oEvent.newPoint);
						mapInfoTestWindow.setVisible(true);
						mapInfoTestWindow.autoPosition();
					//}
				});
	</script>
</td>
<td>
	<form id="hotWriteForm" method="post" name="frm"">
		<fieldset style="margin-left: 17px; width: 536px; height: 483px;">
			<legend>정보입력</legend>
			<p>
			<label class="smart" for="name">제목 :</label>
			<input type="text" id="title" name="hotname" value="" maxlength="100" />
			<p>
			<label class="smart" for="name">좌표 :</label>
			<input type="text" id="x" name="x" readonly="readonly">
			<input type="text" id="y" name="y" readonly="readonly">
			<p>
			<label class="smart" for="name">대표가격 :</label>
			<input type="number" name="hotprice" required="required" id="hotprice">
			<p>
			<label class="smart" for="name">종류 :</label>
			<select name="hotkind" required="required">
					<option value="1">맛집</option>
					<option value="2">관광지</option>
					<option value="3">숙박</option>
			</select>
			<p>
			<label class="smart" for="name">지역 :</label>
			<select name="local" required="required">
					<c:forEach var="areaname" items="${areaname }">
						<option value="${areaname.local }">${areaname.local }</option>
					</c:forEach>
			</select>	
		</fieldset>
</td>
</tr>
<tr>
	<td colspan="2" style="padding-left: 57px">
		<form action="#" >
				<fieldset style="margin-left: 17px; ">
				<div class="container" style="width: 1060px;">
				<div class="contentDiv">
				 	<textarea id="txtContent" name="hotcontent" rows="30" style="width:100%;"></textarea>
				</div>
				<div class="buttonDiv">
					<c:if test="${hotmodify == 'true'}">
						<button type="button" class="btn btn-primary" onclick="onModify()">수정</button>
					</c:if>
					<c:if test="${hotmodify != 'true'}">
						<button type="button" class="btn btn-primary" onclick="onWrite()">쓰기</button>
					</c:if>
					<button type="button" class="btn btn-primary" onclick="history.go(-1);"> 취소</button>
				</div>
				</div>
				</fieldset>
		</form>
	</td>
</tr>	
</form>
</table>
</body>
<script type="text/javascript">
var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: document.getElementById('txtContent'), // html editor가 들어갈 textarea id
	sSkinURI: "resources/se/SmartEditor2Skin.html",  // html editor가 skin url
	fOnAppLoad: function () { 
        //수정모드를 구현할 때 사용할 부분. 로딩이 끝난 후 값이 체워지게 하는 구현을 하면 된다.
         var title = '${hotajax.hotname}';               
         var content = '${hotajax.hotcontent}';         //db에서 불러온 값을 여기에서 체워넣으면 됨.
         var hotprice = '${hotajax.hotprice}';
         var x = '${hotajax.x}';
         var y = '${hotajax.y}';
         document.getElementById("title").value = title;  
         document.getElementById("hotprice").value = hotprice;     
         document.getElementById("x").value = x;     
         document.getElementById("y").value = y;     
         oEditors.getById["txtContent"].exec("PASTE_HTML", [content]); //로딩이 끝나면 contents를 txtContent에 넣음
     },
     fCreator: "createSEditor2"
 });

var onWrite = function(){
	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
	var hotWriteForm = document.getElementById("hotWriteForm");  
	hotWriteForm.action ="hotwriteSubmit.do";              
	hotWriteForm.submit();  
};

var onModify = function(){
	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
	var hotWriteForm = document.getElementById("hotWriteForm");  
	hotWriteForm.action ="hotmodifySubmit.do?hotid=${hotajax.hotid}";              
	hotWriteForm.submit();  
};

var pasteHTML = function(filename){
    var sHTML = '<img width="400" height="400" src="${pageContext.request.contextPath}/resources/upload/'+filename+'">';
    oEditors.getById["txtContent"].exec("PASTE_HTML", [sHTML]);
};
</script>
</html>