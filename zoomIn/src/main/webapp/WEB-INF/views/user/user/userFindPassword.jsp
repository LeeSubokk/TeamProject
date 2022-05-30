<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>


<!-- Custom fonts for this template-->


<script src="resources/js/find.js"></script>
<link href="resources/css/zoom.css" rel="stylesheet">
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">


<meta charset="UTF-8">




<div class="modal fade" id="findModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<div class="modal-body-find" style="width: 498px; height: 505px">
				<!-- --------Outer Row-------- -->
				<div class="row" style="margin-top: 3%">
					<form class="user" id="findForm" method="post" action="actionChangePassword">
						<div>
							<div id="idFindSelect">
								<table>
									<th colspan="3">아이디 찾기</th>
									<tbody>
										<tr>
											<td colspan="2" class="mr-2 ml-2 pr-2">이름</td>
											<td>
												<input type="text" id="findId_name" name="findId_name" class="inputTypeText updateInput pl-2" maxlength="20">
											</td>
										</tr>
										<tr>
											<td colspan="2" class="mr-2 ml-2 pr-2">이메일</td>
											<td>
												<input type="email" id="findId_email" name="findId_email" class="inputTypeText updateInput pl-2" maxlength="20">
											</td>
										</tr>
									</tbody>
								</table>
								<div class="form-inline mt-2">
									<input type="button" class="changepwBtn btn btn-primary small" value="아이디찾기" onclick="findIdCheck()">
								</div>
								<hr>
							</div>
							<div id="passwordFindSelect">
								<table>
									<th colspan="3">비밀번호 찾기</th>

									<tbody>
										<tr>
											<td colspan="2" class="mr-2 ml-2 pr-2">아이디</td>
											<td>
												<input type="text" id="findPassword_id" name="findPassword_id" class="inputTypeText updateInput pl-2" maxlength="20">
											</td>
										</tr>
										<tr>
											<td colspan="2" class="mr-2 ml-2 pr-2">이메일</td>
											<td>
												<input type="email" id="findPassword_email" name="findPassword_email" class="inputTypeText updateInput pl-2" maxlength="20">
											</td>
										</tr>
									</tbody>
								</table>
								<div class="form-inline mt-2 mb-4">
									<input type="button" class="changepwBtn btn btn-primary small" value="비밀번호 찾기" onclick="findPasswordCheck()">
								</div>
							</div>
						</div>
						<div id="cordCheckDiv">
							<input type="text" class="small pl-2" id="email_cord" name="email_cord" maxlength="6" placeholder="코드입력">
							<input type="button" class="cordCheckBtn small" value="확인" onclick="cordCheck()">

						</div>

						<div id="changePasswordDiv">
							<table border="1" summary="">
								<colgroup>
									<col style="width: 150px;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row pl-4 border-top">비밀번호</th>
										<td>
											<input type="password" id="findPassword_password" name="findPassword_password" class="inputTypeText updateInput pl-2 table-bordered" maxlength="16">
										</td>
									</tr>
									<tr>
										<th scope="row pl-4 border-top border-bottom">비밀번호 확인</th>
										<td>
											<input type="password" id="chpass" name="chpass" class="inputTypeText updateInput pl-2 table-bordered" maxlength="16">
											<font name="check" size="2" color="red"></font><span id="pwConfirmMsg"></span>
										</td>
									</tr>
								</tbody>
							</table>
								<input type="button" class="changepwBtn btn btn-primary small" value="비밀번호 변경" onclick='changePassword()'>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</html>
