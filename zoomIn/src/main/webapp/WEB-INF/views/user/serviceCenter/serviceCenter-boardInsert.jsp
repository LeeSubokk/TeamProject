<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="resources/js/serviceCenter.js"></script>
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="resources/css/service.css" rel="stylesheet">
</head>
<body>
	<div class="container container-fluid pt-3 overflow-auto navbar-nav-scroll">
		<div class="service_content">
			<div class="text-left h4 pl-4">
				<b>고객센터</b>
			</div>
			<form method="post" action="actionBoardInsert" id="insertForm" name="BoardBean" accept-charset="utf-8">
				<table class="service_table">
					<tr>
						<td class="bg text-center">아이디</td>
						<td class="pl-3 pr-3">${loginedUserBean.user_id}<input type="hidden" name="user_id" value="${loginedUserBean.user_id}">
						</td>
					</tr>
					<tr>
						<td class="bg text-center">제목</td>
						<td class="pl-3 pr-3">
							<input class="bg pl-1" type="text" maxlength="50" id="board_title" name="board_title">
						</td>
					</tr>
					<tr>
						<td class="bg text-center">내용</td>
						<td class="pl-3 pr-3">
							<textarea class="bg pl-1" id="board_content" name="board_content"></textarea>
						</td>
					</tr>
					<tr>
						<td class="bg text-center">첨부 파일</td>
						<td class="pl-3 pr-3">
							<input type="file" id="board_file" name="board_file" />
						</td>
					</tr>
				</table>
				<div class="service_btn text-right my-n4">
					<input class="btn btn-primary pull-right" type="button" onclick="boardInsert()" value="등록">
				</div>
			</form>
		</div>
	</div>
</body>
</html>