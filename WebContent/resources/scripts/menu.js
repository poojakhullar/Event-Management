/*on click of home menu*/
$('body').on('click', '#eventHome', function(){
	$(".modalbackground,.loader").show();
	location.reload(true);
	$(".modalbackground,.loader").hide();
});

/*on click of register menu*/
$('body').on('click', '#displayRegister', function(){
	
	$(".modalbackground,.loader").show();
	var url = 'displayRegistration';	
	var callback = function(response){
		$('#eventWrapper').html(response);
	};
	
	$.get(url,callback, 'html').always(function() {
			$(".modalbackground,.loader").hide();		
		 });
});

/*on click of events menu*/
$('body').on('click', '#events', function(){
	$(".modalbackground,.loader").show();
	var url = 'displayEvents';
	var callback = function(response){
		$('#eventWrapper').html(response);
	};
	$.get(url,callback, 'html').always(function() {
		$(".modalbackground,.loader").hide();		
	 });
	
});

/*on click of login menu*/
var loginDialog;
$('body').on('click', '#userLogin', function(){
			
	$(".modalbackground,.loader").show();
		
	var url = 'displayLogin';
	var callback = function(response){
	
		loginDialog = $("#dialog-userLogin").dialog({
			width:'40%',
			modal:true,
			draggable:false,
	        autoOpen: false,
	        close : function(event, ui) {
	        	loginDialog.dialog('destroy');
			}
	    }).html(response);

		loginDialog.dialog('open');		
	
		};
		
	$.get(url,callback, 'html').always(function() {
		$(".modalbackground,.loader").hide();		
	 });
});

$('body').on('click', '#loginClose', function(){
	loginDialog.dialog('destroy');
});


/*Login */
$('body').on('click', '#loginSubmit', function(){
			
	$(".modalbackground,.loader").show();
		
	var url = 'processLogin';
	var data = $('#loginForm').serialize();
	var callback = function(response){
		
		if($(response).find('#loginWrapper span').hasClass('error')==true){
			$('#loginWrapper').html(response);
			$("#userId").focus();
		}		
		else{			
			loginDialog.dialog('destroy');
			$('.manageEventsMenu').show();
			$('#usrLog').html('<a href="#"><span id="userLogOut">Log Out</span></a>');
			$('#eventWrapper').html(response);			
		}
		
		};
		
	$.post(url,data,callback, 'html').always(function() {
		$(".modalbackground,.loader").hide();		
	 });
});

/*LogOut */
$('body').on('click', '#userLogOut', function(){
			
	$(".modalbackground,.loader").show();		
	var url = 'processLogout';	
	var callback = function(response){	
		$('.manageEventsMenu').hide();
		$('#usrLog').html('<a href="#"><span id="userLogin">Login</span></a>');
		location.reload();		
		};
		
	$.get(url,callback, 'html').always(function() {
		$(".modalbackground,.loader").hide();		
	 });
});

/*event management*/
$('body').on('click', '#manageEvents', function(){
	
	$(".modalbackground,.loader").show();		
	var url = 'manageEvents';
	
	var callback = function(response){		
		$('#eventWrapper').html(response);
		};
		
	$.get(url,callback, 'html').always(function() {
		$(".modalbackground,.loader").hide();		
	 });
});



/*about us*/
$('body').on('click', '#aboutUs',function(){
	$('#eventWrapper').html("<span>ABOUT US</span>");
});
/*contact us*/
$('body').on('click', '#contactUs',function(){
	$('#eventWrapper').html( $('#contactUsDetails').html() );
});


/*******EVENT MANAGEMENT*************/
/*event details*/
$('body').on('click', '#displayEventDetails', function(){
	
	$(".modalbackground,.loader").show();		
	var url = 'manageEvents';
	
	var callback = function(response){		
		$('#eventWrapper').html(response);
		};
		
	$.get(url,callback, 'html').always(function() {
		$(".modalbackground,.loader").hide();		
	 });
});

/*participant details*/
$('body').on('click', '#displayParticipantDetails', function(){
	
	$(".modalbackground,.loader").show();		
	var url = 'fetchParticipants';
	
	var callback = function(response){		
		$('#eventWrapper').html(response);
		};
		
	$.get(url,callback, 'html').always(function() {
		$(".modalbackground,.loader").hide();		
	 });
});


/*create event*/
var eventDialog;
$('body').on('click', '#displayCreateEvent', function(){
			
	$(".modalbackground,.loader").show();
		
	var url = 'displayCreateEvent';
	var callback = function(response){
	
		eventDialog = $("#dialog-createEvent").dialog({
			width:'50%',			
			modal:true,
			draggable:false,
	        autoOpen: false,
	        close : function(event, ui) {
	        	eventDialog.dialog('destroy');
			}
	    }).html(response);

		eventDialog.dialog('open');		
	
		};
		
	$.get(url,callback, 'html').always(function() {
		$(".modalbackground,.loader").hide();		
	 });
});

$('body').on('click', '#eventClose', function(){
	eventDialog.dialog('destroy');
});


/*Submit new event */
$('body').on('click', '#eventSubmit', function(){
	
	
	/*if($("#start_time").val() !)*/
			
	$(".modalbackground,.loader").show();
		
	var url = 'processCreateEvent';
	var data = $('#createEventForm').serialize();
	var callback = function(response){
		
		if($(response).find('#eventCreationWrapper span').hasClass('error')==true){
			$('#eventCreationWrapper').html(response);
		}		
		else{			
			eventDialog.dialog('destroy');
			$('#eventWrapper').html(response);			
		}		
		};		
	$.post(url,data,callback, 'html').always(function() {
		$(".modalbackground,.loader").hide();		
	 });
});


