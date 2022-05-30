<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/spot.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>광주 장소</title>
</head>
<body>

	<div class="container container-fluid pt-3">
		<!--  -------정렬 조건--------- -->
		<session class="menu-option text-center">
		<div class="inner-menu">
			<div class="col arrange">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small"> <a href="javascript:void(0);" onclick="category('grade')">
						<span class="mr-2 d-none d-lg-inline text-gray-600"><b>별점순</b></span>
					</a> <a href="javascript:void(0);" onclick="category('reply')">
						<span class="mr-2 d-none d-lg-inline text-gray-600"><b>리뷰순</b></span>
					</a> <a href="javascript:void(0);" onclick="category('view')">
						<span class="mr-2 d-none d-lg-inline text-gray-600"><b>조회순</b></span>
					</a>
				</span>
			</div>
		</div>
		</session>
		<!-- --------검색 조건--------- -->
		<session class="inner-menu text-center">
		<div class="inner-menu">
			<div class="col">
				
				<input id="checkbox1" type="checkbox" class="selectContent" name="selectContent" value="음식점" checked>
				<label for="checkbox1"> <span>음식점</span>
				</label>
				<lable class="divider"></lable>
				<input id="checkbox2" type="checkbox" class="selectContent" name="selectContent" value="카페" checked>
				<label for="checkbox2"> <span>카페</span>
				</label>
				<lable class="divider"></lable>
				<input id="checkbox3" type="checkbox" class="selectContent" name="selectContent" value="전시" checked>
				<label for="checkbox3"> <span>축제/전시</span>
				</label>
				<lable class="divider"></lable>
				<input id="checkbox4" type="checkbox" class="selectContent" name="selectContent" value="숙소" checked>
				<label for="checkbox4"> <span>숙소</span>
				</label>


			</div>
		</div>
		</session>

		<!-- -------장소리스트------- -->
		<div id="content" class="spot-content text-center">
			<%@include file="spot-content.jsp"%>
		</div>
	</div>
</body>

</html>