$(document).ready(function() {
	$('.changeReply').hide();

	//댓글 작성 유효성 검사
	$("#insertReplyForm").submit(function() {
		if ($("#insertReplyContent").val() == '') {
			Swal.fire({
				icon: 'error',
				title: '',
				text: '댓글 내용을 입력해 주세요.',
			})
			return false;
		}
		if ($("#insertReplyUserId").val() == '') {
			Swal.fire({
				icon: 'error',
				title: '',
				text: '로그인 해야만 작성 가능합니다.',
			})
			return false;
		}
	});
});

//insert 유효성검사
function boardInsert() {
	if ($("#board_title").val() == '') {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '제목을 입력해주세요.',
		})
		return false;
	}
	if ($("#board_content").val() == '') {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '내용을 입력해주세요.',
		})
		return false;
	}

	Swal.fire({
		title: '등록하시겠습니까?',
		text: "",
		icon: 'info',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '등록',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			$('#insertForm').submit();
		} else {
			return false;
		}

	})
}

//update 유효성검사
function boardUpdate() {
	if ($("#board_title").val() == '') {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '제목을 입력해주세요.',
		})
		return false;
	}
	if ($("#board_content").val() == '') {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '내용을 입력해주세요.',
		})
		return false;
	}

	Swal.fire({
		title: '수정하시겠습니까?',
		text: "",
		icon: 'info',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '수정',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			$('#updateForm').submit();
		} else {
			return false;
		}

	})
}

//댓글 수정란 펴기
function changeInput(reply_code) {
	if ($('#change' + reply_code).is(':visible')) {
		$('#change' + reply_code).hide();
		$('#button' + reply_code).hide();
		$('#previous' + reply_code).show();
	} else {
		$('#change' + reply_code).show();
		$('#button' + reply_code).show();
		$('#previous' + reply_code).hide();
	}

}


//업데이트 확인
function replyUpdate(reply_code) {

	if ($("#change"+reply_code).val() == '') {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '댓글 내용을 입력해주세요.',
		})
		return false;
	}

	Swal.fire({
		title: '수정하시겠습니까?',
		text: "",
		icon: 'info',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '수정',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			$('#form' + reply_code).submit();
		} else {
			return false;
		}

	})
}


//삭제 확인
function replyDelete(href) {
	Swal.fire({
		title: '삭제하시겠습니까?',
		text: "",
		icon: 'error',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '삭제',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			location.href = href;
		} else {
			return false;
		}

	})
}

//게시글 읽기 권한 확인
function actionReadCheck(user_id, board_Code) {
	$.ajax({
		type: "post",
		url: "actionReadCheck",
		data: { "user_id": user_id, "board_code": board_Code },
		dataType: "json",
		success: function(json) {
			readCheckResult = json.result;
			if (readCheckResult == 'false') {
				Swal.fire({
					icon: 'error',
					title: '',
					text: '작성자만 읽을 수 있습니다.',
				})
			} else {
				$(location).attr("href", "actionBoardView?board_code=" + board_Code)
			}
		},
		error: function(error) {
			alert("error : " + error);
		}
	});
}