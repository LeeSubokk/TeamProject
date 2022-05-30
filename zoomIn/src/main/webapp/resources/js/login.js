$(document).ready(function() {
	//로그인페이지 엔터 누트면 로그인버튼 누르기
	$('#loginForm').keypress(function(event) {
		if (event.which == 13) {
			actionLoginCheck();
			return false;
		}
	});
	
	//비밀번호 비밀번호 확인 일치 
	$('#email_site').change(function() {
		var value = $(this).val();
		$('#user_email_back').val(value);
	});

	$(function() {
		$('#user_password').keyup(function() {
			$('font[name=check]').text('');
		}); //#user_pass.keyup

		$('#chpass').keyup(function() {
			if ($('#user_password').val() != $('#chpass').val()) {
				$('font[name=check]').text('');
				$('font[name=check]').html("비밀번호가 일치하지 않습니다.");
				$('font[name=check').attr('color', '#f82a2aa3');
			} else {
				$('font[name=check]').text('');
				$('font[name=check]').html("비밀번호가 일치합니다");
				$('font[name=check').attr('color', '#1994b3');
			}
		}); 
	});
});

//로그인 ajax
function actionLoginCheck() {
	if ($('#login_id').val() == '') {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '아이디를 입력하세요.',
		})
		return false;
	}

	if ($('#login_password').val() == '') {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '비밀번호를 입력하세요.',
		})
		return false;
	}
	$.ajax({
		type: "post",
		url: "actionLoginCheck",
		data: { "login_id": $('#login_id').val(), "login_password": $('#login_password').val() },
		dataType: "json",
		success: function(json) {
			idCheckResult = json.result;

			if (idCheckResult == 'true') {
				$("#loginForm").submit();

			} else {
				Swal.fire({
					icon: 'error',
					title: '',
					text: '비밀번호가 맞지 않습니다.',
				})
				$("#login_password").val('');
				//$("#login_password").focus();
			}
		},
		error: function(error) {
			Swal.fire({
				icon: 'error',
				title: '',
				text: '아이디가 존재하지 않습니다.',
			})
			$("#login_id").val('');
			$("#login_password").val('');
			$("#login_id").focus();
		}
	});
}
