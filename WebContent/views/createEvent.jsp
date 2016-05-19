<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>create event</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.datetimepicker.css" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/scripts/jquery.datetimepicker.js" type="text/javascript">
<!--jquery date time picker-->
</script>
<script src="${pageContext.request.contextPath}/resources/scripts/datepicker.js" type="text/javascript">
<!--datepicker-->
</script>
<body>
<div id="eventCreationWrapper">
<form:form action="" method="post" id="createEventForm" name="createEventForm" commandName="event">
<table cellspacing="2" cellpadding="5">
<tr><td colspan="2"> <c:if test="${not empty error}"> <span class="error"> <c:out value="${error}"></c:out> </span> </c:if></td></tr>
<tr>
<td><label>Event Name:</label></td><td> <form:input type="text" path="eventName"/></td>
</tr>
<tr>
<td><label>Event Type:</label></td><td> <form:input type="text" path="eventType"/></td></tr>
<tr>
<td><label>Event Start Date:</label></td><td> <form:input class="eventDatepicker" id="start_time" type="text" path="eventStartDate"/></td></tr>
<tr>
<td><label>Event End Date:</label></td><td> <form:input class="eventDatepicker" id="end_time" type="text" path="eventEndDate"/></td></tr>
<tr>
<td><label>No. of Participants:</label></td><td> <form:input type="text" path="noOfParticipants" maxlength="10" value="" /></td></tr>
<tr>
<td><label>Host:</label></td><td> <form:input type="text" path="host"/></td></tr>
<tr align="center">
<td colspan="2">
<a href="#" class="eventButton" id="eventSubmit">Create</a>
<a href="#" class="eventButton" id="eventClose">Close</a> 
 </td>
</tr>
</table>
</form:form></div>

</body>
</html>