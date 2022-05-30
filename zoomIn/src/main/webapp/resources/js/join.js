//이메일 입력
$(document).ready(function() {
	$('#email_site').change(function() {
		var value = $(this).val();
		$('#user_email_back').val(value);
	});
});

//비밀번호 비밀번호 확인 일치
$(function() {
	$('#user_password').keyup(function() {
		$('font[name=check]').text('');
	}); //#user_pass.keyup

	$('#checkpass').keyup(function() {
		if ($('#user_password').val() != $('#checkpass').val()) {
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

//회원가입 도로명 주소
function execDaumPostcode() {
	new daum.Postcode(
		{
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
						&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
						&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("user_extraAddress").value = extraAddr;

				} else {
					document.getElementById("user_extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('user_postcode').value = data.zonecode;
				document.getElementById("user_roadAddress").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("user_detailAddress").focus();
			}
		}).open();
}

//아이디 중복체크
idCheckResult = 1;
function idCheck() {
	var idCheck = /^[a-zA-Z0-9]{4,12}$/;

	if (!idCheck.test($('#user_id').val())) {
		Swal.fire({
			icon: 'error',
			title: '아이디는 영문 대소문자 조합으로 4~12자리 사용해야 합니다.',
		})
		$("#user_id").val('');
		id.focus;
		return false;
	}

	$.ajax({
		type: "post",
		url: "actionIdCheck",
		data: { "user_id": $('#user_id').val() },
		dataType: "json",
		success: function(json) {
			idCheckResult = json.result;
			if (idCheckResult == '0') {

				Swal.fire({
					title: '사용하시겠습니까?',
					text: "사용가능 한 아이디 입니다!",
					icon: 'info',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: '사용',
					cancelButtonText: '취소'
				}).then((result) => {
					if (result.isConfirmed) {
						$("#user_id").attr("readonly", true);
						$("#user_password").focus();
					} else {
						idCheckResult = 1;
						$("#user_id").val('');
						$("#user_id").focus();
					}

				})

			} else {
				Swal.fire({
					icon: 'error',
					title: '',
					text: '이미 사용중인 아이디 입니다.',
				})
				idCheckResult = 1;
				$("#user_id").val('');
				$("#user_id").focus();
			}
		},
		error: function(error) {
			alert("error : " + error);
		}

	});

}


//회원가입 유효성검사
function join_check() {
	var id = document.getElementById("user_id");
	var password = document.getElementById("user_password");
	var checkpass = document.getElementById("checkpass");
	var name = document.getElementById("user_name");
	var birthday = document.getElementById("user_birthday");
	var gender = document.getElementById("user_gender");
	var phone1 = document.getElementById("user_phone1");
	var phone2 = document.getElementById("user_phone2");
	var phone3 = document.getElementById("user_phone3");
	var emailForward = document.getElementById("user_email_forward");
	var emailBack = document.getElementById("user_email_back");
	var postcode = document.getElementById("user_postcode");
	var roadAddress = document.getElementById("user_roadAddress");
	var detailAddress = document.getElementById("user_detailAddress");

	if (id.value == "") {
		Swal.fire({
			icon: 'error',
			title: '아이디를 입력하세요.',
		})
		id.focus();
		return false;

	};

	var idCheck = /^[a-zA-Z0-9]{4,12}$/;

	if (!idCheck.test(id.value)) {
		Swal.fire({
			icon: 'error',
			title: '아이디는 영문 대소문자 조합으로 4~12자리 사용해야 합니다.',
		})
		id.focus();
		return false;
	}

	if (password.value == "") {
		Swal.fire({
			icon: 'error',
			title: "비밀번호를 입력하세요.",
		})
		password.focus();
		return false;

	};

	// 비밀번호 영문자+숫자+특수문자 조합(8~16자리 입력) 정규식
	var passCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

	if (!passCheck.test(password.value)) {
		Swal.fire({
			icon: 'error',
			title: "비밀번호는 영문자+숫자+특수문자 조합으로 8~16자리 사용해야 합니다.",
		})
		password.focus();
		return false;
	};

	if (password.value !== checkpass.value) {
		Swal.fire({
			icon: 'error',
			title: "비밀번호가 일치하지 않습니다.",
		})
		password.focus();
		return false;
	}
	//----------------------------------------------------


	if (name.value == "") {
		Swal.fire({
			icon: 'error',
			title: "이름을 입력하세요.",
		})
		name.focus();
		return false;
	};


	if (phone1.value == "") {
		Swal.fire({
			icon: 'error',
			title: "전화번호를 입력하세요.",
		})
		phone1.focus();
		return false;
	}

	if (phone2.value == "" || phone2.value.length < 3) {
		Swal.fire({
			icon: 'error',
			title: "전화번호를 입력하세요.",
		})
		phone2.focus();
		return false;
	}

	if (phone3.value == "" || phone3.value.length < 4) {
		Swal.fire({
			icon: 'error',
			title: "전화번호를 입력하세요.",
		})
		phone3.focus();
		return false;
	}


	if (emailForward.value == "") {
		Swal.fire({
			icon: 'error',
			title: "이메일 주소를 입력하세요.",
		})
		email.focus();
		return false;
	};

	if (emailBack.value == "") {
		Swal.fire({
			icon: 'error',
			title: "이메일 주소를 입력하세요.",
		})
		email.focus();
		return false;
	};

	if (postcode.value == "" || roadAddress.value == "" || detailAddress.value == "") {
		Swal.fire({
			icon: 'error',
			title: "주소를 입력하세요.",
		})
		postcode.focus();
		return false;
	};

	if (idCheckResult != 0) {
		Swal.fire({
			icon: 'error',
			title: "아이디 중복 체크를 해주세요.",
		})
		return false;
	}

	$("#user_email").val(emailForward.value + '@' + emailBack.value);
	$("#user_phone").val(phone1.value + '-' + phone2.value + '-' + phone3.value);
	document.UserBean.submit();

}
