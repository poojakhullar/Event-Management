<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- background="${pageContext.request.contextPath}/resources/images/eventBG.png" --%>
<body>
<div id="dialog-userLogin" title="Login" style="display:none">	
</div>	
<div id="sse1">
  <div id="sses1">
    <ul>
      <li><a href="#"><span id="eventHome">Home</span></a></li>      
      <li><a href="#"><span id="events">Events</span></a></li>
      <li><a href="#"><span id="displayRegister">Register</span></a></li>
      <li><a href="#"><span id="aboutUs">About Us</span></a></li>
      <li><a href="#"><span id="contactUs">Contact Us</span></a></li>      
      
      <c:choose>
		<c:when test="${empty sessionScope.userSession}">
		<li class="manageEventsMenu" style="display: none;"><a href="#"><span id="manageEvents">Manage Events</span></a></li>
		<li><span id="usrLog">
			<a href="#"><span id="userLogin">Login</span></a>
		</span></li>
		</c:when>
		<c:otherwise>		
		<li class="manageEventsMenu" ><a href="#"><span id="manageEvents">Manage Events</span></a></li>
		<li><span id="usrLog">
			<a href="#"><span id="userLogOut">Log Out</span></a>
		</span></li>
		</c:otherwise>      
      </c:choose>      
    </ul>
  </div>
</div>

</body>
