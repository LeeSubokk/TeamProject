<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<!-- Custom fonts for this template-->

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript" src="resources/js/validation.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="resources/js/zoomIn.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="resources/css/zoom.css" rel="stylesheet">
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">


<meta charset="UTF-8">
<title>회원정보수정</title>
</head>

<body>
	<div class="container">
		<!-- --------Outer Row-------- -->
		<div class="row">
			<form action="actionUserUpdate" name="UserBean" accept-charset="utf-8" method="post">
				<center>
					<h5>회원 정보 수정</h5>
				</center>
				<p class="required" style="text-align: right; font-size: 12px"></p>
				<!-- ----------테이블----------- -->
				<div class="ec-base-table small">

					<table border="1" summary="">
						<colgroup>
							<col style="width: 150px;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td>
									<input type="text" id="user_id" name="user_id" class="inputTypeText updateInput" maxlength="20" value="${loginedUserBean.user_id}" readonly>
								</td>
							</tr>

							<tr>
								<th scope="row">비밀번호 변경</th>
								<td>
									<label class="switch-button"> <input type="checkbox" class="onoff onoffSwitch" value="off" id="onoffSwitch" onclick="foldDiv()" /> <span class="onoff-switch"></span></label>
									<input type="hidden" id="passwordChange" name="passwordChange" value="off">
								</td>
							</tr>

							<tr class="changePassword">
								<th scope="row">비밀번호</th>
								<td>
									<input type="password" id="user_password" name="user_password" class="inputTypeText updateInput" maxlength="16">
									<span id="idMsg"></span> (영문자/숫자/특수문자, 8~16자)
								</td>
							</tr>
							<tr class="changePassword">
								<th scope="row">비밀번호 확인</th>
								<td>
									<input type="password" id="chpass" name="chpass" class="inputTypeText updateInput" maxlength="16">
									<font name="check" size="2" color="red"></font><span id="pwConfirmMsg"></span>
								</td>
							</tr>

							<tr>
								<th scope="row">이름</th>
								<td>
									<input type="text" id="user_name" name="user_name" class="inputTypeText updateInput" maxlength="20" value="${loginedUserBean.user_name}">
								</td>
							</tr>
							<tr>
								<th scope="row">생년월일</th>
								<td>
									<input type="date" id="user_birthday" name="user_birthday" class="inputTypeText updateInput" maxlength="8" value="${loginedUserBean.user_birthday}">
								</td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<td>
									<input type="radio" id="user_gender" name="user_gender" class="inputTypeText" value="남성" <c:if test="${loginedUserBean.user_gender eq '남성'}">checked</c:if>>
									남성
									<input type="radio" id="user_gender" name="user_gender" class="inputTypeText" value="여성" <c:if test="${loginedUserBean.user_gender eq '여성'}">checked</c:if>>
									여성
								</td>
							</tr>
							<tr class="">
								<c:set var="userPhone" value="${loginedUserBean.user_phone}" />
								<c:set var="split_user_phone" value="${fn:split(userPhone,'-')}" />

								<th scope="row">전화번호</th>
								<td>
									<select id="user_phone1" name="user_phone1" class="updateInput">
										<option class="phone_option" value="010">010</option>
										<option class="phone_option" value="011">011</option>
										<option class="phone_option" value="016">016</option>
										<option class="phone_option" value="017">017</option>
										<option class="phone_option" value="018">018</option>
										<option class="phone_option" value="019">019</option>
										<option class="phone_option" value="0508">0508</option>
									</select>
									-
									<input type="text" id="user_phone2" name="user_phone2" maxlength="4" class="updateInput" value="${split_user_phone[1]}">
									-
									<input type="text" id="user_phone3" name="user_phone3" maxlength="4" class="updateInput" value="${split_user_phone[2]}">
								</td>


							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td>
									<c:set var="userEmail" value="${loginedUserBean.user_email}" />
									<c:set var="split_user_email" value="${fn:split(userEmail,'@')}" />
									<input type="text" id="user_email_forward" name="user_email_forward" class="inputTypeText updateInput" maxlength="20" value="${split_user_email[0]}">
									@
									<input type="text" id="user_email_back" name="user_email_back" class="inputTypeText updateInput" maxlength="20" value="${split_user_email[1]}">

									<select id="email_site" name="email_site">
										<option value="">직접입력</option>
										<option class="email_option" value="naver.com">네이버</option>
										<option class="email_option" value="hanmail.net">다음</option>
										<option class="email_option" value="gmail.com">구글</option>
									</select>
								</td>
							</tr>
							<tr class="">
								<th scope="row" rowspan="4">주소</th>
								<td>
									<input type="text" id="user_postcode" name="user_postcode" class="inputTypeText updateInput" placeholder="우편번호" value="${loginedUserBean.user_postcode}" readonly>
									<input type="button" class="inputTypeText" onclick="execDaumPostcode()" value="우편번호 찾기">
								</td>
							</tr>
							<tr>
								<td>
									<br>
									<input type="text" id="user_roadAddress" name="user_roadAddress" size="20" class="inputTypeText updateInput" placeholder="도로명주소" value="${loginedUserBean.user_roadAddress}" readonly>
									<br> <span id="guide" style="color: #999; display: none"></span>
									<input type="text" id="user_detailAddress" name="user_detailAddress" class="inputTypeText updateInput" placeholder="상세주소" value="${loginedUserBean.user_detailAddress}">
									<br>
									<input type="text" id="user_extraAddress" name="user_extraAddress" class="inputTypeText updateInput" placeholder="추가주소" value="${loginedUserBean.user_extraAddress}" readonly>
								</td>
							</tr>
						</tbody>
					</table>
					<br> <br>
					<center>
						<input type="hidden" name="user_phone" id="user_phone">
						<input type="hidden" name="user_email" id="user_email">
						<button type="button" class="btn btn-primary" onclick="updateCheck()" width="200px">회원정보 수정</button>
					</center>
				</div>
			</form>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			//전화번호 자동 선택
			$(".phone_option").each(function() {
				if ($(this).val() == "${split_user_phone[0]}") {
					$(this).prop("selected", "selected");
				}
			});
			//이메일 자동 선택	
			$(".email_option").each(function() {
				if ($(this).val() == "${split_user_email[1]}") {
					$(this).prop("selected", "selected");
				}
			});
		});
	</script>
</body>
</html>
