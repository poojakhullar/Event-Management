<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css" />
<script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.1.js" type="text/javascript">
<!--jquery-->
</script>
<script src="${pageContext.request.contextPath}/resources/scripts/jqueryui.dialog.min.js" type="text/javascript">
<!--jquery-modal dialog-->
</script>

<body>

<table border="0" cellspacing="0" cellpadding="0" width="100%" >		<tr>
			<td valign="top" height="90%" width="100%" class="tiptext"><tiles:insertAttribute
					name="body" /></td>
		</tr>		
	</table>

</body>
</html>