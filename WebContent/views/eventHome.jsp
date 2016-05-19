<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<fmt:setBundle basename="language.property.event"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Eventz</title>
</head>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/theme.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.dataTables.css" />

<script src="${pageContext.request.contextPath}/resources/scripts/home.js" type="text/javascript">
<!--home-->
</script>
<script src="${pageContext.request.contextPath}/resources/scripts/menu.js" type="text/javascript">
<!--menu-->
</script>
<script src="${pageContext.request.contextPath}/resources/scripts/register.js" type="text/javascript">
<!--register-->
</script>
<script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.1.js" type="text/javascript">
<!--jquery-->
</script>
<script src="${pageContext.request.contextPath}/resources/scripts/jqueryui.dialog.min.js" type="text/javascript">
<!--jquery-modal dialog-->
</script>
<script
	src="${pageContext.request.contextPath}/resources/scripts/slider/jssor.js"
	type="text/javascript"></script>
	<script
	src="${pageContext.request.contextPath}/resources/scripts/slider/jssor.slider.js"
	type="text/javascript"></script>
<body>

<%-- <div class="headerImage">
 	<img style="opacity: 0.9;" height="300px" width="100%" alt="header_image" src="${pageContext.request.contextPath}/resources/images/eventBG2.png" />
 	<!-- <h2 align="center">Ready..!</h2> -->	
 </div> --%>
<!-- slider in home page. --> 
 <jsp:include page="nested-slider.source.jsp"></jsp:include>
 
  
<div id="eventWrapper">
<!-- keep all body content -->
</div>
<div id="contactUsDetails" style="display:none;"><dl style="color:#CECEF6;"><fmt:message key="contact_us"></fmt:message></dl></div>
</body>
<script>
/* $(document).ready(function(){
	  $('.bxslider').bxSlider();
	}); */
</script>
</html>