$(document).ready(function () {
	$('#alertSuccess').hide();
	$('#alertError').hide();
});

$('#submitBtn').on('click', function(event) {

	$('#alertSuccess').text("");
	$('#alertSuccess').hide();
	$('#alertError').text("");
	$('#alertError').hide();
	
	var status = validateItemForm();
	
	if (status != true) {
		$('#alertError').text(text);
		$('#alertError').show();
		return;
	} else {
		
	}
	
});