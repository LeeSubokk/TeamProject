<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="resources/css/service.css" rel="stylesheet">
<script src="resources/js/serviceCenter.js"></script>
<script src="https://kit.fontawesome.com/00584b5208.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
</head>
<body>
	<div class="container container-fluid pt-3 overflow-auto navbar-nav-scroll">
		<div class="boardView">
			<div class="h4 text-left">
				<b>${board.board_title}</b>
			</div>
			<div class="border-bottom-secondary" style="display: flow-root">
				<span class="float-left">${board.user_id}<span class="tab">&#9;</span>${board.board_date}</span> <span class="float-right">조회수 ${board.board_view}</span>
			</div>
			<div class="board_file float-right text-gray-600">
				<span class="small pr-2">첨부 파일 :</span> 
			<span class="viewfile pr-2"><a href="<c:url value='${board.board_file}'/>">${board.board_file}</a></span>
			</div>
			<div class="board_content">${board.board_content}</div>
			<div class="board_Btn text-right figure-caption">
				<a href="main?menu=serviceCenter">
					<i class="fas fa-list"></i>목록
				</a>
				<a href="boardUpdate?menu=serviceCenter-boardUpdate&board_code=${board.board_code}">
					<i class="far fa-edit"></i>수정
				</a>
				<a href="actionBoardDelete?board_code=${board.board_code}">
					<i class="fas fa-trash-alt"></i>삭제
				</a>
				<a href="main?menu=serviceCenter-boardInsert">
					<i class="fas fa-edit"></i>글쓰기
				</a>
			</div>

			<div class="board_comment bg-white">
				<c:if test="${not empty loginedUserBean}">
					<form method="post" action="actionBoardReplyInsert" id="insertReplyForm" name="BoardReplyBean" accept-charset="utf-8">
						<div class="comment">
							<input type="hidden" id="insertReplyUserId" name="user_id" value="${loginedUserBean.user_id}">
							<textarea class="noResize small pl-2" id="insertReplyContent" name="reply_content" placeholder=" * 관리자만 댓글을 작성할 수 있습니다."></textarea>
							<input type="hidden" name="board_code" value="${board.board_code}">
							<button type="submit" class="btn btn-sm btn-sm btn-primary" style="margin-left: 4px">등록</button>
						</div>
					</form>
				</c:if>
				<div class="comment_list">
					<table id="replys">
						<c:forEach items="${replys}" var="replys">
							<tr class="reply">
								<c:choose>
									<c:when test="${replys.user_id eq loginedUserBean.user_id || loginedUserBean.user_grade eq 'admin'}">
										<td class="text-left pl-2">${replys.user_id}</td>
									</c:when>
									<c:otherwise>
										<td class="text-left pl-2">관리자</td>
									</c:otherwise>
								</c:choose>
								<td>
									<label id="previous${replys.reply_code}">${replys.reply_content}</label>
									<form id="form${replys.reply_code}" action="actionBoardReplyUpdate" name="BoardReplyBean" accept-charset="utf-8">
										<input type="hidden" name="user_id" value="${replys.user_id}">
										<input type="hidden" name="board_code" value="${replys.board_code}">
										<input type="hidden" name="reply_code" value="${replys.reply_code}">
										<input type="text" class="changeReply" id="change${replys.reply_code}" name="reply_content" value="${replys.reply_content}">
										<input type="button" class="changeReply" id="button${replys.reply_code}" value="수정" onclick="replyUpdate('${replys.reply_code}')">
									</form>
								</td>
								<td class="text-right small pl-3 pr-2">
									<c:if test="${loginedUserBean.user_grade eq 'admin' || replys.user_id eq loginedUserBean.user_id}">
										<div class="text-right">
											<a href="javascript:void(0);" onclick="changeInput('${replys.reply_code}')">수정</a>
											<a href="#" onclick="replyDelete('actionBoardReplyDelete?reply_code=${replys.reply_code}&board_code=${replys.board_code}')">삭제</a>
										</div>
									</c:if>
									${replys.reply_date_toString}
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>