let trashMarkers = [], lampMarkers = [], batteryMarkers = [], medicineMarkers = [], clothesMarkers = [];
let map, geocoder, currentLocationMarker = null, currentLocationInfowindow = null;

// 지도 초기화 함수
function initializeMap() {
    let mapContainer = document.getElementById('map');
    let mapOptions = {
        center: new kakao.maps.LatLng(36.511552, 128.012002),
        level: 12,
        mapTypeId: kakao.maps.MapTypeId.ROADMAP
    };
    map = new kakao.maps.Map(mapContainer, mapOptions);
    geocoder = new kakao.maps.services.Geocoder();
}

// 주소 검색 함수
function searchLocation() {
    let address = document.getElementById('home').value;
    geocoder.addressSearch(address, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            let coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 기존 마커와 인포윈도우 제거
            if (currentLocationMarker !== null) {
                currentLocationMarker.setMap(null);
                currentLocationMarker = null;
            }
            if (currentLocationInfowindow !== null) {
                currentLocationInfowindow.close();
                currentLocationInfowindow = null;
            }

            // 새로운 마커와 인포윈도우 생성
            currentLocationMarker = new kakao.maps.Marker({ map: map, position: coords });
            currentLocationInfowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;font-size:14px;">현재 위치</div>',
                level: 4
            });
            currentLocationInfowindow.open(map, currentLocationMarker);
            map.setCenter(coords);
            map.setLevel(4);
        }
    });
}

// 마커 로드 함수
// 지도 페이지 로드 시 실행하는 비동기함수
// 50라인 중 배열 내용 반복문 돌면서 /trash 통신 성공하면 displayMarkers 함수 실행
function loadMarkers(type) {
    $.ajax({
        url: type, 
        type: 'get',
        dataType: 'json',
        success: function(res) { displayMarkers(res, type);},
        error: function() { alert('통신 실패'); }
    });
}

// 마커 표시 함수
function displayMarkers(res, type) {
    let positions = res.map(item => ({
        title: item.address,
        latlng: new kakao.maps.LatLng(item.latitude, item.longitude)
    }));
    let markerImageSrc = {
        trash: 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png',
        lamp: 'resources/images/mapgreen.png',
        battery: 'resources/images/blue.png',
        medicine: 'resources/images/mapyellow.png',
        clothes: 'resources/images/clothesM2.png'
    }[type];
    let markerArray = {
        trash: trashMarkers,
        lamp: lampMarkers,
        battery: batteryMarkers,
        medicine: medicineMarkers,
        clothes: clothesMarkers
    }[type];
    let markerSize = new kakao.maps.Size(27, 30);

    positions.forEach((pos, i) => {
        let marker = new kakao.maps.Marker({
            map: map,
            position: pos.latlng,
            title: pos.title,
            image: new kakao.maps.MarkerImage(markerImageSrc, markerSize)
        });
        markerArray.push(marker);
        marker.setMap(null);
        let infowindow = new kakao.maps.InfoWindow({
            content: `<div style="padding:5px;font-size:13px;width:250px;">${pos.title} <a href="https://map.kakao.com/link/to/${pos.title},${pos.latlng.Ma},${pos.latlng.La}" style="color:blue" target="_blank">길찾기</a></div>`,
            removable: true
        });

        // 마커 클릭 이벤트 리스너 추가
        kakao.maps.event.addListener(marker, 'click', function() {
            if (infowindow.getMap()) {
                infowindow.close(); // 인포윈도우 닫기
            } else {
                infowindow.open(map, marker); // 인포윈도우 열기
            }
        });
    });
}

// 마커 토글 함수
function toggleMarkers(type) {
    ['trash', 'lamp', 'battery', 'medicine', 'clothes'].forEach(t => {
        let markerArray = {
            trash: trashMarkers,
            lamp: lampMarkers,
            battery: batteryMarkers,
            medicine: medicineMarkers,
            clothes: clothesMarkers
        }[t];
        markerArray.forEach(marker => marker.setMap(t === type ? map : null));
    });
}

// 지도 초기화 실행
initializeMap();

/*
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page session="false" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE HTML>

            <html>

            <head>
                <title>Recycle Map</title>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
                <link rel="stylesheet" href="resources/css/main.css" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
                <script type="text/javascript"
                    src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=96fa0336ba0e9190eea3854401eb131e&libraries=clusterer,services"></script>

                <style type="text/css">
                    #map {
                        margin-top: -400px;
                    }

                    #menu_btn {
                        height: 400px;
                        width: 200px;
                    }
             
                    
                    #search{
                    	background-color: #BDBDBD;
                    }
                    
                    #home{
                    	font-size: 13px;
                    	width : 160px;
                    	height : 30px;
                    	margin:15px;
                    }
                </style>
                
                	
                <link rel="shortcut icon" href="#">

            </head>

            <body class="is-preload">
                <div id="page-wrapper">


                    <!-- Header -->
      				<jsp:include page="header.jsp"></jsp:include>

                    <div id="menu_btn">
                        <input type="text" id="home" onkeyup="if(window.event.keyCode==13){test()}"
                            style="border:1px solid #180e0e1c; radius background-color:#ffffff85; border-radius:5px;">
                        <br>
                        <button type="button" value="send" id="search" onclick="test()">현재위치 검색</button>
                        <br>
                        <button onclick="trash_btn()">분리수거</button>
                        <br>
                        <button onclick="lamp_btn()">폐형광등</button>
                        <br>
                        <button onclick="battery_btn()">폐건전지</button>
                        <br>
                        <button onclick="medicine_btn()">폐의약품</button>
                        <br>
                        <button onclick="clothes_btn()">의류수거함</button>
                        <br>
                    </div>

                    <div id="map" style="width: 100%; height: 705px;"></div>

                    <script type="text/javascript">
                        $(document).ready(function () {
                            loadList1();
                            loadList2();
                            loadList3();
                            loadList4();
                            loadList5();
                        });

                        let trashArr1 = []; //분리수거함 마커
                        let lampArr2 = []; //폐형광등함 마커
                        let batteryArr3 = []; //폐건전지 마커
                        let medicineArr4 = []; //폐의약품 마커
                        let clothesArr5 = []; //의류수거함 마커
                        
                        let coords = null; //위치

                        let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                            mapOption = {
                                center: new kakao.maps.LatLng(36.511552, 128.012002), // 지도의 중심좌표
                                level: 12, // 지도의 확대 레벨
                                mapTypeId: kakao.maps.MapTypeId.ROADMAP
                            };

                        let map = new kakao.maps.Map(mapContainer, mapOption);

                        let geocoder = new kakao.maps.services.Geocoder();

                        function test() {
                            let address = document.getElementById('home').value;
                            geocoder.addressSearch(address, function (result, status) {

                                if (status === kakao.maps.services.Status.OK) {
                                    coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                                    console.log(coords)
                                    let marker = new kakao.maps.Marker({
                                        map: map,
                                        position: coords
                                    });
                                    let infowindow = new kakao.maps.InfoWindow({
                                        content: '<div style="width:150px;text-align:center;padding:6px 0;font-size:14px;">현재 위치</div>'

                                    });
                                    infowindow.open(map, marker);
                                    map.setCenter(coords);
                                    map.setLevel(5);
                                }
                            });
                        }

                        function loadList1() { 
                            $.ajax({
                                url: "trash", 
                                type: "get", 
                                dataType: "json",
                                success: listView1,
                                error: function () {
                                    alert("통신 실패")
                                }
                            })
                        }

                        function loadList2() { 
                            $.ajax({
                                url: "lamp", 
                                type: "get", 
                                dataType: "json",
                                success: listView2,
                                error: function () {
                                    alert("통신 실패")
                                }
                            })
                        }

                        function loadList3() { 
                            $.ajax({
                                url: "battery", 
                                type: "get", 
                                dataType: "json",
                                success: listView3,
                                error: function () {
                                    alert("통신 실패")
                                }
                            })
                        }

                        function loadList4() {
                            $.ajax({
                                url: "medicine", 
                                type: "get", 
                                dataType: "json",
                                success: listView4,
                                error: function () {
                                    alert("통신 실패")
                                }
                            })
                        }

                        function loadList5() {
                            $.ajax({
                                url: "clothes",
                                type: "get",
                                dataType: "json",
                                success: listView5,
                                error: function () {
                                    alert("통신 실패")
                                }
                            })
                        }

                        function listView1(res) {
                        	console.log(coords);
                        	
                            let positions = []
                            for (let i = 0; i < res.length; i++) {
                                let position = {
                                    title: res[i].address,
                                    latlng: new kakao.maps.LatLng(res[i].latitude,
                                        res[i].longitude)
                                }
                                positions.push(position)
                            }
                            
                            let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

                            for (let i = 0; i < positions.length; i++) {
                                let imageSize = new kakao.maps.Size(24, 35);
                                let markerImage = new kakao.maps.MarkerImage(imageSrc,
                                    imageSize);
                                let marker1 = new kakao.maps.Marker({
                                    map: map,
                                    position: positions[i].latlng,
                                    title: positions[i].title, 
                                    image: markerImage

                                });

                                trashArr1.push(marker1) 
                                marker1.setMap(null)
								let id = "infoBox" + i ;
                                let iwContent =
                                    '<div id='+ id +'" style="padding:5px;font-size:13px;width:250px;">' +
                                    	'<p style="margin:0; text-align: center;">'+ positions[i].title +'</p>'+
                                    	'<a href="https://map.kakao.com/link/to/' + positions[i].title + ',' + positions[i].latlng.Ma + ',' + positions[i].latlng.La + ' "style="color:blue" target="_blank">길찾기</a>' +
                                    '</div>';
                                
                                let infowindow = new kakao.maps.InfoWindow({
                                    content: iwContent,
                                    removable: true,
                                });
                                kakao.maps.event.addListener(marker1, 'click', function () {
                                    infowindow.open(map, marker1);

                                });
                            }
                        }

                        function listView2(res) {

                            let positions = []
                            for (let i = 0; i < res.length; i++) {
                                let position = {
                                    title: res[i].address,
                                    latlng: new kakao.maps.LatLng(res[i].latitude,
                                        res[i].longitude)
                                }
                                positions.push(position)
                            }

                            let imageSrc = "resources/images/mapgreen.png";

                            for (let i = 0; i < positions.length; i++) {

                                let imageSize = new kakao.maps.Size(35, 35);

                                let markerImage = new kakao.maps.MarkerImage(imageSrc,
                                    imageSize);

                                let marker2 = new kakao.maps.Marker({
                                    map: map, 
                                    position: positions[i].latlng, 
                                    title: positions[i].title, 
                                    image: markerImage
                                });

                                lampArr2.push(marker2) 

                                marker2.setMap(null)

                                let iwContent =
                                    '<div style="padding:5px;font-size:13px;width:250px;">' + positions[i].title + '<a href="https://map.kakao.com/link/to/' +
                                    positions[i].title + ',' + positions[i].latlng.Ma + ',' + positions[i].latlng.La + ' "style="color:blue" target="_blank"> 길찾기</a>';

                                let infowindow = new kakao.maps.InfoWindow({
                                    content: iwContent,
                                    removable: true
                                });


                                kakao.maps.event.addListener(marker2, 'click', function () {
                                    infowindow.open(map, marker2);
                                });
                            }

                        }

                        function listView3(res) {

                            let positions = []
                            for (let i = 0; i < res.length; i++) {
                                let position = {
                                    title: res[i].address,
                                    latlng: new kakao.maps.LatLng(res[i].latitude,
                                        res[i].longitude)
                                }
                                positions.push(position)
                            }

                            let imageSrc = "resources/images/blue.png";

                            for (let i = 0; i < positions.length; i++) {

                                let imageSize = new kakao.maps.Size(35, 35);

                                let markerImage = new kakao.maps.MarkerImage(imageSrc,
                                    imageSize);

                                let marker3 = new kakao.maps.Marker({
                                    map: map,
                                    position: positions[i].latlng, 
                                    title: positions[i].title, 
                                    image: markerImage
                                });

                                batteryArr3.push(marker3)

                                marker3.setMap(null)

                               let iwContent =
                                    '<div style="padding:5px;font-size:13px;width:250px;">' + positions[i].title + '<a href="https://map.kakao.com/link/to/' +
                                    positions[i].title + ',' + positions[i].latlng.Ma + ',' + positions[i].latlng.La + ' "style="color:blue" target="_blank">길찾기</a>';

                                let infowindow = new kakao.maps.InfoWindow({
                                    content: iwContent,
                                    removable: true,
                                });

                                kakao.maps.event.addListener(marker3, 'click', function () {
                                    infowindow.open(map, marker3);

                                });
                            }

                        }

                        function listView4(res) {

                            let positions = []
                            for (let i = 0; i < res.length; i++) {
                                let position = {
                                    title: res[i].address,
                                    latlng: new kakao.maps.LatLng(res[i].latitude,
                                        res[i].longitude)
                                }
                                positions.push(position)
                            }

                            let imageSrc = "resources/images/mapyellow.png";

                            for (let i = 0; i < positions.length; i++) {

                                let imageSize = new kakao.maps.Size(30, 30);

                                let markerImage = new kakao.maps.MarkerImage(imageSrc,
                                    imageSize);

                                let marker4 = new kakao.maps.Marker({
                                    map: map,
                                    position: positions[i].latlng,
                                    title: positions[i].title,
                                    image: markerImage
                                });

                                medicineArr4.push(marker4) 

                                marker4.setMap(null)

                                 let iwContent =
                                    '<div style="padding:5px;font-size:13px;width:250px;">' + positions[i].title + '<a href="https://map.kakao.com/link/to/' +
                                    positions[i].title + ',' + positions[i].latlng.Ma + ',' + positions[i].latlng.La + ' "style="color:blue" target="_blank">길찾기</a>';


                                let infowindow = new kakao.maps.InfoWindow({
                                    content: iwContent,
                                    removable: true,
                                });

                                kakao.maps.event.addListener(marker4, 'click', function () {
                                    infowindow.open(map, marker4);

                                });
                            }
                        }

                        function listView5(res) {

                            let positions = []
                            for (let i = 0; i < res.length; i++) {
                                let position = {
                                    title: res[i].address,
                                    latlng: new kakao.maps.LatLng(res[i].latitude,
                                        res[i].longitude)
                                }
                                positions.push(position)
                            }
                            let imageSrc = "resources/images/clothesM2.png";

                            for (let i = 0; i < positions.length; i++) {

                                let imageSize = new kakao.maps.Size(30, 30);

                                let markerImage = new kakao.maps.MarkerImage(imageSrc,
                                    imageSize);

                                let marker5 = new kakao.maps.Marker({
                                    map: map,
                                    position: positions[i].latlng,
                                    title: positions[i].title,
                                    image: markerImage
                                });

                                clothesArr5.push(marker5)

                                marker5.setMap(null)

                                 let iwContent =
                                    '<div style="padding:5px;font-size:13px;width:250px;">' + positions[i].title + '<a href="https://map.kakao.com/link/to/' +
                                    positions[i].title + ',' + positions[i].latlng.Ma + ',' + positions[i].latlng.La + ' "style="color:blue" target="_blank">길찾기</a>';


                                let infowindow = new kakao.maps.InfoWindow({
                                    content: iwContent,
                                    removable: true,
                                });

                                kakao.maps.event.addListener(marker5, 'click', function () {
                                    infowindow.open(map, marker5);

                                });
                            }
                        }

                        function trash_btn() {
                        	console.log(coords);
                        	
                            for (let i = 0; i < trashArr1.length; i++) {
                                trashArr1[i].setMap(map)
                            }

                            for (let i = 0; i < lampArr2.length; i++) {
                                lampArr2[i].setMap(null)
                            }

                            for (let i = 0; i < batteryArr3.length; i++) {
                                batteryArr3[i].setMap(null)
                            }

                            for (let i = 0; i < medicineArr4.length; i++) {
                                medicineArr4[i].setMap(null)
                            }

                            for (let i = 0; i < clothesArr5.length; i++) {
                                clothesArr5[i].setMap(null)
                            }
                        }

                        function lamp_btn() { 


                            for (let i = 0; i < trashArr1.length; i++) {
                                trashArr1[i].setMap(null)
                            }

                            for (let i = 0; i < lampArr2.length; i++) {
                                lampArr2[i].setMap(map)
                            }

                            for (let i = 0; i < batteryArr3.length; i++) {
                                batteryArr3[i].setMap(null)
                            }

                            for (let i = 0; i < medicineArr4.length; i++) {
                                medicineArr4[i].setMap(null)
                            }

                            for (let i = 0; i < clothesArr5.length; i++) {
                                clothesArr5[i].setMap(null)
                            }
                        }

                        function battery_btn() { 


                            for (let i = 0; i < trashArr1.length; i++) {
                                trashArr1[i].setMap(null)
                            }

                            for (let i = 0; i < lampArr2.length; i++) {
                                lampArr2[i].setMap(null)
                            }

                            for (let i = 0; i < batteryArr3.length; i++) {
                                batteryArr3[i].setMap(map)
                            }

                            for (let i = 0; i < medicineArr4.length; i++) {
                                medicineArr4[i].setMap(null)
                            }

                            for (let i = 0; i < clothesArr5.length; i++) {
                                clothesArr5[i].setMap(null)
                            }

                        }

                        function medicine_btn() { 

                            for (let i = 0; i < trashArr1.length; i++) {
                                trashArr1[i].setMap(null)
                            }

                            for (let i = 0; i < lampArr2.length; i++) {
                                lampArr2[i].setMap(null)
                            }

                            for (let i = 0; i < batteryArr3.length; i++) {
                                batteryArr3[i].setMap(null)
                            }

                            for (let i = 0; i < medicineArr4.length; i++) {
                                medicineArr4[i].setMap(map)
                            }

                            for (let i = 0; i < clothesArr5.length; i++) {
                                clothesArr5[i].setMap(null)
                            }

                        }

                        function clothes_btn() { 

                            for (let i = 0; i < trashArr1.length; i++) {
                                trashArr1[i].setMap(null)
                            }

                            for (let i = 0; i < lampArr2.length; i++) {
                                lampArr2[i].setMap(null)
                            }

                            for (let i = 0; i < batteryArr3.length; i++) {
                                batteryArr3[i].setMap(null)
                            }

                            for (let i = 0; i < medicineArr4.length; i++) {
                                medicineArr4[i].setMap(null)
                            }

                            for (let i = 0; i < clothesArr5.length; i++) {
                                clothesArr5[i].setMap(map)
                            }

                        }
                    </script>

         			<!-- Footer -->
      				<jsp:include page="footer.jsp"></jsp:include>

                </div>

                <!-- Scripts -->
                <script src="resources/js/jquery.min.js"></script>
                <script src="resources/js/jquery.dropotron.min.js"></script>
                <script src="resources/js/browser.min.js"></script>
                <script src="resources/js/breakpoints.min.js"></script>
                <script src="resources/js/util.js"></script>
                <script src="resources/js/main.js"></script>


            </body>

            </html>

*/



