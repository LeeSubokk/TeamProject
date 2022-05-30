<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>

<div id="content-wrapper" class="d-flex flex-column">
	<!-- Main Content -->
	<div id="content">


		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">장소 리스트</h1>
			<p class="mb-4"></p>

			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">장소 정보 수정</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="dataTable"
							width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>코드</th>
									<th>이름</th>
									<th>설명</th>
									<th>주소</th>
									<th>전화번호</th>
									<th>영업시간</th>
									<th>업종</th>
									<th>조회수</th>
									<th>평점</th>
									<th>댓글 수</th>
									<th></th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>코드</th>
									<th>이름</th>
									<th>설명</th>
									<th>주소</th>
									<th>전화번호</th>
									<th>영업시간</th>
									<th>업종</th>
									<th>조회수</th>
									<th>평점</th>
									<th>댓글 수</th>
									<th></th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="placeList" items="${placeList}">

									<tr>


										<form action="actionPlaceUpdate" name="PlaceBean"
											accept-charset="utf-8" method="post"
											id="${placeList.place_code}">


											<input type="hidden" name="place_code"
												value="${placeList.place_code}">
											<td>${placeList.place_code}</td>
											
											 <td><input type="text"
												name="place_name" value="${placeList.place_name}" class="updateInput">
											</td>


											<td><input type="text" name="place_description"
												value="${placeList.place_description}" class="updateInput">
											</td>

											<td><input type="text" name="place_address"
												value="${placeList.place_address}" size="20"
												class="updateInput"></td>

											<td><input type="text" name="place_tell"
												value="${placeList.place_tell}" size="20"
												class="updateInput"></td>

											<td><input type="text" name="place_business_hours"
												value="${placeList.place_business_hours}" size="20"
												class="updateInput"></td>
											<td><input type="text" name="category_name"
												value="${placeList.category_name}" class="updateInput">
											</td> <input type="hidden" name="place_view"
												value="${placeList.place_view}">
											<td>${placeList.place_view}</td> <input type="hidden"
												name="place_grade_avg" value="${placeList.place_grade_avg}">
											<td>${placeList.place_grade_avg}</td> <input type="hidden"
												name="place_reply_count"
												value="${placeList.place_reply_count}">
											<td>${placeList.place_reply_count}</td>

											<td><input type="submit" value="수정"
												class="btn btn-outline-success">
												<button class="btn btn-outline-danger" type="button"
													onclick="location.href='actionPlaceDelete?place_code=${placeList.place_code}' ">삭제</button>
											</td>
										</form>
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>

	</div>

</div>








