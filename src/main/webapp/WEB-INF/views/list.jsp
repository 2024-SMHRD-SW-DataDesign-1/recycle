<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
        src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=96fa0336ba0e9190eea3854401eb131e&libraries=clusterer"></script>
</head>
<body>
	
	<button onclick="set()">분리수거</button>

	<div id="map" style="width:100%;height:350px;"></div> 

	
	<script type="text/javascript">

		$(document).ready(function(){
			loadList()
		})

		var markerArr1=[];  //분리수거함 마커
		var markerArr2=[];  //폐건전지함 마커
		
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(35.149839, 126.919983), // 지도의 중심좌표
                level: 10, // 지도의 확대 레벨
                mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
            };

        // 지도를 생성한다 
        var map = new kakao.maps.Map(mapContainer, mapOption);


		function loadList(){
			// 게시물 전체 데이처 요청하는 함수 (비동기 통신)
			$.ajax({
				url:"trash", //요청 경로
				type:"get", //요청 방식 (get/post)
				dataType:"json",
				success : listView,
					//성공했을 때 응답이 일어나는 데이터를 함수()에 임의적으로 지정
					// 즉 data는 서버에서 응답한 데이터임
					// data에는 테이블 형태의 html를 넣겠다 라고 한 listView 함수를 호출한 거임
		
				error : function(){
					alert("통신 실패")
				}
				// 콘솔창에 network 들어가서 Request URL 확인해야함! why? 비동기 통신이라!!!
			
			})
			
			
			
		}
	
		function listView(res){
	
			for(var i=0; i<res.length; i++){
				console.log(res[i].latitude+','+res[i].longitude)
			}
			
			var positions = []
			for(var i=0; i<res.length; i++){
				var position =  {
				    title: '테스트', 
				    latlng: new kakao.maps.LatLng(res[i].latitude, res[i].longitude)
				}
				positions.push(position)
			}
			
			console.log(positions)
			
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			    
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			    
			    markerArr1.push(marker)   //  각 마커 리스트에 마커 추가
			    
			    marker.setMap(null)
			    //marker.setMap(map)
			    console.log(markerArr1)
			}
			
			
			

		}
		
		
		function set(){ //분리수거함
			
			console.log(markerArr1)
			
			for (var i = 0; i < markerArr1.length; i ++) {
			    markerArr1[i].setMap(map)
			    
			   	//marker.setMap(map)
			}
			
			for(var i=0; i<markerArr2.length; i++){
				 markerArr2[i].setMap(null)
			}
			
			
			
		}
		
		
		
	</script>



</body>
</html>


