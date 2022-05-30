<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="resources/js/login.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<div class="modal-body">

				<!-- -------------로고--------------- -->
				<div class="pad">
					<img src="resources/img/logo.jpg" alt="zoomin">
				</div>
				<!-- ----------로그인---------- -->
				<form class="user" id="loginForm" action="actionLogin" method="post">

					<div class="form-group">
						<div class="custom-control custom-checkbox small idRember">
							<label class="idRember">아이디 저장</label> <label class="switch-button"> <input type="checkbox" id="togleSwitch" class="onoff onoffSwitch" value="on" checked /> <span class="onoff-switch"></span>
							</label>
							<input type="hidden" id="togleSwitch_Hidden" name="rememberID">
						</div>
					</div>

					<div class="form-group">
						<input type="text" class="form-control form-control-user" id="login_id" name="login_id" aria-describedby="emailHelp" value="${cookie.rememberId.value}" placeholder="아이디">
					</div>
					<div class="form-group">
						<input type="password" id="login_password" name="login_password" class="form-control form-control-user" id="password" placeholder="비밀번호">
					</div>

					<input type="button" class="btn btn-secondary btn-user btn-block" value="로그인" onclick="actionLoginCheck()">

				</form>
				<hr>
				<div class="login-box">

					<a class="small"data-bs-toggle="modal" data-bs-target="#findModal" role="button" aria-haspopup="true" aria-expanded="false">아이디 찾기 / 비밀번호 찾기</a>
					<a class="small" href="main?menu=userJoin" style="padding-left: 4rem">회원가입</a>
				</div>

			</div>
		</div>
	</div>
</div>