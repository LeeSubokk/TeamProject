let list;

$(document).ready(function() {
	//값들의 갯수 -> 배열 길이를 지정
	let listSize = $("input[name=grade]").length;
	//배열 생성
	list = new Array(listSize);
	//배열에 값 주입
	for (var i = 0; i < listSize; i++) {
		list[i] = $("input[name=grade]").eq(i);
	}

	$('.updateStar').hide();
	$('.replyInput').hide();
	
});
//댓글 수정란 펴기
function changeInput(reply_code) {
	if ($('#input' + reply_code).is(':visible')) {

		$('.starArea' + reply_code).hide();
		$('#input' + reply_code).hide();
		$('#grade' + reply_code).show();
		$('#content' + reply_code).show();

	} else {
		$('.starArea' + reply_code).show();
		$('#input' + reply_code).show();
		$('#grade' + reply_code).hide();
		$('#content' + reply_code).hide();

	}

}

//업데이트 확인
function replyUpdate(reply_code) {

	if ($("#change" + reply_code).val() == '') {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '댓글 내용을 입력해주세요.',
		})
		return false;
	}

	Swal.fire({
		title: '수정하시겠습니까?',
		text: "",
		icon: 'info',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '수정',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			$('#form' + reply_code).submit();
		} else {
			return false;
		}

	})
}


//삭제 확인
function replyDelete(href) {
	Swal.fire({
		title: '삭제하시겠습니까?',
		text: "",
		icon: 'error',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '삭제',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			location.href = href;
		} else {
			return false;
		}
	})
}


//댓글 작성 유효성 검사
function replySubmit() {
	if ($("#insertReplyContent").val() == '') {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '댓글 내용을 입력해주세요.',
		})
		return false;
	} else if ($("#insertReplyUserId").val() == '') {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '로그인 해야만 작성 가능합니다.',
		})
		return false;
	} else {
		$("#insertReplyForm").submit();
		return true;

	}

}

//비회원 알림창
function loginCheck() {
	Swal.fire({
		icon: 'error',
		title: '',
		text: '회원만 작성 가능합니다.',
	})
}

function showMap(address, name) {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';

	// 마커 이미지의 이미지 크기 입니다
	var imageSize = new kakao.maps.Size(27, 32);

	// 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	var imageOption = { offset: new kakao.maps.Point(13, 30) };

	// 마커 이미지를 생성합니다    
	var markerImage = new kakao.maps.MarkerImage(imageSrc,
		imageSize, imageOption);

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) {

		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {

			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			let marker = new kakao.maps.Marker({
				map: map, // 마커를 표시할 지도
				position: coords, // 마커를 표시할 위치
				image: markerImage
			});

			let customOverlay = new kakao.maps.CustomOverlay({
				map: map,
				position: coords,
				content: '<div class="customoverlay">' +
					'  <a href="https://map.kakao.com/link/to/' + name + ',' + result[0].y + ',' + result[0].x + '" target="_blank">' +
					'    <span class="title">' + name + '</span>' +
					'  </a>' +
					'</div>',
				yAnchor: -0.1,
			});

			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
		}
	});
}