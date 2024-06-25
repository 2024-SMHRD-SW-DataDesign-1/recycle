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
