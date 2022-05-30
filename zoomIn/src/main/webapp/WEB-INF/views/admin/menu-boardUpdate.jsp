<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>



<div id="content-wrapper" class="d-flex flex-column">
	<!-- Main Content -->
	<div id="content">


		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">고객센터 글 리스트</h1>
			<p class="mb-4"></p>

			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">고객센터 글 수정</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="dataTable"
							width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일자</th>
									<th>조회수</th>
									<th>게시물관리</th>
									<th>댓글관리</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일자</th>
									<th>조회수</th>
									<th>게시물관리</th>
									<th>댓글관리</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="boardList" items="${boardList}">


									<tr>
										<form action="actionBoardUpdate" name="BoardBean"
											accept-charset="utf-8" method="post"
											id="${boardList.board_code}">
											<input type="hidden" name="board_code"
												value="${boardList.board_code}">
											<td><p>${boardList.board_code}</p></td>
											
											<td><p style="display: none">
													${boardList.board_title}</p> <input type="text"
												name="board_title" value="${boardList.board_title}"
												size="10" class="updateInput"></td>

											<input type="hidden" name="user_id"
												value="${boardList.user_id}">
											<td>${boardList.user_id}</td>
												
												
											<td><p style="display: none">${boardList.board_date}
												</p> <input type="text" name="board_date"
												value="${boardList.board_date}" size="20"
												class="updateInput"></td>
												
												
											<input type="hidden" name="board_view"
												value="${boardList.board_view}">
											<td>${boardList.board_view}</td>

											<td><input type="submit" value="수정"
												class="btn btn-outline-success">
												<button class="btn btn-outline-danger" type="button"
													onclick="location.href='actionBoardDelete?board_code=${boardList.board_code}' ">삭제</button>

											</td>

											<td>
												<button class="btn btn-outline-primary" type="button"
													onclick="location.href='adminDetail?menu=boardReply&code=${boardList.board_code}'">
													댓글 보기</button>
											</td>

										</form>
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>

	</div>

</div>
















