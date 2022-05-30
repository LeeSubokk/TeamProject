<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Page Wrapper -->
<div id="wrapper">

	<!-- Sidebar -->
	<ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

		<!-- Sidebar - Brand -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="main?menu=main-content">

			<div class="sidebar-brand-text mx-3">
				<img src="resources/img/logo3.png" width="90%">
			</div>
			<!-- 왼쪽 상단 -->
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item active"><a class="nav-link" href="adminMain?menu=main">
				<span class="material-icons">home</span> <span>HOME</span>
			</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">페이지 관리</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
				<span class="material-icons"> vertical_split </span> <span>장소 관리</span>
			</a>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">장소 관리</h6>
					<a class="collapse-item" href="adminMain?menu=placeList">장소 목록</a>
					<a class="collapse-item" href="adminMain?menu=placeUpdate">장소 목록 수정</a>
					<a class="collapse-item" href="adminMain?menu=placeInsert">장소 등록</a>

				</div>
			</div></li>

		<!-- Nav Item - Utilities Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
				<span class="material-icons">shopping_cart</span> <span>고객센터</span>
			</a>
			<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Custom Utilities:</h6>
					<a class="collapse-item" href="adminMain?menu=boardList">고객센터 목록</a>
					<a class="collapse-item" href="adminMain?menu=boardUpdate">고객센터 목록 수정</a>
				</div>
			</div></li>

		<!-- Nav Item - Pages Collapse Menu -->
		<!--   	<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#transaction"
				aria-expanded="true" aria-controls="transaction"> 
				<span class="material-icons">paid</span>
				<span>거래 관리</span>
			</a>
				<div id="transaction" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="/3S25/moveTransactionContent.do">거래 내역</a> <a
							class="collapse-item" href="#">추가</a> 
					</div>
				</div></li>
				
				-->




		<hr class="sidebar-divider">

		<div class="sidebar-heading">회원 관리</div>

		<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
				<span class="material-icons">manage_accounts</span> <span>회원 관리</span>
			</a>
			<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">회원정보</h6>
					<a class="collapse-item" href="adminMain?menu=userList">회원정보</a>
					<a class="collapse-item" href="adminMain?menu=userUpdate">회원정보수정</a>
				</div>
			</div></li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>
	</ul>
</div>

<jsp:include page="link.jsp"></jsp:include>
<jsp:include page="script.jsp"></jsp:include>
