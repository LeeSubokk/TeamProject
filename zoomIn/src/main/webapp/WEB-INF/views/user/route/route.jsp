<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<!-- Custom fonts for this template-->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<script src="resources/js/route.js"></script>
<link href="resources/css/zoom.css" rel="stylesheet" />
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

<meta charset="UTF-8">
</head>
<body>
	<div class="container container-fluid pt-3">
		<!--  -------검색조건--------- -->
		<session class="inner-menu text-center">
		<div class="inner-menu">
			<div class="col arrange">
				<a href="javascript:void(0);" onclick="setMarkers('전체')">
					<span class="mr-2 d-none d-lg-inline text-gray-600 small"><b>전체 보기</b></span>
				</a>
				<a href="javascript:void(0);" onclick="setMarkers('음식점')">
					<span class="mr-2 d-none d-lg-inline text-gray-600 small"><b>음식점</b></span>
				</a>
				<a href="javascript:void(0);" onclick="setMarkers('카페')">
					<span class="mr-2 d-none d-lg-inline text-gray-600 small"><b>카페</b></span>
				</a>
				<a href="javascript:void(0);" onclick="setMarkers('전시')">
					<span class="mr-2 d-none d-lg-inline text-gray-600 small"><b>축제/전시</b></span>
				</a>
				<a href="javascript:void(0);" onclick="setMarkers('숙소')">
					<span class="mr-2 d-none d-lg-inline text-gray-600 small"><b>숙소</b></span>
				</a>
			</div>
		</div>
		</session>
		<!-- --------지도---------- -->
		

		<session class="spot-content text-center">
		<div id="mapWrapper">
			<div id="map" style="width: 100%; height: 600px;"></div>
			
		</div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=100145e95f99397896575a99741f4717&libraries=services"></script> </session>

		<script>
		$(document).ready(function() {
			let positions = [];
			<c:forEach var="pl" items="${placeList}" varStatus="status">
			positions.push({
				content : '<div class="customoverlay">'+'<a href="placeDetail?menu=spot-detail&place_code=${pl.place_code}" target="_self">'+
						'<span class="title">${pl.place_name}</div></span></a>',
				latlng : '${pl.place_address}',
				category : '${pl.category_name}',
			});
			</c:forEach>
			setLating(positions,'mapAll');
		});
		
		</script>

	</div>
</body>

</html>