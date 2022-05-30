
/**
function checkSelectAll(checkbox, category) {
	const selectall
		= document.querySelector('input[name="selectContentAll"]');

	const query = 'input[name="selectContent"]:checked'
	const selectedElements =
		document.querySelectorAll(query); //선택된 체크박스 가져오기

	const query2 = 'input[name="selectContent"]'
	const allElements =
		document.querySelectorAll(query2); //전체 체크박스 가져오기

	if (checkbox.checked === false) {
		selectall.checked = false;
	}
	if (allElements.length === selectedElements.length) {
		selectall.checked = true;
	}

}

$(function() {
	$("#selectContentAll").change(function() {
		const checkboxes = document.getElementsByName('selectContent');
		
		if ($(this).is(":checked") == true) {
			checkboxes.forEach((checkbox) => {
				checkbox.checked = $(this).is(":checked");
			})
			$('.spot-list').show();
		} else {
			checkboxes.forEach((checkbox) => {
				checkbox.checked = $(this).is(":checked");
			})
		}

	});
});
 */

//카테고리 선택
$(function() {
	$(".selectContent").change(function() {
		const query = 'input[name="selectContent"]:checked'
		const selectedElements = document.querySelectorAll(query); //선택된 체크박스 가져오기
		if (selectedElements.length == 0) {
			checkContent('음식점');
			checkContent('카페');
			checkContent('전시');
			checkContent('숙소');
			$('.selectContent').prop("checked", true);

		}
		if ($(this).is(":checked") == true) {
			var category = $(this).val()
			checkContent(category);
		} else {
			var category = $(this).val()
			unCheckContent(category);
		}

	});
});

//카테고리 체크박스 선택
function checkContent(category) {
	$('.' + category).show();
}
function unCheckContent(category) {
	$('.' + category).hide();
}


//정렬 
function category(category) {
	$("#content").load("placeArrange?menu=spot&method=" + category + "#place");
}



