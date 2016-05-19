<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welcome</title>
<script
	src="${pageContext.request.contextPath}/resources/scripts/Datatables/jquery.dataTables.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/scripts/eventmanagement.js"
	type="text/javascript"></script>
</head>
<body>
	<div id="dialog-createEvent" title="Create Event" style="display: none">
	</div>
	<span class="error"> <c:if test="${not empty error}">
	<c:out value="${error}"></c:out>
	</c:if>
	</span>
	<label>Welcome, <c:out
			value="${sessionScope.userSession.firstName}"></c:out></label>
	<p>
		<a href="#" class="eventButton" id="displayCreateEvent">Create
			Event</a> <a href="#" class="eventButton" id="displayEventDetails">Event
			Details</a> <a href="#" class="eventButton"
			id="displayParticipantDetails">Participant Details</a>
	</p>
	<!-- event list -->
	<c:if test="${not empty eventList}">
		<table width="100%" id="eventDetails" border="1" bordercolor="#CCCCCC"
			cellspacing="0" cellpadding="0" >
			<thead class="dbTablesHeader">
				<tr>
					<th>Event Id <div class="dropdownEnable"></div></th>
					<th>Event Type <div class="dropdownEnable"></div></th>
					<th>Event Name<div class="dropdownEnable"></div></th>
					<th>Start Time<div class="dropdownEnable"></div></th>
					<th>End Time<div class="dropdownEnable"></div></th>
					<th>Host<div class="dropdownEnable"></div></th>
					<th>Allowed Participants<div class="dropdownEnable"></div></th>
				</tr>
			</thead>
			<tbody  class="dbTablesBody" >
				<c:forEach items="${eventList}" var="event">
					<tr>
						<td>${event.eventId}</td>
						<td>${event.eventType}</td>
						<td>${event.eventName}</td>
						<td>${event.eventStartDate}</td>
						<td>${event.eventEndDate}</td>
						<td>${event.host}</td>
						<td>${event.noOfParticipants}</td>						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<!-- end of event list -->
	<!-- participant list -->
	<c:if test="${not empty participantList}">
		<table width="100%" id="participationList"  border="1" bordercolor="#CCCCCC"
			cellspacing="0" cellpadding="0" >
			<thead class="dbTablesHeader">
				<tr>
					<th>User Id<div class="dropdownEnable"></div></th>
					<th>First Name<div class="dropdownEnable"></div></th>
					<th>Last Name<div class="dropdownEnable"></div></th>
					<th>Event Type<div class="dropdownEnable"></div></th>
					<th>Event Name<div class="dropdownEnable"></div></th>
					<th>Mail Id<div class="dropdownEnable"></div></th>
					<th>Contact No.<div class="dropdownEnable"></div></th>
				</tr>
			</thead>
			<tbody  class="dbTablesBody" >
				<c:forEach items="${participantList}" var="participant">
					<tr>
						<td>${participant.userId}</td>
						<td>${participant.firstName}</td>
						<td>${participant.lastName}</td>
						<td>${participant.eventType}</td>
						<td>${participant.eventName}</td>
						<td>${participant.email}</td>
						<td>${participant.phone}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<!-- end of participant list -->
</body>
</html>