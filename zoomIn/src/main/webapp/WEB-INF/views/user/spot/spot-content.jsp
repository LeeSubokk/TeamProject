<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="resources/css/spot.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/00584b5208.js" crossorigin="anonymous"></script>
</head>
<meta charset="UTF-8">
<title>spot-content</title>
</head>
<body>
	<div id="place">
		<div class="container container-fluid spot-scroll pt-3">
		<div class="place-list">
			<!-- --------forEach 장소 리스트------- -->
			<c:forEach var="pl" items="${placeList}" varStatus="status">
				<div class="row">
					<div class="spot-list ${pl.category_name}">
						<input type="hidden" name="grade" value="${pl.place_grade_avg}">
						<input type="hidden" name="view" value="${pl.place_view}">
						<a href="placeDetail?menu=spot-detail&place_code=${pl.place_code}" target="_self" role="button">
							<div class="">
								<span class="text-deepblue-300"><b>${pl.place_name}</b></span> <span class="small text-gray-600">${pl.category_name}</span><span class="small text-gray-600 float-right">${pl.place_view} View</span>
								<div class="description small text-gray-900">
									<c:out value="${fn:substring(pl.place_description, 0, 17)}" />
									...
								</div>
								<div class="small">
									<c:forEach var="keyword" items="${keywords}">
										<c:if test="${keyword.place_code eq pl.place_code}">
											<span class="keyword">${keyword.keyword_content}</span> 
										</c:if>
									</c:forEach>

								</div>
								<div class="">
									<span class="now-open small text-gray-900" id="now-open">${pl.place_business_hours}</span> <span class="small text-gray-900"><i class="fas fa-star text-red-400"></i><em>${pl.place_grade_avg}</em></span> <span class="small text-gray-700">방문자리뷰 ${pl.place_reply_count}</span>
								</div>
								<div class="">
									<div class=""></div>
									<div class="">
										<span class="spot-img"> <c:choose>
												<c:when test="${fn:contains(pl.place_address, '남구')}">
													<c:forEach var="img" begin="1" step="1" end="3" varStatus="status">
														<img width="70" height="70" src="resources/img/place/남구/${pl.place_name}/jpg/${status.index}.jpg">
													</c:forEach>
												</c:when>
												<c:when test="${fn:contains(pl.place_address, '북구')}">
													<c:forEach var="img" begin="1" step="1" end="3" varStatus="status">
														<img width="70" height="70" src="resources/img/place/북구/${pl.place_name}/jpg/${status.index}.jpg">
													</c:forEach>
												</c:when>
												<c:when test="${fn:contains(pl.place_address, '동구')}">
													<c:forEach var="img" begin="1" step="1" end="3" varStatus="status">
														<img width="70" height="70" src="resources/img/place/동구/${pl.place_name}/jpg/${status.index}.jpg">
													</c:forEach>
												</c:when>
												<c:when test="${fn:contains(pl.place_address, '서구')}">
													<c:forEach var="img" begin="1" step="1" end="3" varStatus="status">
														<img width="70" height="70" src="resources/img/place/서구/${pl.place_name}/jpg/${status.index}.jpg">
													</c:forEach>
												</c:when>
												<c:when test="${fn:contains(pl.place_address, '광산구')}">
													<c:forEach var="img" begin="1" step="1" end="3" varStatus="status">
														<img width="70" height="70" src="resources/img/place/광산구/${pl.place_name}/jpg/${status.index}.jpg">
													</c:forEach>
												</c:when>
											</c:choose>
										</span>
									</div>
								</div>
						</a>
					</div>
					
					
				</div>
		</div>
		</c:forEach>
	</div>
	</div>
	
</body>
</html>