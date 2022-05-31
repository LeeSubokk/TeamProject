<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="resources/js/spotDetail.js"></script>
<script src="resources/js/bus.js"></script>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<link href="resources/css/spotGrade.css" rel="stylesheet">
<link href="resources/css/animation/textAni.css" rel="stylesheet">
<link href="resources/css/animation/main.css" rel="stylesheet">
<link href="resources/css/animation/index.css" rel="stylesheet">
<link href="resources/css/animation/slide.css" rel="stylesheet">
<link href="resources/css/spot.css" rel="stylesheet">
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/00584b5208.js" crossorigin="anonymous"></script>
</head>

<body>
	<!-- ---------장소사진----------- -->
	<div class="container container-fluid  pt-3">
		<div class="inner-container">
			<div class="section">
				<input type="radio" name="slide" id="slide01" checked>
				<input type="radio" name="slide" id="slide02">
				<input type="radio" name="slide" id="slide03">
				<input type="radio" name="slide" id="slide04">

				<div class="slidewrap">

					<ul class="slidelist">
						<c:choose>
							<c:when test="${fn:contains(place.place_address, '남구')}">남구
								<c:forEach var="img" begin="1" step="1" end="4" varStatus="status">
									<li class="slideitem"><img width="600" height="400" src="resources/img/place/남구/${place.place_name}/jpg/${status.index}.jpg"></li>
								</c:forEach>
							</c:when>
							<c:when test="${fn:contains(place.place_address, '북구')}">북구
								<c:forEach var="img" begin="1" step="1" end="4" varStatus="status">
									<li class="slideitem"><img width="600" height="400" src="resources/img/place/북구/${place.place_name}/jpg/${status.index}.jpg"></li>
								</c:forEach>
							</c:when>
							<c:when test="${fn:contains(place.place_address, '동구')}">동구
								<c:forEach var="img" begin="1" step="1" end="4" varStatus="status">
									<li class="slideitem"><img width="600" height="400" src="resources/img/place/동구/${place.place_name}/jpg/${status.index}.jpg"></li>
								</c:forEach>
							</c:when>
							<c:when test="${fn:contains(place.place_address, '서구')}">서구
								<c:forEach var="img" begin="1" step="1" end="4" varStatus="status">
									<li class="slideitem"><img width="600" height="400" src="resources/img/place/서구/${place.place_name}/jpg/${status.index}.jpg"></li>
								</c:forEach>
							</c:when>
							<c:when test="${fn:contains(place.place_address, '광산구')}">광산구
								<c:forEach var="img" begin="1" step="1" end="4" varStatus="status">
									<li class="slideitem"><img width="600" height="400" src="resources/img/place/광산구/${place.place_name}/jpg/${status.index}.jpg"></li>
								</c:forEach>
							</c:when>
						</c:choose>
						<!-- 슬라이드 영역 -->
						<li class="slideitem"><img src="resources/img/test1.jpg"></li>
						<li class="slideitem"><img src="resources/img/test2.jpg"></li>
						<li class="slideitem"><img src="resources/img/test3.jpg"></li>
						<li class="slideitem"><img src="resources/img/test4.jpg"></li>

						<!-- 좌,우 슬라이드 버튼 -->
						<div class="slide-control">
							<div>
								<label for="slide04" class="left"></label> <label for="slide02" class="right"></label>
							</div>
							<div>
								<label for="slide01" class="left"></label> <label for="slide03" class="right"></label>
							</div>
							<div>
								<label for="slide02" class="left"></label> <label for="slide04" class="right"></label>
							</div>
							<div>
								<label for="slide03" class="left"></label> <label for="slide01" class="right"></label>
							</div>
						</div>

					</ul>
				</div>
			</div>
			<!-- -------본문--------- -->
			<div class="inner-text-area">
				<h3>
					<div class="stagger-item">${place.place_name}</div>
				</h3>
				<div class="line"></div>
				영업시간 ${place.place_business_hours} 전화번호 ${place.place_tell}

				<div class="place_map">
					<i class="fas fa-map-marker-alt"></i>${place.place_address}
					<div id="map" style="width: 100%; height: 350px;"></div>
					<div id="bus">버스정류장<%request.getParameter("LINE_NAME"); %></div>
				</div>

				<i class="fas fa-star text-yellow-200"></i>별점 <b>${place.place_grade_avg}</b>/<sub>5</sub> <i class="fas fa-book text-grayblue-100"></i>리뷰<b>${place.place_reply_count}</b>개
				<c:choose>
					<c:when test="${not empty loginedUserBean}">
						<a class="reviewWrite float-right pr-2 " data-bs-toggle="modal" data-bs-target="#reviewWrite" role="button" aria-haspopup="true" aria-expanded="false"> 리뷰쓰기 </a>
					</c:when>
					<c:otherwise>
						<a class="reviewWrite float-right pr-2 " onclick="loginCheck()"> 리뷰쓰기 </a>
					</c:otherwise>
				</c:choose>
				<hr>
				<div class="review_preview">
					<div class="r">
						<select id="review_align" name="review_align" class="mt-sm-2">
							<option value="upperscore">높은 별점순</option>
							<option value="lowerscore">낮은 별점순</option>
						</select>
					</div>
					<c:forEach var="reply" items="${placeReplyList}" varStatus="status">
						<div id="status${status.index}" class="placeReplys">
							<!-- 총 리뷰 4개만 미리보기식 -->
							<form id="form${reply.reply_code}" class="updateReplyForm" action="actionPlaceReplyUpdate" name="PlaceReplyBean" accept-charset="utf-8">
								<div class="bigframe d-inline-flex mt-3">
									<div class="사람이미지 h1">
										<i class="fas fa-user-circle"></i>
									</div>
									<!-- -------리뷰작성자 개개인 별점--------- -->
									<div class="별점유저아이디날짜">
										<div class="starGrade pl-2">
											<div id="grade${reply.reply_code}">
												<c:forEach begin="1" end="${reply.reply_grade}">
													<i class="fas fa-star text-yellow-200"></i>
												</c:forEach>
												<c:forEach begin="${reply.reply_grade}" end="4">
													<i class="fas fa-star text-gray-500"></i>
												</c:forEach>
											</div>
											<div class="starArea${reply.reply_code} updateStar">
												<fieldset>
													<input type="radio" name="reply_grade" value="5" id="rate1${reply.reply_code}" <c:if test="${reply.reply_grade eq 5 }">checked</c:if>>
													<label for="rate1${reply.reply_code}">⭐</label>
													<input type="radio" name="reply_grade" value="4" id="rate2${reply.reply_code}" <c:if test="${reply.reply_grade eq 4 }">checked</c:if>>
													<label for="rate2${reply.reply_code}">⭐</label>
													<input type="radio" name="reply_grade" value="3" id="rate3${reply.reply_code}" <c:if test="${reply.reply_grade eq 3 }">checked</c:if>>
													<label for="rate3${reply.reply_code}">⭐</label>
													<input type="radio" name="reply_grade" value="2" id="rate4${reply.reply_code}" <c:if test="${reply.reply_grade eq 2 }">checked</c:if>>
													<label for="rate4${reply.reply_code}">⭐</label>
													<input type="radio" name="reply_grade" value="1" id="rate5${reply.reply_code}" <c:if test="${reply.reply_grade eq 1 }">checked</c:if>>
													<label for="rate5${reply.reply_code}">⭐</label>
												</fieldset>
											</div>
										</div>

										<!-- --------별점 끝--------- -->
										<div class="아이디날짜">
											<span class="pl-2"> <c:choose>
													<c:when test="${loginedUserBean.user_grade eq 'admin'}">${reply.user_id}</c:when>
													<c:when test="${loginedUserBean.user_id eq reply.user_id}">${reply.user_id}</c:when>
													<c:otherwise>
														<c:out value="${fn:substring(reply.user_id, 0, 2)}" />****</c:otherwise>
												</c:choose>
											</span> <span class="small pl-3">${reply.reply_date_toString} </span>
										</div>
									</div>
								</div>
								<div class="리뷰내용 pl-5 mt-xl-n2 reply">
									<span id="content${reply.reply_code}">${reply.reply_content}</span> <span id="input${reply.reply_code}" class="replyInput"> <input type="hidden" name="user_id" value="${reply.user_id}"> <input type="hidden" name="place_code" value="${reply.place_code}"> <input type="hidden" name="reply_code" value="${reply.reply_code}"> <input type="text" class="changeReply updateInput" id="change${reply.reply_code}" name="reply_content" value="${reply.reply_content}"> <input type="button" class="changeReply btn btn-primary pull-right" id="button${reply.reply_code}" value="수정" onclick="replyUpdate('${reply.reply_code}')">
									</span>
									<c:if test="${loginedUserBean.user_grade eq 'admin' || reply.user_id eq loginedUserBean.user_id}">
										<span class="text-right float-right"> <a href="javascript:void(0);" onclick="changeInput('${reply.reply_code}')">수정</a> <a href="#" onclick="replyDelete('actionPlaceReplyDelete?reply_code=${reply.reply_code}&place_code=${reply.place_code}')">삭제</a>
										</span>
									</c:if>
								</div>
							</form>
							<hr>
						</div>
					</c:forEach>
					<div class="move_review">
						<a href="javascript:void(0);" id="moreReply" onclick="moreReply()">방문자 리뷰 더보기</a>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=100145e95f99397896575a99741f4717&libraries=services"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			showMap('${place.place_address}', '${place.place_name}');
			setBus('${place.place_address}');
			let length = ${fn:length(placeReplyList)};
			if	(length > 5){
				for(var i = 4; i<${fn:length(placeReplyList)}; i++){
					$('#status'+i).hide();
				}
			}
		});
		
		let re=true;
		function moreReply() {
			let length = ${fn:length(placeReplyList)};
			if(re){
				if	(length > 5){
					for(var i = 4; i<${fn:length(placeReplyList)}; i++){
						$('#status'+i).show();
						$('#moreReply').text('방문자 리뷰 숨기기');
						re=false;
					}
				}
			}else{
				for(var i = 4; i<${fn:length(placeReplyList)}; i++){
					$('#status'+i).hide();
					$('#moreReply').text('방문자 리뷰 더보기');
					re=true;
				}
			}
		}
	</script>
	<jsp:include page="spot-review.jsp"></jsp:include>
</body>
</html>