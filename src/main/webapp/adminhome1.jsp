<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin home</title>
</head>
<body style="background-color: powderblue;">
	<jsp:include page="header.jsp" />
	<div align="right">
		<a href="index.jsp">Logout</a>
	</div>
		<h4>Admin Dash Board</h4>
	<hr />
	<div  align="center"><a href="admin?action=listall">List All</a></div>
	<br>
	<div  align="center"><a href="admin?action=process">Process Loan</a></div>
	<br>
	<hr />
	<jsp:include page="footer.jsp" />
</body>
</html>