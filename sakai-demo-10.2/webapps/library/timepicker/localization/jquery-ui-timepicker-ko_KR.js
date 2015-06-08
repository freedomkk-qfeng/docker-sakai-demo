/* Korean initialisation for the jQuery calendar extension. */
/* Written by DaeKwon Kang (ncrash.dk@gmail.com), Edited by Genie. */
jQuery(function($){
	$.datepicker.regional['ko-KR'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		monthNames: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: true,
		yearSuffix: '년'};
	$.datepicker.setDefaults($.datepicker.regional['ko-KR']);
	/* Korean translation for the jQuery Timepicker Addon */
	/* Written by Genie */
	$.timepicker.regional['ko-KR'] = {
		timeOnlyTitle: '시간 선택',
		timeText: '시간',
		hourText: '시',
		minuteText: '분',
		secondText: '초',
		millisecText: '밀리초',
		timezoneText: '표준 시간대',
		currentText: '현재 시각',
		closeText: '닫기',
		timeFormat: 'tt h:mm',
		amNames: ['오전', 'AM', 'A'],
		pmNames: ['오후', 'PM', 'P'],
		isRTL: false
	};
	$.timepicker.setDefaults($.timepicker.regional['ko-KR']);
});