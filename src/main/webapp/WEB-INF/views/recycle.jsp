<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript"
        src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=ae920b384376675a231cf06feed28056&libraries=clusterer"></script>
   <!--   <link rel="stylesheet" href="./map1.css" /> -->
    <style>
       
    </style>
</head>

<body>
    <div id="inner">
        <div id="menu">
            <div id="menu_box1">
                <button id="trash" onclick="coll()">분리수거</button>
                <button id="lamp">폐형광등</button>
                <button id="battery">폐건전지</button>
            </div>
            <div id="menu_box2">
                <button id="medicine">폐의약품</button>
                <button id="clothes">의류수거함</button>
                <button id="mi">미정</button> 
            </div>

        </div>
        <div id="map"></div>  <!-- 이게 머지? -->
    </div>
    
    <!-- 여기서부터 아예 안 먹히네 -->
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(35.149839, 126.919983), // 지도의 중심좌표
                level: 10, // 지도의 확대 레벨
                mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
            };

        // 지도를 생성한다 
        var map = new kakao.maps.Map(mapContainer, mapOption);


        // 클릭 시 분리수거 마커 표시 함수
        const coll = () => {
            // 마커 클러스터러를 생성합니다 
            var clusterer = new kakao.maps.MarkerClusterer({
                map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
                averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
                minLevel: 10 // 클러스터 할 최소 지도 레벨 
            });

           
      
            var data = [
                // [35.149839, 126.919983, '<div style="padding:5px;">현위치</div>'],
                [36.5697495, 127.5963358 ],
                [36.5730609, 127.5132062],
                [36.5927665, 127.5298362],
                [36.5891474, 127.6094229],
                [36.6627497, 127.6219221]
                // [ , , '<div style="padding:5px;"></div>']
                // [ , , '<div style="padding:5px;"></div>']
                // [ , , '<div style="padding:5px;"></div>']
                // [ , , '<div style="padding:5px;"></div>']
                // [ , , '<div style="padding:5px;"></div>']
                // [ , , '<div style="padding:5px;"></div>']
                // [ , , '<div style="padding:5px;"></div>']
            ]

            var markers = [];

            for (var i = 0; i < data.length; i++) {
                // 지도에 마커를 생성하고 표시한다
                var marker = new kakao.maps.Marker({
                    position: new kakao.maps.LatLng(data[i][0], data[i][1]), // 마커의 좌표
                    map: map // 마커를 표시할 지도 객체
                });

                var iwContent = '<div style="padding:5px;">현위치</div>';

                // 인포윈도우를 생성합니다
                var infowindow = new kakao.maps.InfoWindow({
                });

               

            }

            // 클러스터러에 마커들을 추가합니다
            clusterer.addMarkers(markers);

            // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
            function makeOverListener(map, marker, infowindow) {
                return function () {
                    infowindow.open(map, marker);
                };
            }

            // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
            function makeOutListener(infowindow) {
                return function () {
                    infowindow.close();
                };
            }
        }

        const getCurrentCoordinate = async () => {
            console.log("getCurrentCoordinate 함수 실행!!!");
            return new Promise((res, rej) => {
                // HTML5의 geolocaiton으로 사용할 수 있는지 확인합니다.
                if (navigator.geolocation) {
                    // GeoLocation을 이용해서 접속 위치를 얻어옵니다.
                    navigator.geolocation.getCurrentPosition(function (position) {
                        console.log(position);
                        const lat = position.coords.latitude; // 위도
                        const lon = position.coords.longitude; // 경도

                        const coordinate = new kakao.maps.LatLng(lat, lon);
                        res(coordinate);
                    });
                } else {
                    rej(new Error("현재 위치를 불러올 수 없습니다."));
                }
            });
        };







    </script>
</body>

</html>
