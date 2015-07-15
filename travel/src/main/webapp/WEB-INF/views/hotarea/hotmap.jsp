<%@ page contentType="text/html;charset=UTF-8" import="java.util.*,model.*"%>
<%@include file="../header.jsp"%>
<%@include file="../mainHeader.jsp" %>
<!DOCTYPE html>
<html lang="ko" xmlns:v="urn:schemas-microsoft-com:vml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
</head>
<body>
	<div id="hotmenu" style="margin-left: 74px;">
		<ul>
			<li style="margin-left :14px;"><a href="hacontent.do?local=${areaOne.local }&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">지역설명</a></li>
			<li style="margin-left :14px;"><a href="hotrest.do?local=${areaOne.local }&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">맛집</a></li>
			<li style="margin-left :14px;"><a href="hottourist.do?local=${areaOne.local }&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">관광지</a></li>
			<li style="margin-left :14px;"><a href="hotstay.do?local=${areaOne.local }&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">숙소</a></li>
			<li style="margin-left :14px;"><a href="hotmap.do?local=${areaOne.local }&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}">지도</a></li>
			<li style="margin-left :14px;"><a href="hotwrite.do">내가스팟등록하기</a></li>
		</ul>
	</div>
	<table style="margin-left: 70px;">
		<tr style="vertical-align: top;">
			<td>
				<form action="#" >
					<fieldset>
						<legend>일정표</legend>
						<div class="elements">
						<label class="label" for="name"><a href="schedule.do?plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}" class="home"><p>요약표</a></label>
						<label class="label" for="name"><a href="sccal.do?plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}" class="home"><p>달력</a></label>
						</div>
					</fieldset>
				</form>
			</td>
			<td rowspan="2" style="width:750px; height:750px">
				<table>
					<tr>
						<td colspan="5">
							<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=f8806ad6dbda4e31e95fb79cf04dbe14"></script>		
						<form action="#" >
							<fieldset style="width: 835px;">
								<legend>지도</legend>
								<div class="elements">
								<label class="label" for="name"><span id="map" style="border:1px solid #000;float: left; " ></span></label>
								</div>
							</fieldset>
						</form>
							<script type="text/javascript">
							 <%Area A = (Area)request.getAttribute("areaOne");%>
			
								var aPoints;
							    var oPoint = new nhn.api.map.LatLng(<%=A.getY()%>,<%=A.getX()%>);   // 초기 좌표
							     <%
							     List<Hot> al = (List)request.getAttribute("hotlist");
							     for(int i = 0 ; i<al.size() ; i++){
							        %>
							        var MapY = <%=al.get(i).getY()%>;
							          var MapX = <%=al.get(i).getX()%>;
							        var <%=al.get(i).getHotname()%> = new nhn.api.map.LatLng(MapY,MapX);
							        <%
							     }
							  %>
							     
							     
							     // 줌 레벨 값
							     var defaultLevel = 11;
							     // 지도 설정
							     var oMap = new nhn.api.map.Map(document.getElementById('map'), {
							           point : oPoint,                                         // 기본 위치
							           zoom : 5,                                      // 줌 레벨
							           enableWheelZoom : true,                        // 마우스 휠 동작으로 확대/축소 여부
							           enableDragPan : true,                            // 마우스로 끌어서 지도를 이동할지 여부
							           enableDblClickZoom : false,                   // 더블클릭으로 지도를 확대할지 여부
							           mapMode : 0,                                        // 지도 모드 (0:일반, 1:겹침, 2:위성)
							           activateTrafficMap : false,                      // 실시간 교통정보 활성화 여부
							           activateBicycleMap : false,                    // 자전거 지도 활성화 여부
							           minMaxLevel : [ 1, 14 ],                         // 지도의 최소/최대 축척 레벨
							           size : new nhn.api.map.Size(750, 400)    // 지도의 크기
							     });
							     
							     var mapInfoTestWindow = new nhn.api.map.InfoWindow(); // - info window 생성
							     mapInfoTestWindow.setVisible(false); // - infowindow 표시 여부 지정.
							     oMap.addOverlay(mapInfoTestWindow);     // - 지도에 추가.     
							     
							     var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언.
							     oMap.addOverlay(oLabel); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨.
							
							     var oPolyline = new nhn.api.map.Polyline([], {
							         strokeColor : '#f00', // - 선의 색깔
							         strokeWidth : 5, // - 선의 두께
							         strokeOpacity : 0.5 // - 선의 투명도
							       }); // - polyline 선언, 첫번째 인자는 선이 그려질 점의 위치. 현재는 없음.
							    oMap.addOverlay(oPolyline); // - 지도에 선을 추가함.
							
							     
							     var oIconSize = new nhn.api.map.Size(28, 37);
							     // 이미지 위치
							     var oOffsetSize = new nhn.api.map.Size(14, 37);
							     // 아이콘 설정
							     var oIcon = new nhn.api.map.Icon(
							          'http://static.naver.com/maps2/icons/pin_spot2.png',oIconSize, oOffsetSize);
								
							     <%
							     for(int i = 0 ; i<al.size() ; i++){
							        %>
							        var MapY = <%=al.get(i).getY()%>;
							          var MapX = <%=al.get(i).getX()%>;
							        var oMarker<%=i%> = new nhn.api.map.Marker(oIcon,{ title : '<%=al.get(i).getHotname()%>' });
							        oMarker<%=i%>.setPoint(<%=al.get(i).getHotname()%>);
							        oMap.addOverlay(oMarker<%=i%>);
							        <%
							     }
							  %>
							     
							     mapInfoTestWindow.attach('changeVisible', function(oCustomEvent) {
							         if (oCustomEvent.visible) {
							                 oLabel.setVisible(false);
							         }
							    });
							
							
							    oMap.attach('mouseenter', function(oCustomEvent) {
							         var oTarget = oCustomEvent.target;
							         // 마커위에 마우스 올라간거면
							         if (oTarget instanceof nhn.api.map.Marker) {
							                 var oMarker = oTarget;
							                 oLabel.setVisible(true, oMarker); // - 특정 마커를 지정하여 해당 마커의 title을 보여준다.
							         }
							    });
							
							    oMap.attach('mouseleave', function(oCustomEvent) {
							         var oTarget = oCustomEvent.target;
							         // 마커위에서 마우스 나간거면
							         if (oTarget instanceof nhn.api.map.Marker) {
							                 oLabel.setVisible(false);
							         }
							    });
							     oMap.attach('click', function(oCustomEvent) {
							        var oPoint = oCustomEvent.point;
							        var oTarget = oCustomEvent.target;
							        mapInfoTestWindow.setVisible(false);
							         if (oTarget instanceof nhn.api.map.Marker) {
							        	 	// 겹침 마커 클릭한거면
							                 if (oCustomEvent.clickCoveredMarker) {
							                         return;
							                 }
							                 mapInfoTestWindow.setContent('<DIV style="border-top: 1px solid; border-bottom: 2px groove black; border-left: 1px solid; border-right: 2px groove black; margin-bottom: 1px; color: black; background-color: white; width: auto; height: auto;">'+
							                         '<span style="color: #000000 !important; display: inline-block; font-size: 12px !important; font-weight: bold !important; letter-spacing: -1px !important; white-space: nowrap !important; padding: 2px 2px 2px 2px !important">'+
							                         '<table style="width: 150px;"><tr id="item"><td><br>'+oTarget.getTitle()+' 입니다.<br><input class="osx" type="button" value="보기" onclick="osx(this)"><input type="hidden" id="mapx" value=""><input type="hidden" id="hotname" value=""></td></tr></table></span></div>');                 
							                 
							                 mapInfoTestWindow.setPoint(oTarget.getPoint());
							                 mapInfoTestWindow.setVisible(true);
							                 mapInfoTestWindow.setPosition({right : 15, top : 30});
							                 mapInfoTestWindow.autoPosition();
							         }
							         var mapx = $("#mapx");
							         mapx.val(oTarget.getPoint().getLng());
							         var hotname = $("#hotname");
							         hotname.val(oTarget.getTitle());
							     });
							     function osx(item){
							    	 var x = $(item).parent().find("#mapx").val();
							    	 var hotname = $(item).parent().find("#hotname").val();
							    	 var sendData = 'x='+x+'&hotname='+hotname;
							       $.ajaxSetup({
							         type:"POST",
							         url:"hotajax2.do",
							         dataType:"html",
							         success:function(msg){$('.msg').html(msg);}
							      });
							      $.ajax({data:sendData});
							      return false;       
							   }
							</script>
						</td>
					</tr>
					<tr>
						<td>
							<form action="#" >
							<fieldset style="width: 835px;">
								<div class="elements">
								<label class="label" for="name"><div class="msg"></div></label>
								</div>
							</fieldset>
						</form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr style="vertical-align: top;">
			<td>
				<form action="#" class="calendar_form">
					<fieldset>
						<legend>가이드북</legend>
						<div class="elements1">
						<c:forEach var="calendar" items="${calendar }">
						<label class="label" for="name"><a href="hotarea.do?local=${calendar.local}&plannername=
				${plannerName.plannername }&plannerid=${plannerName.plannerid}" class="home"><p>${calendar.local }</a></label>
						</c:forEach>
						</div>
					</fieldset>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
                              