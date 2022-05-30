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
			<h1 class="h3 mb-2 text-gray-800">고객센터 댓글리스트</h1>
			<p class="mb-4"></p>

			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">댓글 목록</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="dataTable"
							width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>아이디</th>
									<th>내용</th>
									<th>날짜</th>
									<th>댓글관리</th>



								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>아이디</th>
									<th>내용</th>
									<th>날짜</th>
									<th>댓글관리</th>




								</tr>
							</tfoot>
							<tbody>
								<c:forEach items="${replylist}" var="replylist">
									<tr>
										<form action="actionBoardReplyUpdate" name="BoardReplyBean"
											accept-charset="utf-8" method="post"
											id="${replylist.reply_code}" size="10" class="updateInput">
											<input type="hidden" name="reply_code"
												value="${replylist.reply_code}"> <input
												type="hidden" name="board_code"
												value="${replylist.board_code}">

											<td>${replylist.user_id} <input type="hidden"
												name="user_id" value="${replylist.user_id}" size="20"
												class="updateInput">
											</td>

											<td><p style="display: none">${replylist.reply_content}</p>
												<input type="text" name="reply_content"
												value="${replylist.reply_content}" size="20"
												class="updateInput"></td>

											<td>${replylist.reply_date_toString}<input type="hidden"
												value="${replylist.reply_date_toString}" size="20"
												class="updateInput">
											</td>

											<td><input type="submit" value="수정"
												class="btn btn-outline-success">
												<button class="btn btn-outline-danger" type="button"
													onclick="location.href='actionBoardReplyDelete?reply_code=${replylist.reply_code}'">삭제</button></td>


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
