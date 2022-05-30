<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>


<div id="content-wrapper" class="d-flex flex-column">
	<!-- Main Content -->
	<div id="content">


		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">장소 목록</h1>
			<p class="mb-4"></p>

			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">장소 정보</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
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
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="placeList" items="${placeList}">
									<tr>
										<td>${placeList.place_code}</td>
										<td>${placeList.place_name}</td>
										<td>${placeList.place_description}</td>
										<td>${placeList.place_address}</td>
										<td>${placeList.place_tell}</td>
										<td>${placeList.place_business_hours}</td>
										<td>${placeList.category_name}</td>
										<td>${placeList.place_view}</td>
										<td>${placeList.place_grade_avg}</td>
										<td>${placeList.place_reply_count}</td>

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



