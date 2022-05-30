<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">ZOOMIN</h1>

	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2" onclick="location.href='main?menu=route';">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">관리자 전용</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">추천 경로</div>
						</div>
						<div class="col-auto">
							<i class="material-icons text-info">flight_land</i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2" onclick="location.href='main?menu=spot';">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-success text-uppercase mb-1">관리자 전용</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">데이트 스팟</div>
						</div>
						<div class="col-auto">
							<i class="material-icons text-danger">favorite</i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100 py-2" onclick="location.href='main?menu=serviceCenter';">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-info text-uppercase mb-1">관리자 전용</div>

							<div class="row no-gutters align-items-center">
								<div class="col-auto">
									<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">고객 센터</div>
								</div>

							</div>
							<div class="col-auto">
								<i class="material-icons text-warning">stars</i>

							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-success text-uppercase mb-1">관리자 전용</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">가입 회원</div>
						</div>
						<div class="col-auto">
							<i class="material-icons text-danger">favorite</i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-6 mb-4">

			<!-- Project Card Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">플레이스</h6>
				</div>
				<c:set var="north" value="0" />
				<c:set var="south" value="0" />
				<c:set var="west" value="0" />
				<c:set var="east" value="0" />
				<c:set var="gwang" value="0" />
				<c:forEach var="pl" items="${placeList}">
					<c:choose>
						<c:when test="${fn:contains(pl.place_address, '북구')}">
							<c:set var="north" value="${north + 1}" />
						</c:when>
						<c:when test="${fn:contains(pl.place_address, '남구')}">
							<c:set var="south" value="${south + 1}" />
						</c:when>
						<c:when test="${fn:contains(pl.place_address, '서구')}">
							<c:set var="west" value="${west + 1}" />
						</c:when>
						<c:when test="${fn:contains(pl.place_address, '동구')}">
							<c:set var="east" value="${east + 1}" />
						</c:when>
						<c:when test="${fn:contains(pl.place_address, '광산구')}">
							<c:set var="gwang" value="${gwang + 1}" />
						</c:when>
					</c:choose>
				</c:forEach>
				<c:set var="num" value="${fn:length(placeList)}" />
				<div class="card-body">
					<h4 class="small font-weight-bold">
						북구 <span class="float-right">${north}/${num}</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-danger" role="progressbar" style="width: ${north/num*100}%" aria-valuenow="${north/num*100}" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						남구 <span class="float-right">${south}/${num}</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-warning" role="progressbar" style="width: ${south/num*100}%" aria-valuenow="${south/num*100}" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						동구 <span class="float-right">${east}/${num}</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar" role="progressbar" style="width: ${east/num*100}%" aria-valuenow="${east/num*100}" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						서구 <span class="float-right">${west}/${num}</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-info" role="progressbar" style="width: ${west/num*100}%" aria-valuenow="${west/num*100}" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						광산구 <span class="float-right">${gwang}/${num}</span>
					</h4>
					<div class="progress">
						<div class="progress-bar bg-success" role="progressbar" style="width: ${gwang/num*100}%" aria-valuenow="${gwang/num*100}" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>

			</div>
			
			
			

		</div>


	</div>