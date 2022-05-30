//PlaceBean의 주소를 좌표로 전환
function setLating(positions) {
	let lat;
	let lon;
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {
			lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도
			showMap(positions, lat, lon);
		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		lat = 35.1595454;
		lon = 126.8526012;
		showMap(positions, lat, lon);
	}

}


let allMarkers = [];
let restaurantMarkers = [];
let cafeMarkers = [];
let accommodationMarkers = [];
let exhibitionMarkers = [];
let map;

function showMap(positions, lat, lon) {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
			level: 8
			// 지도의 확대 레벨
		};


	map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new kakao.maps.ZoomControl();

	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	var geocoder = new kakao.maps.services.Geocoder();
	for (var i = 0; i < positions.length; i++) {

		let con = positions[i].content;
		let category = positions[i].category;

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(positions[i].latlng, function(result, status) {

			// 마커 이미지의 이미지 주소입니다
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(27, 32);

			// 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			var imageOption = { offset: new kakao.maps.Point(13, 30) };

			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc,
				imageSize, imageOption);

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				let coords = new kakao.maps.LatLng(result[0].y,
					result[0].x);

				// 마커를 생성합니다
				let marker = new kakao.maps.Marker({
					map: map, // 마커를 표시할 지도
					position: coords, // 마커를 표시할 위치
					image: markerImage,
				});
				if (category == '음식점') {
					restaurantMarkers.push(marker);
				} else if (category == '카페') {
					cafeMarkers.push(marker);
				} else if (category == '전시') {
					exhibitionMarkers.push(marker);
				} else if (category == '숙소') {
					accommodationMarkers.push(marker);
				}
				allMarkers.push(marker);
				// 커스텀 오버레이를 생성합니다
				let customOverlay = new kakao.maps.CustomOverlay({
					map: map,
					position: coords,
					content: con,
					yAnchor: 0.1,
				});
				customOverlay.setMap(null);


				kakao.maps.event.addListener(marker, 'click', function() {

					if (customOverlay.getMap() == null) {
						customOverlay.setMap(map);
					} else {
						customOverlay.setMap(null);
					}
				});


			}else{
				alert(con);
			}
		});
	}
}
//선택 카테고리 마커 표시
function setMarkers(category) {
	for (var i = 0; i < allMarkers.length; i++) {
		allMarkers[i].setMap(null);
	}
	if (category == '음식점') {
		for (var i = 0; i < restaurantMarkers.length; i++) {
			restaurantMarkers[i].setMap(map);
		}
	} else if (category == '전시') {
		for (var i = 0; i < exhibitionMarkers.length; i++) {
			allMarkers[i].setMap(null);
			exhibitionMarkers[i].setMap(map);
		}

	} else if (category == '카페') {
		for (var i = 0; i < cafeMarkers.length; i++) {
			allMarkers[i].setMap(null);
			cafeMarkers[i].setMap(map);
		}

	} else if (category == '숙소') {
		for (var i = 0; i < accommodationMarkers.length; i++) {
			allMarkers[i].setMap(null);
			accommodationMarkers[i].setMap(map);
		}

	} else {
		for (var i = 0; i < allMarkers.length; i++) {
			allMarkers[i].setMap(map);
		}
	}
}

