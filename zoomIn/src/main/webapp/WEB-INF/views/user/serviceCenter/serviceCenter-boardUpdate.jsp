<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">


<title>Insert title here</title>
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="resources/js/serviceCenter.js"></script>
</head>
<body>
	<div class="container">
		<form method="post" action="actionBoardUpdate" id="updateForm" name="BoardBean" accept-charset="utf-8">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"><h4>게시물 수정</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;">
							<h5>아이디</h5>
						</td>
						<td>
							<h5>${board.user_id}</h5>
							<input type="hidden" name="user_id" value="${loginedUserBean.user_id}">

							<input type="hidden" name="board_code" value="${board.board_code}">
						</td>
					</tr>

					<tr>
						<td style="width: 110px;">
							<h5>글 제목</h5>
						</td>
						<td>
							<input class="form-control" type="text" maxlength="50" id="board_title" name="board_title" value="${board.board_title}">
						</td>
					</tr>

					<tr>
						<td style="width: 110px;">
							<h5>글 내용</h5>
						</td>
						<td>
							<textarea class="form-control" rows="10" id="board_content" name="board_content" maxlength="2048">${board.board_content}</textarea>
						</td>
					</tr>



					<tr>
						<td style="text-align: left;" colspan="3">
							<h5 style="color: red;"></h5>
							<input class="btn btn-primary pull-right" type="button" onclick="boardUpdate()" value="수정하기">
				</tbody>

			</table>



		</form>
	</div>


</body>
</html>