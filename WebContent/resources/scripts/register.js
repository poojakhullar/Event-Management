$('body').on('click', '#submitRegister', function(){
	
	$(".modalbackground,.loader").show();
	var url = 'processRegistration';
	var data = $('#registerForm').serialize();
	var callback = function(response){			
		$('#eventWrapper').html(response);
		window.scrollTo(0,document.body.scrollHeight);		
	};
	
	$.post(url,data,callback, 'html').always(function() {
			$(".modalbackground,.loader").hide();		
		 });
});
/*on event drop down change*/
$('body').on('change', '#eventChange', function(){
	
	hideMessages();
	$(".modalbackground,.loader").show();
	var url = 'onEventChange';
	var data = $('#registerForm').serialize();
	var callback = function(data,response,r2){
		
		if(data.eventId!=null){
		var remainingTickets=data.noOfParticipants-data.ticketCount; 
		if(remainingTickets==0){
			$('#registerButton').html('<a href="#" class="eventButton disabled">Register</a>');
			$('#regClosed').show();
		}
		else{
			$('#registerButton').html('<a href="#" class="eventButton" id="submitRegister">Register</a>');
			$('#regClosed').hide();
		}
		$('#eventInfo').html("<p class='Wcolor'>EventType: "+data.eventType+
					"<br/><br/>Event Start Time: "+data.eventStartDate+
					"<br/><br/>Evetn End Time: "+data.eventEndDate+
					"<br/><br/>Host: "+data.host+
					"<br/><br/>Remaining Tickets: "+remainingTickets+
					"</p>");
		}
		else{
			$('#eventInfo').html('');
		}
	};
	
	$.post(url,data,callback, 'json').always(function() {
			$(".modalbackground,.loader").hide();		
		 });
});
function hideMessages(){
	$('.error').hide();
	$('.msg').hide();
	$('#regClosed').hide();
}
