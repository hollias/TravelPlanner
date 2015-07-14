<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" xmlns:v="urn:schemas-microsoft-com:vml">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>샘플코드</title>
<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=536c2905a6bd962c081f323cb29c5e05"></script>
<script type="text/javascript" src="${root}/js/jquery.js"></script>


</head>
<body>
<form action="MapSubmit.do" method="post">
<div id="map" style="border:1px solid #000;"></div>
<script type="text/javascript">


   
   
   

      /* $(function() {
              $('#btn').click(function() {
                alert("1");
                 var sendData = 'country=' + oTarget.getTitle();
                
                $.post("country.do", sendData, function(msg) {
                   $('#msg').html(msg);
                });
                return false;
             }); 
          }); */
/* 
       function appendItem(a) {
         $("#msg").html($(a).parent().parent().html());
         console.log($(a).parent().parent().html());
      }  */
   

     
     
     var oPoint = new nhn.api.map.LatLng(36.4851766,127.9984218);   // 초기 좌표
     var seoul = new nhn.api.map.LatLng(37.5666102,126.9783881);   // 서울 좌표
     var daejun = new nhn.api.map.LatLng(36.3504395,127.3849508);   // 대전 좌표
     var daegu = new nhn.api.map.LatLng(35.8713900,128.6017630);   // 대구 좌표
     var busan = new nhn.api.map.LatLng(35.1798159,129.0750222);   // 부산 좌표
     
     // 줌 레벨 값
     var defaultLevel = 11;
     // 지도 설정
     var oMap = new nhn.api.map.Map(document.getElementById('map'), {
           point : oPoint,                                         // 기본 위치
           zoom : 3,                                      // 줌 레벨
           enableWheelZoom : true,                        // 마우스 휠 동작으로 확대/축소 여부
           enableDragPan : true,                            // 마우스로 끌어서 지도를 이동할지 여부
           enableDblClickZoom : false,                   // 더블클릭으로 지도를 확대할지 여부
           mapMode : 0,                                        // 지도 모드 (0:일반, 1:겹침, 2:위성)
           activateTrafficMap : false,                      // 실시간 교통정보 활성화 여부
           activateBicycleMap : false,                    // 자전거 지도 활성화 여부
           minMaxLevel : [ 1, 14 ],                         // 지도의 최소/최대 축척 레벨
           size : new nhn.api.map.Size(1000, 600)    // 지도의 크기
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
     var oMarker1 = new nhn.api.map.Marker(oIcon, { title : 'seoul' });
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
     oMap.addOverlay(oMarker4);
     
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
                         '<table><tr id="item"><td><img src="image/car4.jpg"></td><td>'+oTarget.getTitle()+'<br>안녕하세요'+oTarget.getTitle()+' 입니다.<input id="btn" type="button" value="추가" onclick="appendItem()"><input type="hidden" class="local" value="'+oTarget.getTitle()+'" ></td></tr></table></span></div>');
                 mapInfoTestWindow.setPoint(oTarget.getPoint());
                 mapInfoTestWindow.setVisible(true);
                 mapInfoTestWindow.setPosition({right : 15, top : 30});
                 mapInfoTestWindow.autoPosition();
                 
                 
                    
                
                 
         }
         
         
         
     });
     function appendItem(){
        var opoint;        
        var local = $('.local').val();
        if(local == 'seoul'){           
           opoint = new nhn.api.map.LatLng(37.5666102,126.9783881);           
        }
        if(local == 'daejun'){           
           opoint = new nhn.api.map.LatLng(36.3504395,127.3849508);         
        }
        if(local == 'daegu'){           
           opoint = new nhn.api.map.LatLng(35.8713900,128.6017630);           
        }
        
        if(local == 'busan')
           opoint = new nhn.api.map.LatLng(35.1798159,129.0750222);
        
        
        var aPoints = oPolyline.getPoints(); // - 현재 폴리라인을 이루는 점을 가져와서 배열에 저장.
         aPoints.push(opoint); // - 추가하고자 하는 점을 추가하여 배열로 저장함.
         oPolyline.setPoints(aPoints); // - 해당 폴리라인에 배열에 저장된 점을 추가함
         
      var sendData = 'local='+local;
      $.ajaxSetup({
         type:"POST",
         url:"line.do",
         dataType:"text",
         success:function(msg){$('#msg').append(msg);}
      });
      $.ajax({data:sendData});
      return false;      
   }
     
     </script>
  
     <table><div id="msg"></div></table>
     <input type="submit" value="확인">
</form>
</body>
</html>