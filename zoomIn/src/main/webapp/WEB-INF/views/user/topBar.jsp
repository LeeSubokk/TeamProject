<!DOCTYPE html>
<html>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="resources/css/zoom.css" rel="stylesheet">


<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar static-top" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<!-- 로고 -->
	<a href="main?menu=main-content">
		<img src="resources/img/logo.jpg" alt="zoomin" height="60px" />
	</a>
	<!-- Topbar Navbar -->
	<ul class="navbar-nav">

		<!--  메뉴시작 Home -->
		<li class="nav-item no-arrow"><a class="nav-link" href="main?menu=main-content" id="menu-content">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small">HOME2</span>
			</a></li>
		<div class="topbar-divider d-none d-sm-block"></div>
		<!--  메뉴 소개 -->
		<li class="nav-item no-arrow"><a class="nav-link" href="main?menu=introduce" id="menu-introduce" method="post">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small">소개2</span>
			</a></li>
		<div class="topbar-divider d-none d-sm-block"></div>
		<!-- 메뉴  추천경로 -->
		<li class="nav-item no-arrow"><a class="nav-link" href="main?menu=route" id="menu-route">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small">추천경로</span>
			</a></li>

		<div class="topbar-divider d-none d-sm-block"></div>
		<!-- 메뉴 데이트 스팟 -->
		<li class="nav-item no-arrow"><a class="nav-link" href="main?menu=spot" id="menu-spot" role="button">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small">데이트스팟</span>
			</a></li>

		<div class="topbar-divider d-none d-sm-block"></div>
		<li class="nav-item no-arrow"><a class="nav-link" href="main?menu=serviceCenter" id="userBoard" role="button">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small">고객센터</span>
			</a></li>
		<div class="topbar-divider d-none d-sm-block"></div>
		<!-- 로그인 -->
		<li class="nav-item dropdown no-arrow"><c:if test="${empty loginedUserBean}">
				<a class="nav-link dropdown-toggle" data-bs-toggle="modal" data-bs-target="#loginModal" role="button" aria-haspopup="true" aria-expanded="false">
					<span class="mr-2 d-none d-lg-inline text-gray-600 small">로그인 </span>
				</a>
			</c:if> <c:if test="${not empty loginedUserBean}">
				<li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginedUserBean.user_name}님</span> <img class="img-profile rounded-circle" src="resources/img/undraw_profile.svg">
					</a> <!-- Dropdown - User Information -->
					<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
						<a class="dropdown-item" href="main?menu=userUpdate">
							<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 회원 정보 수정
						</a>
						<c:if test="${loginedUserBean.user_grade eq 'admin'}">
							<a class="dropdown-item" href="adminMain?menu=main">
								<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 관리자 페이지 이동
							</a>
						</c:if>

						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
							<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 로그아웃
						</a>
					</div></li>

			</c:if></li>

	</ul>
	<!-- ------------검색창--------------- -->
	<div class="topbar-search">
		<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			<div class="input-group">
				<input type="text" class="form-control bg-light border-0 small" placeholder="Search for" aria-label="Search" aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button"></button>
				</div>
			</div>
		</form>
	</div>
</nav>
<jsp:include page="user/userLogout.jsp"></jsp:include>
<jsp:include page="user/userLogin.jsp"></jsp:include>
<jsp:include page="user/userFindPassword.jsp"></jsp:include>
</html>

