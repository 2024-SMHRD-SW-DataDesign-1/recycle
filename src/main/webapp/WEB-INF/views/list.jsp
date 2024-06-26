<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Recycle Map</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <!-- 외부 스타일 css -->
    <link rel="stylesheet" href="resources/css/main.css" />
    <link rel="stylesheet" href="resources/css/styles.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=96fa0336ba0e9190eea3854401eb131e&libraries=clusterer,services"></script>
    <link rel="shortcut icon" href="#">
</head>
<body class="is-preload">
    <div id="page-wrapper">
        <!-- Header -->
        <jsp:include page="header.jsp"></jsp:include>


		<!-- 메뉴 버튼 및 검색 입력 필드 -->
        <div id="menu_btn">
            <input type="text" id="home" onkeyup="if(window.event.keyCode==13){searchLocation()}" placeholder="주소 입력" />
            <br>
            <button type="button" id="search" onclick="searchLocation()">현재위치 검색</button>
            <br>
            <button onclick="toggleMarkers('trash')">분리수거</button>
            <br>
            <button onclick="toggleMarkers('lamp')">폐형광등</button>
            <br>
            <button onclick="toggleMarkers('battery')">폐건전지</button>
            <br>
            <button onclick="toggleMarkers('medicine')">폐의약품</button>
            <br>
            <button onclick="toggleMarkers('clothes')">의류수거함</button>
        </div>

		<!-- 지도 표시 영역 -->
        <div id="map" style="width: 100%; height: 705px;"></div>

		<!-- 외부 JavaScript 파일로 스크립트 분리 -->
        <script src="resources/js/map.js"></script>
        <script>
            $(document).ready(function() {
            	// 페이지 로드 시 각 타입의 마커를 로드
            	// 경로를 배열에 넣어 반복문 -> loadMarkers 함수 실행
                ['trash', 'lamp', 'battery', 'medicine', 'clothes'].forEach(loadMarkers);
            });
            
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
