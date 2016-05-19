<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.datetimepicker.css" type="text/css" />

<script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.1.js" type="text/javascript">
<!--jquery-->
</script>
<script>
$(document).ready(function(){
	var bodyHeight = $("body").height();
	  var vwptHeight = $(window).height();
	  if (vwptHeight >= bodyHeight) {
	    $("div#footer").css("position","fixed").css("bottom",0).css("right","40%");
	  }
});
</script>
<body bgcolor="black">
<!-- loader -->
<div class="modalbackground"><!-- Hi --></div>
	<div class="loader">
		<img
			src="${pageContext.request.contextPath}/resources/images/loader.gif"
			alt="loader" /> <label>Loading...</label> <br class="clearBoth" />
	</div>

<table align="center" border="0" cellspacing="0" cellpadding="0" width="80%" >
		<tr>
			<td colspan="2" valign="top" height="10%"><tiles:insertAttribute
					name="header" /></td>

		</tr>
		<tr>
			<td valign="top" height="90%" width="100%" class="tiptext"><tiles:insertAttribute
					name="body" /></td>
		</tr>		
	</table>
	<div id="footer" align="center">
		<span>copyright&#169; 2014. All Rights Reserved</span>
	</div>

</body>
<style type="text/css">
.modalbackground{position:fixed; opacity: 0.3;filter: alpha(opacity=30); background-color: #333; height:100%; width:100%; display:none; margin:0; padding:0; z-index: 10000;overflow: hidden;}
.loader{width:120px; height:50px; border-radius: 5px; background-color:#333; margin: 20% 0 0 45%;position:fixed; z-index:10001; display: none;}
.loader img{margin: 20px 0 0 10px; float:left}
.loader label{float:left; color: #FFF; margin: 20px 0 0 5px; font-family: verdana,arial, sans-serif; font-size:12px;}
.clearBoth{clear:both}
</style>
</html>