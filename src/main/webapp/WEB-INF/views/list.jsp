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
                        margin-top: -380px;
                    }

                    #menu_btn {
                        height: 380px;
                        width: 250px;
                    }
                </style>
                <link rel="shortcut icon" href="#">




            </head>

            <body class="is-preload">
                <div id="page-wrapper">


                    <!-- Header -->
                    <div id="header">

                        <!-- Logo -->
                        <h1>
                            <a href="index" id="logo">Recycle Map</a>
                        </h1>

                        <!-- Nav -->
                        <nav id="nav">
                            <ul>
                                <li><a href="index">홈</a></li>
                                <li><a href="list">지도</a></li>
                                <li><a href="material">재질별 분리배출</a></li>
                                <li><a href="item">품목별 분리배출</a></li>
                                <li><a href="quiz">퀴즈</a></li>
                            </ul>
                        </nav>
                    </div>

                    <div id="menu_btn">
                        <input type="text" id="home" onkeyup="if(window.event.keyCode==13){test()}"
                            style="border:1px solid #180e0e1c; radius background-color:#ffffff85; border-radius:5px;">
                        <br>
                        <button type="button" value="send" onclick="test()">현재위치 검색</button>
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

                    <div id="map" style="width: 100%; height: 700px;"></div>



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
                                // 지도종류
                            };

                        // 지도를 생성한다 
                        let map = new kakao.maps.Map(mapContainer, mapOption);
                        //var mapTypeControl = new kakao.maps.MapTypeControl();
                        //map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
                        //var zoomControl = new kakao.maps.ZoomControl();
                        //map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


                        //////////////////////////////////////////////////////////////

                        let geocoder = new kakao.maps.services.Geocoder();

                        function test() {
                            let address = document.getElementById('home').value;
                            //console.log(address);

                            // 주소로 좌표를 검색합니다
                            geocoder.addressSearch(address, function (result, status) {

                                // 정상적으로 검색이 완료됐으면 
                                if (status === kakao.maps.services.Status.OK) {

                                    coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                                    console.log(coords)
                                    //console.log(coords)

                                    // 결과값으로 받은 위치를 마커로 표시합니다
                                    let marker = new kakao.maps.Marker({
                                        map: map,
                                        position: coords
                                    });

                                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                                    let infowindow = new kakao.maps.InfoWindow({
                                        content: '<div style="width:150px;text-align:center;padding:6px 0;">현재 위치</div>'

                                    });
                                    infowindow.open(map, marker);

                                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                    map.setCenter(coords);
                                    map.setLevel(4);
                                }
                            });
                        }

                        //console.log(coords);
                        /////////////////////////////////////////////////////////////////지도 띄우는 코드

                        function loadList1() { ////////////////////////////////json 파일로 분리수거 데이터 가져오는 함수
                            $.ajax({
                                url: "trash", //요청 경로
                                type: "get", //요청 방식 (get/post)
                                dataType: "json",
                                success: listView1,
                                error: function () {
                                    alert("통신 실패")
                                }
                            })
                        }

                        function loadList2() { ////////////////////////////////json 파일로 폐형광등 데이터 가져오는 함수
                            $.ajax({
                                url: "lamp", //요청 경로
                                type: "get", //요청 방식 (get/post)
                                dataType: "json",
                                success: listView2,
                                error: function () {
                                    alert("통신 실패")
                                }
                            })
                        }

                        function loadList3() { ////////////////////////////////json 파일로 폐건전지 데이터 가져오는 함수
                            $.ajax({
                                url: "battery", //요청 경로
                                type: "get", //요청 방식 (get/post)
                                dataType: "json",
                                success: listView3,
                                error: function () {
                                    alert("통신 실패")
                                }
                            })
                        }

                        function loadList4() { ////////////////////////////////json 파일로 폐의약품 데이터 가져오는 함수
                            $.ajax({
                                url: "medicine", //요청 경로
                                type: "get", //요청 방식 (get/post)
                                dataType: "json",
                                success: listView4,
                                error: function () {
                                    alert("통신 실패")
                                }
                            })
                        }

                        function loadList5() { ////////////////////////////////json 파일로 의류수거함 데이터 가져오는 함수
                            $.ajax({
                                url: "clothes", //요청 경로
                                type: "get", //요청 방식 (get/post)
                                dataType: "json",
                                success: listView5,
                                error: function () {
                                    alert("통신 실패")
                                }
                            })
                        }

                        ////////////////////////////////////////////// 분리수거함 폐형광등 마커 띄우기
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


                            //console.log(positions)

                            // 마커 이미지의 이미지 주소입니다
                            let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

                            // 인포윈도우 객체 배열
                            //let infowindowArray = [];
                            
                            //let coo = document.getElementById("coords");
                                //console.log(coo);

                            for (let i = 0; i < positions.length; i++) {
                                let imageSize = new kakao.maps.Size(24, 35);
                                let markerImage = new kakao.maps.MarkerImage(imageSrc,
                                    imageSize);
                                let marker1 = new kakao.maps.Marker({
                                    map: map, // 마커를 표시할 지도
                                    position: positions[i].latlng, // 마커를 표시할 위치
                                    title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                                    image: markerImage

                                });

                                trashArr1.push(marker1) //  각 마커 리스트에 마커 추가
                                marker1.setMap(null)

                                //let add = positions[i].latlng
                                //console.log(add)

                                //let iwContent = '<div style="padding:5px;">' + positions[i].title// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                                //let iwContent = '<div style="padding:5px;">' + positions[i].title+'<a href="https://map.kakao.com/link/from/현재 위치,${coords}/to/'+positions[i].title+','+ positions[i].latlng +'" style="color:blue" target="_blank">길찾기</a></div>'
                                //'<a href="https://map.kakao.com/link/from/현재 위치,35.1508100801722,126.922184251176/to/'+positions[i].title+',33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>'
                                //let iwContent = '<div style="padding:5px;">' + positions[i].title+'<a href="https://map.kakao.com/link/from/현재 위치,${coords}/to/'+positions[i].title+','+ positions[i].latlng +'" style="color:blue" target="_blank">길찾기</a></div>'
                                //let iwContent = "<div style='padding:5px;'><a href='https://map.kakao.com/link/to/"+positions[i].title+","+positions[i].latlng.Ma + "," + positions[i].latlng.La +"' style='color:blue' target='_blank'>길찾기</a></div>"

                                
                                //console.log(coords.La);
                                //console.log(coords);

                                let iwContent =
                                    '<div style="padding:5px;">' + positions[i].title + '<a href="https://map.kakao.com/link/from/현재 위치,35.1508100801722,126.922184251176/to/' +
                                    positions[i].title + ',' + positions[i].latlng.Ma + ',' + positions[i].latlng.La + ' "style="color:blue" target="_blank">길찾기</a>';
                                //console.log(iwContent);
                                //console.log(positions[i].latlng.La)
                                //console.log(positions[i].latlng.Ma)
                                //let iwPosition = new kakao.maps.LatLng(positions[i].latlng.Ma,positions[i].latlng.La); //인포윈도우 표시 위치입니다
                                //console.log(marker1.latlng)

                                let infowindow = new kakao.maps.InfoWindow({
                                    //position: positions[i].latlng,
                                    content: iwContent,
                                    removable: true,
                                });

                                //<a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a>

                                kakao.maps.event.addListener(marker1, 'click', function () {
                                    infowindow.open(map, marker1);

                                });
                                //for, fun 대괄호
                            }
                        }

                        ///////////////////////////////////////////////////////////////////////// 폐형광등 마커 띄우기
                        function listView2(res) {

                            //for (let i = 0; i < res.length; i++) {
                            //   console.log(res[i].latitude + ',' + res[i].longitude)
                            //}

                            let positions = []
                            for (let i = 0; i < res.length; i++) {
                                let position = {
                                    title: res[i].address,
                                    latlng: new kakao.maps.LatLng(res[i].latitude,
                                        res[i].longitude)
                                }
                                positions.push(position)
                            }

                            //console.log(positions)

                            // 마커 이미지의 이미지 주소입니다
                            let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

                            for (let i = 0; i < positions.length; i++) {

                                // 마커 이미지의 이미지 크기 입니다
                                let imageSize = new kakao.maps.Size(24, 35);

                                // 마커 이미지를 생성합니다    
                                let markerImage = new kakao.maps.MarkerImage(imageSrc,
                                    imageSize);

                                // 마커를 생성합니다
                                let marker2 = new kakao.maps.Marker({
                                    map: map, // 마커를 표시할 지도
                                    position: positions[i].latlng, // 마커를 표시할 위치
                                    title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                                    image: markerImage
                                    // 마커 이미지 
                                });

                                lampArr2.push(marker2) //  각 마커 리스트에 마커 추가

                                marker2.setMap(null)
                                //marker.setMap(map)
                                //console.log(lampArr2)

                                let iwContent = '<div style="padding:5px;">' + positions[i].title // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                                //iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

                                // 인포윈도우를 생성합니다
                                let infowindow = new kakao.maps.InfoWindow({
                                    content: iwContent,
                                    removable: true
                                });


                                // 마커에 클릭이벤트를 등록합니다
                                kakao.maps.event.addListener(marker2, 'click', function () {
                                    // 마커 위에 인포윈도우를 표시합니다
                                    infowindow.open(map, marker2);

                                });




                            }

                        }

                        ///////////////////////////////////////////////////////////////////////// 폐건전지 마커 띄우기
                        function listView3(res) {

                            //for (let i = 0; i < res.length; i++) {
                            //   console.log(res[i].latitude + ',' + res[i].longitude)
                            //}

                            let positions = []
                            for (let i = 0; i < res.length; i++) {
                                let position = {
                                    title: res[i].address,
                                    latlng: new kakao.maps.LatLng(res[i].latitude,
                                        res[i].longitude)
                                }
                                positions.push(position)
                            }

                            //console.log(positions)

                            // 마커 이미지의 이미지 주소입니다
                            let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

                            for (let i = 0; i < positions.length; i++) {

                                // 마커 이미지의 이미지 크기 입니다
                                let imageSize = new kakao.maps.Size(24, 35);

                                // 마커 이미지를 생성합니다    
                                let markerImage = new kakao.maps.MarkerImage(imageSrc,
                                    imageSize);

                                // 마커를 생성합니다
                                let marker3 = new kakao.maps.Marker({
                                    map: map, // 마커를 표시할 지도
                                    position: positions[i].latlng, // 마커를 표시할 위치
                                    title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                                    image: markerImage
                                    // 마커 이미지 
                                });

                                batteryArr3.push(marker3) //  각 마커 리스트에 마커 추가

                                marker3.setMap(null)
                                //marker.setMap(map)
                                //console.log(batteryArr3)

                                let iwContent = '<div style="padding:5px;">' + positions[i].title// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

                                //let iwPosition = new kakao.maps.LatLng(positions[i].latlng.Ma,positions[i].latlng.La); //인포윈도우 표시 위치입니다

                                let infowindow = new kakao.maps.InfoWindow({
                                    //position: positions[i].latlng,
                                    content: iwContent,
                                    removable: true,
                                });

                                kakao.maps.event.addListener(marker3, 'click', function () {
                                    infowindow.open(map, marker3);

                                });
                            }

                        }

                        ///////////////////////////////////////////////////////////////////////// 폐건전지 마커 띄우기
                        function listView4(res) {

                            //for (let i = 0; i < res.length; i++) {
                            //console.log(res[i].latitude + ',' + res[i].longitude)
                            //}

                            let positions = []
                            for (let i = 0; i < res.length; i++) {
                                let position = {
                                    title: res[i].address,
                                    latlng: new kakao.maps.LatLng(res[i].latitude,
                                        res[i].longitude)
                                }
                                positions.push(position)
                            }

                            //console.log(positions)

                            // 마커 이미지의 이미지 주소입니다
                            //let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
                            let imageSrc = "resources/images/medicine.png";

                            for (let i = 0; i < positions.length; i++) {

                                // 마커 이미지의 이미지 크기 입니다
                                let imageSize = new kakao.maps.Size(24, 24);

                                // 마커 이미지를 생성합니다    
                                let markerImage = new kakao.maps.MarkerImage(imageSrc,
                                    imageSize);

                                // 마커를 생성합니다
                                let marker4 = new kakao.maps.Marker({
                                    map: map, // 마커를 표시할 지도
                                    position: positions[i].latlng, // 마커를 표시할 위치
                                    title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                                    image: markerImage
                                    // 마커 이미지 
                                });

                                medicineArr4.push(marker4) //  각 마커 리스트에 마커 추가

                                marker4.setMap(null)
                                //marker.setMap(map)
                                //console.log(medicineArr4)

                                let iwContent = '<div style="padding:5px;">' + positions[i].title// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

                                //let iwPosition = new kakao.maps.LatLng(positions[i].latlng.Ma,positions[i].latlng.La); //인포윈도우 표시 위치입니다

                                let infowindow = new kakao.maps.InfoWindow({
                                    //position: positions[i].latlng,
                                    content: iwContent,
                                    removable: true,
                                });

                                kakao.maps.event.addListener(marker4, 'click', function () {
                                    infowindow.open(map, marker4);

                                });
                            }

                        }

                        ///////////////////////////////////////////////////////////////////////// 폐건전지 마커 띄우기
                        function listView5(res) {

                            //for (let i = 0; i < res.length; i++) {
                            //console.log(res[i].latitude + ',' + res[i].longitude)
                            //}

                            let positions = []
                            for (let i = 0; i < res.length; i++) {
                                let position = {
                                    title: res[i].address,
                                    latlng: new kakao.maps.LatLng(res[i].latitude,
                                        res[i].longitude)
                                }
                                positions.push(position)
                            }


                            //console.log(positions)

                            // 마커 이미지의 이미지 주소입니다
                            let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

                            for (let i = 0; i < positions.length; i++) {

                                // 마커 이미지의 이미지 크기 입니다
                                let imageSize = new kakao.maps.Size(24, 35);

                                // 마커 이미지를 생성합니다    
                                let markerImage = new kakao.maps.MarkerImage(imageSrc,
                                    imageSize);

                                // 마커를 생성합니다
                                let marker5 = new kakao.maps.Marker({
                                    map: map, // 마커를 표시할 지도
                                    position: positions[i].latlng, // 마커를 표시할 위치
                                    title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                                    image: markerImage
                                    // 마커 이미지 
                                });

                                clothesArr5.push(marker5) //  각 마커 리스트에 마커 추가

                                marker5.setMap(null)
                                //marker.setMap(map)
                                //console.log(clothesArr5)

                                let iwContent = '<div style="padding:5px;">' + positions[i].title// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

                                //let iwPosition = new kakao.maps.LatLng(positions[i].latlng.Ma,positions[i].latlng.La); //인포윈도우 표시 위치입니다

                                let infowindow = new kakao.maps.InfoWindow({
                                    //position: positions[i].latlng,
                                    content: iwContent,
                                    removable: true,
                                });

                                kakao.maps.event.addListener(marker5, 'click', function () {
                                    infowindow.open(map, marker5);

                                });
                            }

                        }

                        ///////////////////////////////////////////////////////
                        function trash_btn() { //분리수거함 버튼 누를 시 본인 마커만 띄우기
                        	console.log(coords);
                        	
                            //console.log(trashArr1)

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

                        function lamp_btn() { //폐형광등 버튼 누를 시 본인 마커만 띄우기

                            //console.log(lampArr2)

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

                        function battery_btn() { //폐형광등 버튼 누를 시 본인 마커만 띄우기

                            //console.log(batteryArr3)

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

                        function medicine_btn() { //폐의약품 버튼 누를 시 본인 마커만 띄우기

                            //console.log(medicineArr4)

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

                        function clothes_btn() { //폐의약품 버튼 누를 시 본인 마커만 띄우기

                            //console.log(clothesArr5)

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
                    <div id="footer">
                        <div class="container">
                            <div class="row">
                                <section class="col-3 col-6-narrower col-12-mobilep"></section>
                            </div>
                        </div>

                        <!-- Icons -->
                        <ul class="icons">
                            <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                            <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a>
                            </li>
                            <li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
                            <li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a>
                            </li>
                            <li><a href="#" class="icon brands fa-google-plus-g"><span class="label">Google+</span></a>
                            </li>
                        </ul>

                        <!-- Copyright -->
                        <div class="copyright">
                            <ul class="menu">
                                <li>&copy; Untitled. All rights reserved</li>
                                <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                            </ul>
                        </div>

                    </div>

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