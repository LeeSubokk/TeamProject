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
					<h6 class="m-0 font-weight-bold text-primary">유저 정보 수정</h6>
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
									<th>추가주소</th>
									<th></th>
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
									<th>추가주소</th>
									<th></th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="userList" items="${userList}">


									<tr>
										<form action="actionUserUpdate" name="UserBean" accept-charset="utf-8" method="post" id="${userList.user_id}">

											<td>${userList.user_id}
												<input type="hidden" name="user_id" value="${userList.user_id}">
												<input type="hidden" name="user_password" value="${userList.user_password}">
												<input type="hidden" name="user_grade" value="${userList.user_grade}">
											</td>

											<td>
												<p style="display: none">${userList.user_name}</p>
												<input type="text" name="user_name" value="${userList.user_name}" size="10" class="updateInput">
											</td>
											<td>
												<p style="display: none">${userList.user_birthday}</p>
												<input type="date" name="user_birthday" value="${userList.user_birthday}" size="25" class="updateInput">
											</td>

											<td>
												<p style="display: none">${userList.user_gender}</p>
												<div class="form-check form-check-inline">
													<input type="radio" class="form-check-input" name="user_gender" class="inputTypeText" value="남성" <c:if test="${userList.user_gender eq '남성'}">checked</c:if>>
													<label class="form-check-label" for="inlineCheckbox1">남</label>
													<input type="radio" class="form-check-input" name="user_gender" class="inputTypeText" value="여성" <c:if test="${userList.user_gender eq '여성'}">checked</c:if>>
													<label class="form-check-label" for="inlineCheckbox1">여</label>

												</div>
											</td>

											<td>
												<p style="display: none">${userList.user_phone}</p>
												<input type="text" name="user_phone" value="${userList.user_phone}" size="20" class="updateInput">
											</td>
											<td>
												<p style="display: none">${userList.user_email}</p>
												<input type="email" name="user_email" value="${userList.user_email}" size="20" class="updateInput">
											</td>
											<td class="exchangeAddress">
												<p style="display: none">${userList.user_postcode}</p>
												<input type="text" name="user_postcode" value="${userList.user_postcode}" size="8" class="updateInput" readonly>
											</td>
											<td class="exchangeAddress">
												<p style="display: none">${userList.user_roadAddress}</p>
												<input type="text" name="user_roadAddress" value="${userList.user_roadAddress}" class="updateInput" readonly>
											</td>
											<td class="exchangeAddress">
												<p style="display: none">${userList.user_detailAddress}</p>
												<input type="text" name="user_detailAddress" value="${userList.user_detailAddress}" class="updateInput">
											</td>
											<td class="exchangeAddress">
												<p style="display: none">${userList.user_extraAddress}</p>
												<input type="text" name="user_extraAddress" value="${userList.user_extraAddress}" class="updateInput" readonly>
											</td>
											<td>
												<input type="hidden" value="admin" name="passwordChange">
												<input type="submit" value="수정" class="btn btn-secondary">
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



