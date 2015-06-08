/* Vietnamese initialisation for the jQuery UI date picker plugin. */
/* Translated by Le Thanh Huy (lthanhhuy@cit.ctu.edu.vn). */
jQuery(function($){
	$.datepicker.regional['vi-VN'] = {
		closeText: 'Đóng',
		prevText: '&#x3C;Trước',
		nextText: 'Tiếp&#x3E;',
		currentText: 'Hôm nay',
		monthNames: ['Tháng Một', 'Tháng Hai', 'Tháng Ba', 'Tháng Tư', 'Tháng Năm', 'Tháng Sáu',
		'Tháng Bảy', 'Tháng Tám', 'Tháng Chín', 'Tháng Mười', 'Tháng Mười Một', 'Tháng Mười Hai'],
		monthNamesShort: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6',
		'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
		dayNames: ['Chủ Nhật', 'Thứ Hai', 'Thứ Ba', 'Thứ Tư', 'Thứ Năm', 'Thứ Sáu', 'Thứ Bảy'],
		dayNamesShort: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'],
		dayNamesMin: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'],
		weekHeader: 'Tu',
		dateFormat: 'dd/mm/yy',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''};
	$.datepicker.setDefaults($.datepicker.regional['vi-VN']);
	/* Vietnamese translation for the jQuery Timepicker Addon */
	/* Written by Nguyen Dinh Trung */
	$.timepicker.regional['vi-VN'] = {
		timeOnlyTitle: 'Chọn giờ',
		timeText: 'Thời gian',
		hourText: 'Giờ',
		minuteText: 'Phút',
		secondText: 'Giây',
		millisecText: 'Phần nghìn giây',
		timezoneText: 'Múi giờ',
		currentText: 'Hiện thời',
		closeText: 'Đóng',
		timeFormat: 'H:m',
		amNames: ['SA', 'AM', 'A'],
		pmNames: ['CH', 'PM', 'P'],
		isRTL: false
	};
	$.timepicker.setDefaults($.timepicker.regional['vi-VN']);
});