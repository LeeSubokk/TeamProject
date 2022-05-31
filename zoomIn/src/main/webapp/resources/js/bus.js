/*해당 주소의 좌표 얻어오기*/
function setBus(positions) {
	let longitude;
	let latitude;

	var geocoder = new kakao.maps.services.Geocoder();
	/*해당 주소로 위도 경도 찾기*/
	geocoder.addressSearch(positions, function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			longitude = result[0].x; //경도
			latitude = result[0].y; //위도
			var a = longitude.substr(0, 10);
			var b = latitude.substr(0, 9);
			//alert(longitude+', '+latitude);
			//alert(a+", "+b);
			busStationInfo(a, b);
		} else {
			alert("찾을 수 없음");
		}
	});

}

class BusStation {
	constructor(lineName) {
		this.lineName = lineName;
	}

}

function busStationInfo(a, b) {
	var busStopID = '2513';
	busArriveInfo(busStopID);

}

function busArriveInfo(busStopID) {
	var xhr = new XMLHttpRequest();
	var url = 'http://api.gwangju.go.kr/xml/arriveInfo'; //URL
	var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + '4cZKQFGLj2H8FozNTI063G706Em1ECfdNRmTfRUHAuuPqylKMACLzGr01UqGKslCbGVs0kdGSLIKb3IKOuLeag%3D%3D'; //Service Key
	queryParams += '&' + encodeURIComponent('BUSSTOP_ID') + '=' + busStopID;


	xhr.open('GET', url + queryParams);
	xhr.setRequestHeader('Content-Type', 'application/json');
	xhr.onreadystatechange = function() {
		if (this.readyState == 4) {
			alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);

		}

	};
	xhr.send('');
/*
	let headers = xhr.getAllResponseHeaders().split('\r\n')
		.reduce((result, current) => {
			let [name, value] = current.split(': ');
			result[name] = value;
			return result;
		}, {});
*/


}


