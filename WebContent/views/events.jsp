<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Events</title>
<fmt:setBundle basename="language.property.event"/>
</head>
<script
	src="${pageContext.request.contextPath}/resources/scripts/Datatables/jquery.dataTables.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/scripts/eventmanagement.js"
	type="text/javascript"></script>
<body>
<h2 align="center" class="Wcolor"><fmt:message key="events.title"></fmt:message> </h2>
<span class="error"> <c:if test="${not empty error}">
<c:out value="${error}"></c:out>
</c:if></span>

<!-- event list -->
	
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
			<tbody  class="dbTablesBody">
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
	
	<!-- end of event list -->

</body>
</html>