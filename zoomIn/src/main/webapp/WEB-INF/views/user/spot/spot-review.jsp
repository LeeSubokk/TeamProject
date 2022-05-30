<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<div class="modal fade" id="reviewWrite" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<!-- ------리뷰 내용 보내야하는 곳 평점, 내용------- -->
			<form method="post" action="actionPlaceReplyInsert" id="insertReplyForm" name="PlaceReplyBean" accept-charset="utf-8">
				<div class="pt-2">
					<strong class="star-textarea">별점을 눌러주세요.</strong>
				</div>
				<div class="starArea">
					<fieldset>
						<input type="radio" name="reply_grade" value="5" id="rate1">
						<label for="rate1">⭐</label>
						<input type="radio" name="reply_grade" value="4" id="rate2">
						<label for="rate2">⭐</label>
						<input type="radio" name="reply_grade" value="3" id="rate3">
						<label for="rate3">⭐</label>
						<input type="radio" name="reply_grade" value="2" id="rate4">
						<label for="rate4">⭐</label>
						<input type="radio" name="reply_grade" value="1" id="rate5">
						<label for="rate5">⭐</label>
					</fieldset>
				</div>
				<div class="line"></div>
				<div class="review-content">
					<textarea class="review-text bg" id="insertReplyContent" name="reply_content"></textarea>
				</div>
				<div class="rvControl mt-2 mb-3">
					<input type="hidden" name="place_code" value="${place.place_code}">
					<input type="hidden" id="insertReplyUserId" name="user_id" value="${loginedUserBean.user_id}">
					<input class="btn btn-primary" id="insertReplyButton" type="button" value="등록" onclick="replySubmit()">
				</div>
			</form>
		</div>
	</div>
</div>