<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<script src="${pageContext.request.contextPath}/resources/scripts/jqueryui.dialog.min.js" type="text/javascript">
<!--jquery-modal dialog-->
</script>
<body>
<div id="loginWrapper">
<form action="" method="post" id="loginForm" name="loginForm">
<table cellpadding="10">
<tr><td colspan="2"> <c:if test="${not empty error}"> <span class="error"> <c:out value="${error}"></c:out> </span> </c:if></td></tr>
<tr>
<td>
<label>UserName:</label></td><td> <input type="text" name="userId" id="userId" /></td>
</tr>
<tr>
<td><label>Password:</label></td><td> <input type="password" name="password"/></td></tr>
<tr align="center">
<td colspan="2">
<a href="#" class="eventButton" id="loginSubmit">Login</a>
<a href="#" class="eventButton" id="loginClose">Close</a> 
 </td>
</tr>
</table>
</form></div>
</body>
</html>