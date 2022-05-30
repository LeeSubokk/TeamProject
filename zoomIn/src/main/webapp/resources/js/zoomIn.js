$(document).ready(function() {
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
		}); //#chpass.keyup
	});

	//토글스위치
	$("#togleSwitch").click(function() {
		var toggle = $(this).val();
		if (toggle == 'off') {
			toggle = 'on';
			$(this).val('on');
		} else {
			toggle = 'off';
			$(this).val('off');
		}
		$("#togleSwitch_Hidden").val($(this).val());
	});

	


	//어드민페이지 유저 업데이트 도로명주소
	$(".exchangeAddress").click(function() {
		var th = $(this);
		var tr = th.closest('tr');
		postcode = tr.find("td:eq(6)").children('.updateInput');
		roadAddress = tr.find("td:eq(7)").children('.updateInput');
		detailAddress = tr.find("td:eq(8)").children('.updateInput');
		extraAddress = tr.find("td:eq(9)").children('.updateInput');

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
						extraAddress.val(extraAddr);

					} else {
						extraAddress.val('');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					//document.getElementById('user_postcode').value = data.zonecode;
					postcode.val(data.zonecode);
					roadAddress.val(addr);
					// 커서를 상세주소 필드로 이동한다.
					detailAddress.focus();
				}
			}).open();


	});
});



//비밀번호 변경 접기


function foldDiv() {
	if ($("#passwordChange").val() == 'off') {
		$(".changePassword").show();
		$("#passwordChange").val('on')

	} else {
		$(".changePassword").hide();
		$("#passwordChange").val('off')
	}

}

//회원정보 수정 유효성 검사
function updateCheck() {
	var id = document.getElementById("user_id");
	var password = document.getElementById("user_password");
	var chpass = document.getElementById("chpass");
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



	if ($("#onoffSwitch").val() == 'on') {

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

		if (password.value !== chpass.value) {
			Swal.fire({
				icon: 'error',
				title: "비밀번호가 일치하지 않습니다.",
			})
			password.focus();
			return false;
		}
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

	$("#passwordSwitch").val($(".onoffSwitch").val());

	$("#user_email").val(emailForward.value + '@' + emailBack.value);
	$("#user_phone").val(phone1.value + '-' + phone2.value + '-' + phone3.value);
	document.UserBean.submit();

}




