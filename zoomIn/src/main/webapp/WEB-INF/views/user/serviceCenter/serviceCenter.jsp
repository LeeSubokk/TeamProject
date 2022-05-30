<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="resources/css/service.css" rel="stylesheet">
<link href="resources/css/servicePage.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="resources/js/serviceCenter.js"></script>
<script src="https://kit.fontawesome.com/00584b5208.js" crossorigin="anonymous"></script>


<script>
	window.console = window.console || function(t) {
	};
</script>
<script>
	if (document.location.search.match(/type=embed/gi)) {
		window.parent.postMessage("resize", "*");
	}
</script>

</head>

<body>
	<div class="container container-fluid pt-3">
		<div class="service_content">
			<div class="text-left h4 pl-4">
				<b>고객센터</b>
			</div>
			<table class="service_table" id="service_table">
				<form action="" id="setRows"></form>
				<colgroup>
					<col class="num">
					<col class="title">
					<col class="name">
					<col class="date">
					<col class="view">
				</colgroup>
				<thead>
					<tr class="text-gray-700 text-center">
						<th scope="col" class="num">번호</th>
						<th scope="col" class="title">제목</th>
						<th scope="col" class="name">작성자</th>
						<th scope="col" class="date">작성일</th>
						<th scope="col" class="file">파일</th>
						<th scope="col" class="view">조회</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="boardList" items="${boardList}">
						<tr class="readBoard" id="${boardList.board_code}">
							<td class="num text-center">${boardList.board_code}</td>
							<td class="title text-left pl-3">
								${boardList.board_title} <span class="replyCnt pl-2">(${boardList.board_reply_count})</span>
							</td>
							<td class="name text-center">
								<c:choose>
									<c:when test="${loginedUserBean.user_grade eq 'admin'}">${boardList.user_id}</c:when>
									<c:when test="${loginedUserBean.user_id eq boardList.user_id}">${boardList.user_id}</c:when>
									<c:otherwise>
										<c:out value="${fn:substring(boardList.user_id, 0, fn:length(boardList.user_id) - 4)}" />****</c:otherwise>
								</c:choose>
							</td>
							<td class="date text-center">${boardList.board_date}</td>
							<td class="file text-center">
								<c:if test="${boardList.board_file ne null}">
									<i class="fas fa-paperclip"></i>
								</c:if>
							</td>
							<td class="view text-center">${boardList.board_view}</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${not empty loginedUserBean}">
			<div class="service_btn">
				<a href="main?menu=serviceCenter-boardInsert" class="btn btn-primary pull-right">글 작성</a>
			</div>
			</c:if>
			<div class="board_bottom">
				<div class="board_search">
					<form action="?act=list" method="post">
						<input type="hidden" name="m" value="296">
						<input type="hidden" name="categoryId" value="0">
						<div class="searchBoard">
							<select name="searchObject" id="searchObject small">
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="user_name">이름</option>
								<option value="user_id">아이디</option>
							</select>
							<input type="text" name="searchKeyword" id="searchKeyword" value="" title="검색어">
							<input type="submit" id="saerchBtn" value="검색">
						</div>
					</form>
				</div>
				<div class="service_page">
					<div class="page_prev page_ctrl">
					</div>
					<div class="current_page" id="current_page">
						<div class="this_page"></div>
						<div class="total_page"></div>
					</div>
					<div class="page_next page_ctrl">
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$('.readBoard').click(function() {
			let user_id = '${loginedUserBean.user_id}';
			let board_Code = $(this).attr('id');
			if (user_id == '') {
				Swal.fire({
					icon : 'error',
					title : '',
					text : '작성자만 읽을 수 있습니다',
				})
				return;
			}
			actionReadCheck(user_id, board_Code);
		});
	</script>

	<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
	<script id="rendered-js">
		var $setRows = $('#setRows');

		$setRows.submit(function(e) {
			e.preventDefault();
			var rowPerPage = 12; // 1 을  곱하여 문자열을 숫자형로 변환
			var $service_table = $('#service_table');
			var $tr = $($service_table).find('tbody tr');
			var rowTotals = $tr.length;
			var pageTotal = Math.ceil(rowTotals / rowPerPage);
			var i = 0;
			for (; i < pageTotal; i++) {
				if (window.CP.shouldStopExecution(0))
					break;
				$('<a href="#"></a>').attr('rel', i).html(i + 1).appendTo(
						'.current_page');
			}
			$('<a href="#"></a>').attr('rel',0).html('<i class="fa fa-angle-double-left"></i>').appendTo('.page_prev');
			$('<a href="#"></a>').attr('rel',pageTotal-1).html('<i class="fa fa-angle-double-right"></i>').appendTo('.page_next');
			window.CP.exitedLoop(0);
			$tr.addClass('off-screen').slice(0, rowPerPage).removeClass(
					'off-screen');
			
			
			
			var $pagingLink = $('.service_page a');
			$pagingLink.on('click', function(evt) {
				evt.preventDefault();
				var $this = $(this);
				$('current_page').attr('rel')
				$('total_page').append($this);
				if ($this.hasClass('active')) {
					return;
				}
				$pagingLink.removeClass('active');
				$this.addClass('active');
				var currPage = $this.attr('rel');
				var startItem = currPage * rowPerPage;
				var endItem = startItem + rowPerPage;

				$tr.css('opacity', '0.0').addClass('off-screen').slice(
						startItem, endItem).removeClass('off-screen').animate({
					opacity : 1
				}, 300);

			});

			$pagingLink.filter(':first').addClass('active');

		});

		$setRows.submit();
	</script>
</body>
</html>