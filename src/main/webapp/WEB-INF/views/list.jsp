<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
<title>Recycle Map</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=96fa0336ba0e9190eea3854401eb131e&libraries=clusterer"></script>

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
			<button onclick="trash_btn()">분리수거</button>
			<button onclick="lamp_btn()">폐형광등</button>
			<button onclick="battery_btn()">폐건전지</button>
			<button onclick="medicine_btn()">폐의약품</button>
			<button onclick="clothes_btn()">의류수거함</button>
		</div>
		<div id="map" style="width: 100%; height: 600px;"></div>


		<script type="text/javascript">
			$(document).ready(function() {
				loadList1();
				loadList2();
				loadList3();
				loadList4();
				loadList5();
			});

			var trashArr1 = []; //분리수거함 마커
			var lampArr2 = []; //폐형광등함 마커
			var batteryArr3 = []; //폐건전지 마커
			var medicineArr4 = []; //폐의약품 마커
			var clothesArr5 = []; //의류수거함 마커

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	         mapOption = {
	            center : new kakao.maps.LatLng(36.511552, 128.012002), // 지도의 중심좌표
	            level : 12, // 지도의 확대 레벨
	            mapTypeId : kakao.maps.MapTypeId.ROADMAP
	         // 지도종류
	         };

			// 지도를 생성한다 
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
	         
			/////////////////////////////////////////////////////////////////지도 띄우는 코드

			function loadList1() { ////////////////////////////////json 파일로 분리수거 데이터 가져오는 함수
				$.ajax({
					url : "trash", //요청 경로
					type : "get", //요청 방식 (get/post)
					dataType : "json",
					success : listView1,
					error : function() {
						alert("통신 실패")
					}
				})
			}

			function loadList2() { ////////////////////////////////json 파일로 폐형광등 데이터 가져오는 함수
				$.ajax({
					url : "lamp", //요청 경로
					type : "get", //요청 방식 (get/post)
					dataType : "json",
					success : listView2,
					error : function() {
						alert("통신 실패")
					}
				})
			}

			function loadList3() { ////////////////////////////////json 파일로 폐건전지 데이터 가져오는 함수
				$.ajax({
					url : "battery", //요청 경로
					type : "get", //요청 방식 (get/post)
					dataType : "json",
					success : listView3,
					error : function() {
						alert("통신 실패")
					}
				})
			}

			function loadList4() { ////////////////////////////////json 파일로 폐의약품 데이터 가져오는 함수
				$.ajax({
					url : "medicine", //요청 경로
					type : "get", //요청 방식 (get/post)
					dataType : "json",
					success : listView4,
					error : function() {
						alert("통신 실패")
					}
				})
			}

			function loadList5() { ////////////////////////////////json 파일로 의류수거함 데이터 가져오는 함수
				$.ajax({
					url : "clothes", //요청 경로
					type : "get", //요청 방식 (get/post)
					dataType : "json",
					success : listView5,
					error : function() {
						alert("통신 실패")
					}
				})
			}

			////////////////////////////////////////////// 분리수거함 폐형광등 마커 띄우기
			function listView1(res) {

				var positions = []
				for (var i = 0; i < res.length; i++) {
					var position = {
						title : res[i].address,
						latlng : new kakao.maps.LatLng(res[i].latitude,
								res[i].longitude)
					}
					positions.push(position)
				}

				//console.log(positions)

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

				// 인포윈도우 객체 배열
				//var infowindowArray = [];
				
				for (var i = 0; i < positions.length; i++) {
					var imageSize = new kakao.maps.Size(24, 35);
					var markerImage = new kakao.maps.MarkerImage(imageSrc,
							imageSize);
					var marker = new kakao.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : positions[i].latlng, // 마커를 표시할 위치
						title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						image : markerImage
					});

					trashArr1.push(marker) //  각 마커 리스트에 마커 추가
					marker.setMap(null)
								
				}

			}

			///////////////////////////////////////////////////////////////////////// 폐형광등 마커 띄우기
			function listView2(res) {

				//for (var i = 0; i < res.length; i++) {
				//	console.log(res[i].latitude + ',' + res[i].longitude)
				//}

				var positions = []
				for (var i = 0; i < res.length; i++) {
					var position = {
						title : res[i].address,
						latlng : new kakao.maps.LatLng(res[i].latitude,
								res[i].longitude)
					}
					positions.push(position)
				}

				//console.log(positions)

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

				for (var i = 0; i < positions.length; i++) {

					// 마커 이미지의 이미지 크기 입니다
					var imageSize = new kakao.maps.Size(24, 35);

					// 마커 이미지를 생성합니다    
					var markerImage = new kakao.maps.MarkerImage(imageSrc,
							imageSize);

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : positions[i].latlng, // 마커를 표시할 위치
						title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						image : markerImage
					// 마커 이미지 
					});

					lampArr2.push(marker) //  각 마커 리스트에 마커 추가

					marker.setMap(null)
					//marker.setMap(map)
					//console.log(lampArr2)
				}

			}

			///////////////////////////////////////////////////////////////////////// 폐건전지 마커 띄우기
			function listView3(res) {

				//for (var i = 0; i < res.length; i++) {
				//	console.log(res[i].latitude + ',' + res[i].longitude)
				//}

				var positions = []
				for (var i = 0; i < res.length; i++) {
					var position = {
						title : res[i].address,
						latlng : new kakao.maps.LatLng(res[i].latitude,
								res[i].longitude)
					}
					positions.push(position)
				}

				//console.log(positions)

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

				for (var i = 0; i < positions.length; i++) {

					// 마커 이미지의 이미지 크기 입니다
					var imageSize = new kakao.maps.Size(24, 35);

					// 마커 이미지를 생성합니다    
					var markerImage = new kakao.maps.MarkerImage(imageSrc,
							imageSize);

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : positions[i].latlng, // 마커를 표시할 위치
						title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						image : markerImage
					// 마커 이미지 
					});

					batteryArr3.push(marker) //  각 마커 리스트에 마커 추가

					marker.setMap(null)
					//marker.setMap(map)
					//console.log(batteryArr3)
				}

			}

			///////////////////////////////////////////////////////////////////////// 폐건전지 마커 띄우기
			function listView4(res) {

				//for (var i = 0; i < res.length; i++) {
				//console.log(res[i].latitude + ',' + res[i].longitude)
				//}

				var positions = []
				for (var i = 0; i < res.length; i++) {
					var position = {
						title : res[i].address,
						latlng : new kakao.maps.LatLng(res[i].latitude,
								res[i].longitude)
					}
					positions.push(position)
				}

				//console.log(positions)

				// 마커 이미지의 이미지 주소입니다
				//var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
				var imageSrc = "resources/images/medicine.png";

				for (var i = 0; i < positions.length; i++) {

					// 마커 이미지의 이미지 크기 입니다
					var imageSize = new kakao.maps.Size(24, 24);

					// 마커 이미지를 생성합니다    
					var markerImage = new kakao.maps.MarkerImage(imageSrc,
							imageSize);

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : positions[i].latlng, // 마커를 표시할 위치
						title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						image : markerImage
					// 마커 이미지 
					});

					medicineArr4.push(marker) //  각 마커 리스트에 마커 추가

					marker.setMap(null)
					//marker.setMap(map)
					//console.log(medicineArr4)
				}

			}

			///////////////////////////////////////////////////////////////////////// 폐건전지 마커 띄우기
			function listView5(res) {

				//for (var i = 0; i < res.length; i++) {
				//console.log(res[i].latitude + ',' + res[i].longitude)
				//}

				var positions = []
				for (var i = 0; i < res.length; i++) {
					var position = {
						title : res[i].address,
						latlng : new kakao.maps.LatLng(res[i].latitude,
								res[i].longitude)
					}
					positions.push(position)
				}

				//console.log(positions)

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

				for (var i = 0; i < positions.length; i++) {

					// 마커 이미지의 이미지 크기 입니다
					var imageSize = new kakao.maps.Size(24, 35);

					// 마커 이미지를 생성합니다    
					var markerImage = new kakao.maps.MarkerImage(imageSrc,
							imageSize);

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : positions[i].latlng, // 마커를 표시할 위치
						title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						image : markerImage
					// 마커 이미지 
					});

					clothesArr5.push(marker) //  각 마커 리스트에 마커 추가

					marker.setMap(null)
					//marker.setMap(map)
					//console.log(clothesArr5)
				}

			}

			///////////////////////////////////////////////////////
			function trash_btn() { //분리수거함 버튼 누를 시 본인 마커만 띄우기

				//console.log(trashArr1)

				for (var i = 0; i < trashArr1.length; i++) {
					trashArr1[i].setMap(map)
				}

				for (var i = 0; i < lampArr2.length; i++) {
					lampArr2[i].setMap(null)
				}

				for (var i = 0; i < batteryArr3.length; i++) {
					batteryArr3[i].setMap(null)
				}

				for (var i = 0; i < medicineArr4.length; i++) {
					medicineArr4[i].setMap(null)
				}

				for (var i = 0; i < clothesArr5.length; i++) {
					clothesArr5[i].setMap(null)
				}

			}

			function lamp_btn() { //폐형광등 버튼 누를 시 본인 마커만 띄우기

				//console.log(lampArr2)

				for (var i = 0; i < trashArr1.length; i++) {
					trashArr1[i].setMap(null)
				}

				for (var i = 0; i < lampArr2.length; i++) {
					lampArr2[i].setMap(map)
				}

				for (var i = 0; i < batteryArr3.length; i++) {
					batteryArr3[i].setMap(null)
				}

				for (var i = 0; i < medicineArr4.length; i++) {
					medicineArr4[i].setMap(null)
				}

				for (var i = 0; i < clothesArr5.length; i++) {
					clothesArr5[i].setMap(null)
				}

			}

			function battery_btn() { //폐형광등 버튼 누를 시 본인 마커만 띄우기

				//console.log(batteryArr3)

				for (var i = 0; i < trashArr1.length; i++) {
					trashArr1[i].setMap(null)
				}

				for (var i = 0; i < lampArr2.length; i++) {
					lampArr2[i].setMap(null)
				}

				for (var i = 0; i < batteryArr3.length; i++) {
					batteryArr3[i].setMap(map)
				}

				for (var i = 0; i < medicineArr4.length; i++) {
					medicineArr4[i].setMap(null)
				}

				for (var i = 0; i < clothesArr5.length; i++) {
					clothesArr5[i].setMap(null)
				}

			}

			function medicine_btn() { //폐의약품 버튼 누를 시 본인 마커만 띄우기

				//console.log(medicineArr4)

				for (var i = 0; i < trashArr1.length; i++) {
					trashArr1[i].setMap(null)
				}

				for (var i = 0; i < lampArr2.length; i++) {
					lampArr2[i].setMap(null)
				}

				for (var i = 0; i < batteryArr3.length; i++) {
					batteryArr3[i].setMap(null)
				}

				for (var i = 0; i < medicineArr4.length; i++) {
					medicineArr4[i].setMap(map)
				}

				for (var i = 0; i < clothesArr5.length; i++) {
					clothesArr5[i].setMap(null)
				}

			}

			function clothes_btn() { //폐의약품 버튼 누를 시 본인 마커만 띄우기

				//console.log(clothesArr5)

				for (var i = 0; i < trashArr1.length; i++) {
					trashArr1[i].setMap(null)
				}

				for (var i = 0; i < lampArr2.length; i++) {
					lampArr2[i].setMap(null)
				}

				for (var i = 0; i < batteryArr3.length; i++) {
					batteryArr3[i].setMap(null)
				}

				for (var i = 0; i < medicineArr4.length; i++) {
					medicineArr4[i].setMap(null)
				}

				for (var i = 0; i < clothesArr5.length; i++) {
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
				<li><a href="#" class="icon brands fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-github"><span
						class="label">GitHub</span></a></li>
				<li><a href="#" class="icon brands fa-linkedin-in"><span
						class="label">LinkedIn</span></a></li>
				<li><a href="#" class="icon brands fa-google-plus-g"><span
						class="label">Google+</span></a></li>
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