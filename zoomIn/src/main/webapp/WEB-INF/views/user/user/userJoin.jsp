<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Custom fonts for this template-->

<script type="text/javascript" src="resources/js/validation.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="resources/js/join.js"></script>

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="resources/css/zoom.css" rel="stylesheet">
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>회원가입</title>

</head>

<body>
	<div class="container">
		<!-- --------Outer Row-------- -->
		<div class="row">
			<form method="post" action="actionJoin" name="UserBean" accept-charset="utf-8">
				<center>
					<h5>Join ZoomIn</h5>
				</center>
				<p class="required" style="text-align: right; font-size: 12px">
					<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"> 필수입력사항
				</p>
				<!-- ----------테이블----------- -->
				<div class="ec-base-table small">

					<table border="1" summary="">
						<colgroup>
							<col style="width: 150px;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">아이디 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></th>
								<td>
									<input type="text" id="user_id" name="user_id" class="inputTypeText updateInput" maxlength="20">
									<input type="button" value="아이디 중복 체크" class="btn btn-secondary" onclick="idCheck()">
									<span id="idMsg"></span> (영문소문자/숫자, 4~16자)
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></th>
								<td>
									<input type="password" id="user_password" name="user_password" class="inputTypeText updateInput" maxlength="16">
									<span id="idMsg"></span> (영문자/숫자/특수문자, 8~16자)
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호 확인 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></th>
								<td>
									<input type="password" id="checkpass" name="chpass" class="inputTypeText updateInput" maxlength="16">
									<font name="check" size="2" color="red"></font><span id="pwConfirmMsg"></span>
								</td>
							</tr>
							<tr>
								<th scope="row">이름 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></th>
								<td>
									<input type="text" id="user_name" name="user_name" class="inputTypeText updateInput" maxlength="20">
								</td>
							</tr>
							<tr>
								<th scope="row">생년월일</th>
								<td>
									<input type="date" id="user_birthday" name="user_birthday" class="inputTypeText updateInput" maxlength="8">
								</td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<td>
									<input type="radio"  name="user_gender" class="inputTypeText" value="남성" checked>
									남성
									<input type="radio"  name="user_gender" class="inputTypeText" value="여성">
									여성
								</td>
							</tr>
							<tr class="">
								<th scope="row">전화번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" class="displaynone" alt="필수"></th>
								<td>
									<select id="user_phone1" name="user_phone1" class="updateInput">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
										<option value="0508">0508</option>
									</select>
									-
									<input type="text" id="user_phone2" name="user_phone2" maxlength="4" class="updateInput">
									-
									<input type="text" id="user_phone3" name="user_phone3" maxlength="4" class="updateInput">
								</td>
							</tr>
							<tr>
								<th scope="row">이메일 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></th>
								<td>
									<input type="text" id="user_email_forward" name="user_email_forward" class="inputTypeText updateInput" maxlength="20">
									@
									<input type="text" id="user_email_back" name="user_email_back" class="inputTypeText updateInput" maxlength="20">

									<select id="email_site" name="email_site">
										<option value="">직접입력</option>
										<option value="naver.com">네이버</option>
										<option value="hanmail.net">다음</option>
										<option value="gmail.com">구글</option>
									</select>
								</td>
							</tr>
							<tr class="">
								<th scope="row"  rowspan="4">주소 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" class="" alt="필수"></th>
								<td>
									<input type="text" id="user_postcode" class="inputTypeText updateInput" placeholder="우편번호" name="user_postcode" readonly>
									<input type="button" class="inputTypeText" onclick="execDaumPostcode()" value="우편번호 찾기">
									<br>
									<input type="text" id="user_roadAddress" name="user_roadAddress" class="inputTypeText updateInput" placeholder="도로명주소" readonly>
									<br> <span id="guide" style="color: #999; display: none"></span>
									<input type="text" id="user_detailAddress" name="user_detailAddress" class="inputTypeText updateInput" placeholder="상세주소">
									<br>
									<input type="text" id="user_extraAddress" name="user_extraAddress" class="inputTypeText updateInput" placeholder="추가주소"  readonly>
								</td>
						</tbody>
					</table>
					<br> <br>
					<center>
						<input type="hidden" name="user_phone" id="user_phone">
						<input type="hidden" name="user_email" id="user_email">
						<button type="button" class="btn btn-primary" onclick="join_check()" value="회원가입 완료" width="200px">회원가입</button>
					</center>
				</div>
			</form>
		</div>
	</div>
</body>
</html>