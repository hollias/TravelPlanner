<%@page import="model.Hot"%>
<%@page import="model.Area"%>
<%@page import="model.PlannerSArea"%>
<%@page import="model.PlannerS"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../mainHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko" xmlns:v="urn:schemas-microsoft-com:vml">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>샘플코드</title>
<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=da0078193c4de13572dd7e2475a639cc"></script>
<script type="text/javascript" src="${root}/js/jquery.js"></script>

<style type="text/css">


</style>
</head>
<body>
<form action="detailSubmit.do" method="post">
<table>
   <tr>
   <c:forEach var="plannerS" items="${plannerS }">
      <td><a href="selectLocal.do?lineorder=${plannerS.lineorder }&plannerTitle=${plannerTitle}&startDate=${startDate}&local=${local1 }">${plannerS.local }</a></td>
   </c:forEach>
   </tr>
</table>
<table><tr style="vertical-align: top;"><td>
   <c:forEach var="i" begin="1" end="${day }">
      <div class="day"><a href="selectDday.do?dday=${i }&plannerTitle=${plannerTitle}&startDate=${startDate}&local=${local1 }&lineorder=${lineorder }">${i }일차</a></div>
   </c:forEach>
   <div>입력할 플래너 : ${plannerTitle }</div>
   <div>여행출발일자 : ${startDate } </div>
    
    <div id="msg">
    <c:if test="${slist != null }">
       <c:forEach var="list" items="${slist }">
      <table id="stable" border="1">   
         <tr>
         <td><img alt="aa" src="resources/upload/${list.hotimage }" width="100"></td><td>${list.hotname }</td>
         <td><input type="hidden" id="sid" value="${list.scheduleid }">        
         <input type="button" value="취소" onclick="cancel(this)"></td></tr>   
      </table>
   </c:forEach>
    </c:if>
    
    </div>
    <div id="mmm"></div>
    <input type="submit" value="확인">
</td><td >     
<div id="map" style="border:1px solid #000;" ></div>

<script type="text/javascript">   

   var firstX = <%= request.getAttribute("x")%>
   var firstY = <%= request.getAttribute("y")%>
   var aPoints;
    var oPoint = new nhn.api.map.LatLng(firstY,firstX);   // 초기 좌표
    
     <%
     List<Hot> al = (List)request.getAttribute("hot");
     for(int i = 0 ; i<al.size() ; i++){
        
     %>
        var MapX = <%=al.get(i).getX()%>;
        var MapY = <%=al.get(i).getY()%>;
        var <%=al.get(i).getHotname()%> = new nhn.api.map.LatLng(MapY,MapX);
     <%
     }
     %>
     
     
     // 줌 레벨 값
     var defaultLevel = 11;
     // 지도 설정
     var oMap = new nhn.api.map.Map(document.getElementById('map'), {
           point : oPoint,                                         // 기본 위치
           zoom : 8,                                      // 줌 레벨
           enableWheelZoom : false,                        // 마우스 휠 동작으로 확대/축소 여부
           enableDragPan : true,                            // 마우스로 끌어서 지도를 이동할지 여부
           enableDblClickZoom : false,                   // 더블클릭으로 지도를 확대할지 여부
           mapMode : 0,                                        // 지도 모드 (0:일반, 1:겹침, 2:위성)
           activateTrafficMap : false,                      // 실시간 교통정보 활성화 여부
           activateBicycleMap : false,                    // 자전거 지도 활성화 여부
           minMaxLevel : [ 1, 14 ],                         // 지도의 최소/최대 축척 레벨
           size : new nhn.api.map.Size(550, 920)    // 지도의 크기
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
     // 지도상에 찍힐 마커 설정
    /*  var oMarker1 = new nhn.api.map.Marker(oIcon, { title : 'seoul' });
     var oMarker2 = new nhn.api.map.Marker(oIcon, { title : 'daejun' });
     var oMarker3 = new nhn.api.map.Marker(oIcon, { title : 'daegu' });
     var oMarker4 = new nhn.api.map.Marker(oIcon, { title : 'busan' });
     // 마커 위치 지정 (강남역으로)
     oMarker1.setPoint(seoul);
     oMarker2.setPoint(daejun);
     oMarker3.setPoint(daegu);
     oMarker4.setPoint(busan);
     // 지도에 추가 (지도에 표시)
     oMap.addOverlay(oMarker1);
     oMap.addOverlay(oMarker2);
     oMap.addOverlay(oMarker3);
     oMap.addOverlay(oMarker4); */
     <%
     for(int i = 0 ; i<al.size() ; i++){
        %>
        var MapY = <%=al.get(i).getY()%>;
        var MapX = <%=al.get(i).getX()%>;
        var oMarker<%=i%> = new nhn.api.map.Marker(oIcon,{ title : '<%=al.get(i).getHotname()%>'});
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
         // 마커 클릭하면
    
         if (oTarget instanceof nhn.api.map.Marker) {
                 // 겹침 마커 클릭한거면
                 if (oCustomEvent.clickCoveredMarker) {
                         return;
                 }
                 // - InfoWindow 에 들어갈 내용은 setContent 로 자유롭게 넣을 수 있습니다. 외부 css를 이용할 수 있으며, 
                 // - 외부 css에 선언된 class를 이용하면 해당 class의 스타일을 바로 적용할 수 있습니다.
                 // - 단, DIV 의 position style 은 absolute 가 되면 안되며, 
                 // - absolute 의 경우 autoPosition 이 동작하지 않습니다. 
                 mapInfoTestWindow.setContent('<DIV style="border-top: 1px solid; border-bottom: 2px groove black; border-left: 1px solid; border-right: 2px groove black; margin-bottom: 1px; color: black; background-color: white; width: auto; height: auto;">'+
                         '<span style="color: #000000 !important; display: inline-block; font-size: 12px !important; font-weight: bold !important; letter-spacing: -1px !important; white-space: nowrap !important; padding: 2px 2px 2px 2px !important">'+
                         '<table><tr id="item"><td><img src="images/car4.jpg"></td><td>'+oTarget.getTitle()+'<br>안녕하세요'+oTarget.getTitle()+' 입니다.<input id="btn" type="button" value="추가" onclick="appendItem(this)"><input type="hidden" class="local" value="'+oTarget.getTitle()+'" ><input type="hidden" id="mapx" value=""><input type="hidden" id="mapy" value=""><input type="hidden" name="plannerId" id="plannerId" value="${plannerId }"><input type="hidden" name="plannerName" id="plannerName" value="${plannerTitle }"><input type="hidden" id="dday" value="${dday}"><input type="hidden" id="local1" value="${local1}"></td></tr></table></span></div>');                 
                 
               
                 mapInfoTestWindow.setPoint(oTarget.getPoint());
                 mapInfoTestWindow.setVisible(true);
                 mapInfoTestWindow.setPosition({right : 15, top : 30});
                 mapInfoTestWindow.autoPosition();
                 
         }
         
         //클릭한것의 x,y좌표를 input에 저장 하는것
         var x = $("#mapx");
         x.val(oTarget.getPoint().getLng());
         var y = $("#mapy");
         y.val(oTarget.getPoint().getLat());
         
     });
     
       
     
   
     
     function appendItem(item){
        
        //input에 저장된 x,y좌표를 opoint배열에 저장하는것
        var mapx = $(item).parent().find("#mapx").val();
        var mapy = $(item).parent().find("#mapy").val();
        var opoint;        
        opoint = new nhn.api.map.LatLng(mapy,mapx);
        
        var plannerId = $(item).parent().find("#plannerId").val();
        var plannerName = $(item).parent().find("#plannerName").val();
        
        var local = $('#local1').val();      
        var dday = $('#dday').val();
        
         
         var sendData = 'plannerId='+plannerId+'&plannerName='+plannerName+'&local='+local+'&dday='+dday+'&x='+mapx+'&y='+mapy;
          
      $.ajaxSetup({
         type:"POST",
         url:"addSchedule.do",
         dataType:"text",
         success:function(msg){$('#msg').html(msg);}
      });
      $.ajax({data:sendData});
      return false;      
   }
    //스케쥴S를 넣는것을 고민해봐야함.
    function cancel(a){
         
        var aa = $(a).parent().parent().parent().parent().find('#sid').val();
        $(a).parent().parent().parent().parent().remove(); 
       
       
        var sendData = 'index='+aa;       
         alert(sendData);
        $.ajaxSetup({
             type:"POST",
             url:"deleteSchedule.do",
             dataType:"text",
             success:function(msg){$('#msg').html(msg);}
          });
          $.ajax({data:sendData});
          //window.location.reload(true);
          return false;
         
     }
    
    
     </script>
      
</td></tr></table>         
   
</form>
</body>
</html>