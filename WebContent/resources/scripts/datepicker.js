/*$(function() {
$( ".eventDatepicker" ).datepicker({buttonImage: 'resources/images/b-calendar.gif',
       buttonImageOnly: true,                
       changeMonth: true,
       changeYear: true,
       showOtherMonths: true,
       selectOtherMonths: true,
       showOn: 'button'});
   //to prevent manual entry 
$(".eventDatepicker").keypress(function(event) {event.preventDefault();});
 });*/



/*$(function(){
// -- Example Only - Set the date range --
var d = new Date();
d.setDate(10);
$('#start_time').val(d.getFullYear() + '-' + d.getMonth() + '-' + d.getDate() + " 1:00 pm");

// Example Only - Set the end date to 7 days in the future so we have an actual 
d.setDate(d.getDate() + 7);

$('#end_time').val(d.getFullYear() + '-' + d.getMonth() + '-' + d.getDate() + " 13:45 ");
// -- End Example Only Code --

// Attach a change event to end_time - 
// NOTE we are using '#ID' instead of '*[name=]' selectors in this example to ensure we have the correct field

$('#end_time').change(function() {
   $('#start_time').appendDtpicker({
   maxDate: $('#end_time').val() // when the end time changes, update the maxDate on the start field
   });
});

$('#start_time').change(function() {
   $('#end_time').appendDtpicker({
   minDate: $('#start_time').val() // when the start time changes, update the minDate on the end field
   });
});

// trigger change event so datapickers get attached
$('#end_time').trigger('change');
$('#start_time').trigger('change');
});
*/

$(function() {
	
	//to prevent manual entry 
	$("#start_time").keypress(function(event) {event.preventDefault();});
	$("#end_time").keypress(function(event) {event.preventDefault();});
	

	if($('#start_time').val() == ""){
		$('#end_time').attr('disabled','disabled');
	}

$('#start_time').change(function() {


$('#end_time').removeAttr('disabled');
// alert("Start time is::"+$('#start_time').val());

$('#end_time').datetimepicker({
step:30, // to keep the time difference by 30 min
minDate : $('#start_time').val(), //to keep the Minimum date default -Today
startDate :$('#start_time').val(), 

theme:'dark'
});

if($('#start_time').val() == ""){
$('#end_time').val("");
$('#end_time').attr('disabled','disabled');
}

});

$('#start_time ').datetimepicker({
step:30, // to keep the time difference by 30 min
minDate : $('#start_time').val(), //to keep the Minimum date default -Today
// format: "dd MM yyyy - hh:ii",
// todayHighlight: true,
// maxDate : $('#end_time').val(),
// futureOnly: true,
theme:'dark'
});



});
