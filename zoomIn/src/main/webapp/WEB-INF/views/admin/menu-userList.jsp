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
			<h1 class="h3 mb-2 text-gray-800">유저 리스트</h1>
			<p class="mb-4"></p>

			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">유저 정보</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>생일</th>
									<th>성별</th>
									<th>전화번호</th>
									<th>이메일</th>
									<th>우편번호</th>
									<th>도로명주소</th>
									<th>상세주소</th>
									<th>관리자유무</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>생일</th>
									<th>성별</th>
									<th>전화번호</th>
									<th>이메일</th>
									<th>우편번호</th>
									<th>도로명주소</th>
									<th>상세주소</th>
									<th>관리자유무</th>

								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="userList" items="${userList}">
									<tr>
										<td>${userList.user_id}</td>
										<td>${userList.user_name}</td>
										<td>${userList.user_birthday}</td>
										<td>${userList.user_gender}</td>
										<td>${userList.user_phone}</td>
										<td>${userList.user_email}</td>
										<td>${userList.user_postcode}</td>
										<td>${userList.user_roadAddress}</td>
										<td>${userList.user_detailAddress}${userList.user_extraAddress}</td>

										<c:if test="${userList.user_grade eq 'admin'}">
											<td>O</td>
										</c:if>
										<c:if test="${userList.user_grade eq 'user'}">
											<td>X</td>
										</c:if>

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



