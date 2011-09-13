$(document).ready(function() {
	$('.notification > .close').click(function(event) {
		event.preventDefault();
		$(this).parent().slideUp(400);
	});

	$('.listheader > .toggle').click(function(event) {
		event.preventDefault();
		if($(this).hasClass('up')) {
			$(this).removeClass('up');
			$(this).parent().next().show();
		} else {
			$(this).addClass('up');
			$(this).parent().next().hide();
		}
	});
});