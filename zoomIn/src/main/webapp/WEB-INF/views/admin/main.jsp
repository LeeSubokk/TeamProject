<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>ZoomIn 관리자 페이지</title>

</head>

<body id="page-top">
	<c:if test="${loginedUserBean.user_grade ne 'admin'}">
		<c:redirect url="main?menu=main-content" />
	</c:if>
	<!-- Page Wrapper -->
	<div id="wrapper">
		<jsp:include page="sideBar.jsp"></jsp:include>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<jsp:include page="topBar.jsp"></jsp:include>
				<!-- Begin Page Content -->
				<jsp:include page="menu-${menu}.jsp"></jsp:include>
			</div>
			<!-- End of Main Content -->
			<!-- Footer -->
			<jsp:include page="footer.jsp"></jsp:include>
			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
</body>
</html>