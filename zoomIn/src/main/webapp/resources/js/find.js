let cord;

$(document).ready(function() {
	$("#cordCheckDiv").hide();
	$("#changePasswordDiv").hide();
	//비밀번호 비밀번호 확인 일치 
	$(function() {
		$('#findPassword_password').keyup(function() {
			$('font[name=check]').text('');
		}); //#user_pass.keyup

		$('#chpass').keyup(function() {
			if ($('#findPassword_password').val() != $('#chpass').val()) {
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

//정보 확인 ajax

//아이디찾기
function findIdCheck() {
	if ($('#findId_name').val() == '') {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '이름을 입력하세요.',
		})
		return false;
	}

	if ($('#findId_email').val() == '') {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '이메일을 입력하세요.',
		})
		return false;
	}
	$.ajax({
		type: "post",
		url: "findIdCheck",
		data: { "user_name": $('#findId_name').val(), "user_email": $('#findId_email').val() },
		dataType: "json",
		success: function(json) {
			findCheckResult = json.result;

			if (findCheckResult == 'fail') {
				Swal.fire({
					icon: 'error',
					title: '',
					text: '입력하신 정보가 존재하지 않습니다.',
				})
				$("#findId_name").val('');
				$("#findId_email").val('');

			} else {
				Swal.fire()
				Swal.fire({
					icon: 'info',
					title: '',
					text: '회원님의 아이디는  ' + findCheckResult + '  입니다.',
				})
				$("#findPassword_id").val(findCheckResult);
				$("#findId_name").val('');
				$("#findId_email").val('');
			}
		},
		error: function(error) {
			Swal.fire({
				icon: 'error',
				title: '',
				text: '존재하지 않습니다.',
			})

		}

	});

}

//비밀번호 찾기
function findPasswordCheck() {
	if ($('#findPassword_id').val() == '') {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '아이디를 입력하세요.',
		})
		return false;
	}

	if ($('#findPassword').val() == '') {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '이메일을 입력하세요.',
		})
		return false;
	}
	$.ajax({
		type: "post",
		url: "findPasswordCheck",
		data: { "user_id": $('#findPassword_id').val(), "user_email": $('#findPassword_email').val() },
		dataType: "json",
		
		beforeSend:function(){
			$('html').css("cursor","wait");
		},
		
		complete: function(){
			$('html').css("cursor","auto");
		},
		
		success: function(json) {
			findCheckResult = json.result;
			$('html').css("cursor","auto");
			
			if (findCheckResult == 'fail') {
				Swal.fire({
					icon: 'error',
					title: '',
					text: '입력하신 정보가 맞지 않습니다.',
				})
				$("#findPassword_id").val('');
				$("#findPassword_email").val('');

			} else {
				cord = findCheckResult;
				$("#cordCheckDiv").show();
				Swal.fire(`입력하신 메일 주소로 
				이메일이 발송 되었습니다.`)

			}
		},
		error: function(error) {
			Swal.fire({
				icon: 'error',
				title: '',
				text: '아이디가 존재하지 않습니다.',
			})

		}

	});
}


// 비밀번호 찾기 코드 체크
function cordCheck() {
	if (cord == $('#email_cord').val()) {

		$("#changePasswordDiv").show();
		$("#idFindSelect").hide();
		$("#cordCheckDiv").hide();
	} else {
		Swal.fire({
			icon: 'error',
			title: '',
			text: '코드가 올바르지 않습니다.',
		})
	}
}

//비밀번호 찾기 유효성검사
function changePassword() {
	// 비밀번호 영문자+숫자+특수문자 조합(8~16자리 입력) 정규식
	var passCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

	if (!passCheck.test($('#findPassword_password').val())) {
		Swal.fire({
			icon: 'error',
			title: "비밀번호는 영문자+숫자+특수문자 조합으로 8~16자리 사용해야 합니다.",
		})
		password.focus();
		return false;
	};

	if ($('#findPassword_password').val() !== $('#chpass').val()) {
		Swal.fire({
			icon: 'error',
			title: "비밀번호가 일치하지 않습니다.",
		})
		password.focus();
		return false;
	}
	$('#findForm').submit()
}

