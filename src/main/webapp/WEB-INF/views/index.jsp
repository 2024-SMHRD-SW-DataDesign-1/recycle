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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=96fa0336ba0e9190eea3854401eb131e&libraries=clusterer"></script>

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

			<button onclick="set()">분리수거</button>

			<div id="map" style="width: 100%; height: 350px;"></div>


			<script type="text/javascript">
				$(document).ready(function() {
					loadList()
				})

				var markerArr1 = []; //분리수거함 마커
				var markerArr2 = []; //폐건전지함 마커

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(35.149839, 126.919983), // 지도의 중심좌표
					level : 10, // 지도의 확대 레벨
					mapTypeId : kakao.maps.MapTypeId.ROADMAP
				// 지도종류
				};

				// 지도를 생성한다 
				var map = new kakao.maps.Map(mapContainer, mapOption);

				function loadList() {
					// 게시물 전체 데이처 요청하는 함수 (비동기 통신)
					$.ajax({
						url : "trash", //요청 경로
						type : "get", //요청 방식 (get/post)
						dataType : "json",
						success : listView,
						//성공했을 때 응답이 일어나는 데이터를 함수()에 임의적으로 지정
						// 즉 data는 서버에서 응답한 데이터임
						// data에는 테이블 형태의 html를 넣겠다 라고 한 listView 함수를 호출한 거임

						error : function() {
							alert("통신 실패")
						}
					// 콘솔창에 network 들어가서 Request URL 확인해야함! why? 비동기 통신이라!!!

					})

				}

				function listView(res) {

					for (var i = 0; i < res.length; i++) {
						console.log(res[i].latitude + ',' + res[i].longitude)
					}

					var positions = []
					for (var i = 0; i < res.length; i++) {
						var position = {
							title : '테스트',
							latlng : new kakao.maps.LatLng(res[i].latitude,
									res[i].longitude)
						}
						positions.push(position)
					}

					console.log(positions)

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

						markerArr1.push(marker) //  각 마커 리스트에 마커 추가

						marker.setMap(null)
						//marker.setMap(map)
						console.log(markerArr1)
					}

				}

				function set() { //분리수거함

					console.log(markerArr1)

					for (var i = 0; i < markerArr1.length; i++) {
						markerArr1[i].setMap(map)

						//marker.setMap(map)
					}

					for (var i = 0; i < markerArr2.length; i++) {
						markerArr2[i].setMap(null)
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