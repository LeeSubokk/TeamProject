<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=IBM+Plex+Sans+KR:wght@300&family=Jua&family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<script src="https://kit.fontawesome.com/00584b5208.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">



<style>
@import
	url(https://fonts.googleapis.com.com/earlyaccess/nanumgothic.css);

body, ul, h2, p {
	margin: 10px;
	padding: 0;
}

li {
	list-style-type: none;
}

body {
	
}

.test {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 20px;
	color: black;
}

.test2 {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 40px;
	color: #ffffff;
	font-weight: 900;
	font-style: inherit;
	text-shadow: -1px 0 #080808, 0 2px #000000, 2px 0 #000000, 0 -1px
		#000000;
}

.test3 {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 20px;
	color: black;
}

.introduce {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 32px;
	color: black;
	font-weight: bolder
}

.wrapper {
	display: flex;
	height: auto;
	justify-content: center;
	align-items: center;
}

.team {
	display: flex;
	justify-content: center;
	align-items: center;
}

.team-item {
	flex-basis: 250px;
	flex-shrink: 0;
	margin: 0 0px;
	transition: all .4s;
}

.team-item:hover {
	flex-basis: 300px;
	margin: 0 10px;
}

.team-item img {
	width: 100%;
	width: 100%;
	background-color: transparent;
}

.profile {
	background-color: #222;
	position: relative;
	background-color: transparent;
}

.profile:before {
	content: ' ';
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	height: 50px;
}

.profile_black {
	color: #5D5D5D;
}

.profile_pink {
	color: goldenrod;
}

.profile_green {
	color: #86E57F;
}

.profile_blue {
	color: #90FFFF;
}

.profile-contents {
	position: absolute;
	left: 2;
	bottom: 0;
	padding: 10px;
	font-family: 'Jua', sans-serif;
}

.profile-contents h2 {
	font-size: 27px;
	font-weight: bold;
	text-shadow: -1px 0 #000, 0 2px #000, 2px 0 #000, 0 -1px #000;
}

.profile-contents h2 span {
	display: block;
	font-size: 18px;
	font-weight: bold;
	text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
}

.profile-contents p {
	color: black;
	font-size: 15px;
	font-weight: bold;
	min-width: 80px;
	max-height: 0;
	overflow: hidden;
	line-height: 1.2;
	transition: all .4s;
	opacity: 0;
	transition-delay: .4s;
}

.team-item:hover .profile-contents p {
	opacity: 1;
	max-height: 6em;
}

hr.divider {
	height: 0.2rem;
	max-width: 3.25rem;
	margin: 0.5rem auto;
	background-color: #b8c9dc;
	opacity: 1;
}

hr {
	margin: 1rem 0;
	color: inherit;
	background-color: currentColor;
	border: 0;
	opacity: 0.25;
}

.material-icons {
	font-family: 'Material Icons';
	font-weight: normal;
	font-style: normal;
	font-size: 60px;
	line-height: 1;
	letter-spacing: normal;
	text-transform: none;
	display: inline-block;
	white-space: nowrap;
	word-wrap: normal;
	direction: ltr;
	-webkit-font-feature-settings: 'liga';
	-webkit-font-smoothing: antialiased;
}

.row {
	display: inline-flex;
	flex-wrap: wrap;
	margin-inline: 2px;
	margin-block: 3px;
	justify-content: center;
}

.intro {
	margin-top: 20px;
	margin-bottom: 40px;
}

.title {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: large;
}

.content {
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-size: medium;
}

.h {
	font-family: 'Dongle', sans-serif;
	font-size: xxx-large;
}

</style>



<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<div class="intro">
		<!-- ------zoomin소개------- -->

		<section class="page-section" id="services">
			<div class="px-4 px-lg-5">
				<h4 class="h">소개</h4>
				<hr class="divider" />
				<div class="row gx-4 gx-lg-5">
					<div class="col-lg-3 col-md-6 text-center">
						<div class="mt-5">
							<div class="mb-2">
								<span class="material-icons"> location_on </span>
							</div>
							<h4 class=" mb-2 title">
								데이트를 하려고<br>하시나요?
							</h4>
							<p class="text-muted mb-0 content">추천 장소를 확인해 보세요!</p>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 text-center">
						<div class="mt-5">
							<div class="mb-2">
								<span class="material-icons"> restaurant </span>
							</div>
							<h3 class="h4 mb-2 title">
								나만 모르는 맛집을<br>찾고 계신가요?
							</h3>
							<p class="text-muted mb-0 content">평점이 높은 맛집을 확인해보세요!</p>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 text-center">
						<div class="mt-5">
							<div class="mb-2">
								<span class="material-icons"> restaurant </span>
							</div>
							<h3 class="h4 mb-2 title">
								감성적인 카페를<br>찾고 계신가요?
							</h3>
							<p class="text-muted mb-0 content">조회수 높은 카페를 찾아보세요!</p>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 text-center">
						<div class="mt-5">
							<div class="mb-2">
								<span class="material-icons"> chat </span>
							</div>
							<h3 class="h4 mb-2 title">
								내가 간 곳의 후기를<br>나누고 싶으신가요?
							</h3>
							<p class="text-muted mb-0 content">평점과 후기를 올려보세요!</p>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>



	<!-- --------팀원소개------- -->
	<h4 class="h">제작진</h4>
	<hr class="divider" />
	<br>
	<div class="wrapper">
		<ul class="team">
			<li class="team-item">
				<div class="profile profile_black">
					<img src="resources/img/seng.png">
					<div class="profile-contents">
						<h2>
							이승욱 <span>총괄</span>
						</h2>
						<p>이메일 : lsu878@gmail.com
						<p>
					</div>
				</div>
			</li>

			<li class="team-item">
				<div class="profile profile_pink">
					<img src="resources/img/cja.png">
					<div class="profile-contents">
						<h2>
							최진아 <span>CSS/HTML</span>
						</h2>
						<p>이메일 : sanyuz@naver.com
						<p>
					</div>
				</div>
			</li>

			<li class="team-item">
				<div class="profile profile_green">
					<img src="resources/img/jaeseng.png">
					<div class="profile-contents">
						<h2>
							이재승 <span>기능</span>
						</h2>
						<p>이메일 : lucifer_hr@naver.com
						<p>
					</div>
				</div>
			</li>

			<li class="team-item">
				<div class="profile profile_blue">
					<img src="resources/img/young.png">
					<div class="profile-contents">
						<h2>
							이영수 <span>데이터베이스</span>
						</h2>
						<p>이메일 : ssdudtn12@naver.com
						<p>
					</div>
				</div>
			</li>
		</ul>
	</div>


</div>



</body>
</html>