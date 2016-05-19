<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<fmt:setBundle basename="language.property.event"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
<body>
<h2 align="center" class="Wcolor"><fmt:message key="register.title"></fmt:message> </h2>

<form:form commandName="register" action="processRegistration" method="post" id="registerForm">

<table width="100%">
<tr>
				<td width="65%">
					<!-- registration form -->
					<table cellspacing="15">
						<c:if test="${not empty error}">
							<tr>
								<td colspan="2"><span class="error"> <c:out
											value="${error}"></c:out>
								</span></td>
							</tr>
						</c:if>
						<c:if test="${not empty msg}">
							<tr>
								<td colspan="2"><span class="msg"> <c:out
											value="${msg}"></c:out>
								</span></td>
							</tr>
						</c:if>
						<tr>
							<td><label>User Id:</label></td>
							<td><form:input path="userId" /></td>
							<td><form:errors path="userId" cssClass="error"></form:errors></td>
						</tr>
						<tr>
							<td><label>First Name:</label></td>
							<td><form:input path="firstName" /></td>
							<td><form:errors path="firstName" cssClass="error"></form:errors></td>
						</tr>
						<tr>
							<td><label>Last Name:</label></td>
							<td><form:input path="lastName" /></td>
							<td><form:errors path="lastName" cssClass="error"></form:errors></td>
						</tr>
						<tr>
							<td><label>Event Name:</label></td>
							<td><form:select id="eventChange"
									path="eventId">
									<option value="">Select One</option>
									<c:forEach items="${eventList}" var="event">
										<option value="${event.eventId}">${event.eventName}</option>
									</c:forEach>
								</form:select></td>
							<td><form:errors path="eventId" cssClass="error"></form:errors>
							</td>
						</tr>
						<tr>
							<td><label>Email:</label></td>
							<td><form:input path="email" /></td>
							<td><form:errors path="email" cssClass="error"></form:errors>
							</td>
						</tr>
						<tr>
							<td><label>Phone:</label></td>
							<td><form:input path="phone" maxlength="10" /></td>
							<td><form:errors path="phone" cssClass="error"></form:errors>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2"><span class="button" id="registerButton"><a
									href="#" class="eventButton" id="submitRegister">Register</a></span>
							</td>
						</tr>
					</table>
				</td>
				<td>
<!-- event info details -->
<table >
<tr><td>
<div id="eventInfo">
<!-- on event change -->
</div>
<h3 style="color: #DF0101;display:none;" id="regClosed">Registration Closed</h3>
</td></tr>
</table>
</td>

</tr></table>
</form:form>


</body>
</html>