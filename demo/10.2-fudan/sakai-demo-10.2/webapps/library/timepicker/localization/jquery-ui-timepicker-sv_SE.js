/* Swedish initialisation for the jQuery UI date picker plugin. */
/* Written by Anders Ekdahl ( anders@nomadiz.se). */
jQuery(function($){
	$.datepicker.regional['sv-SE'] = {
		closeText: 'Stäng',
		prevText: '&#xAB;Förra',
		nextText: 'Nästa&#xBB;',
		currentText: 'Idag',
		monthNames: ['Januari','Februari','Mars','April','Maj','Juni',
		'Juli','Augusti','September','Oktober','November','December'],
		monthNamesShort: ['Jan','Feb','Mar','Apr','Maj','Jun',
		'Jul','Aug','Sep','Okt','Nov','Dec'],
		dayNamesShort: ['Sön','Mån','Tis','Ons','Tor','Fre','Lör'],
		dayNames: ['Söndag','Måndag','Tisdag','Onsdag','Torsdag','Fredag','Lördag'],
		dayNamesMin: ['Sö','Må','Ti','On','To','Fr','Lö'],
		weekHeader: 'Ve',
		dateFormat: 'yy-mm-dd',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''};
	$.datepicker.setDefaults($.datepicker.regional['sv-SE']);
	/* Swedish translation for the jQuery Timepicker Addon */
	/* Written by Nevon */
	$.timepicker.regional['sv-SE'] = {
		timeOnlyTitle: 'Välj en tid',
		timeText: 'Timme',
		hourText: 'Timmar',
		minuteText: 'Minuter',
		secondText: 'Sekunder',
		millisecText: 'Millisekunder',
		timezoneText: 'Tidszon',
		currentText: 'Nu',
		closeText: 'Stäng',
		timeFormat: 'HH:mm',
		amNames: ['AM', 'A'],
		pmNames: ['PM', 'P'],
		isRTL: false
	};
	$.timepicker.setDefaults($.timepicker.regional['sv-SE']);
});