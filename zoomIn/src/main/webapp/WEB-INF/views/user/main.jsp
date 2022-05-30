<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<head>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>


<meta charset="utf-8">


<title>ZoomIn</title>

<!-- Custom fonts for this template-->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="topBar.jsp"></jsp:include>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<jsp:include page="${menu}.jsp"></jsp:include>
				<!-- End of Main Content -->

				<!-- Footer -->
				<jsp:include page="footer.jsp"></jsp:include>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top">
			<i class="fas fa-angle-up"></i>
		</a>



		<!-- Bootstrap core JavaScript-->
		<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	
</body>

</html>