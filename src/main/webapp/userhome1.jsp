<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User home</title>
</head>
<body style="background-color: powderblue;">
	<!-- write the html code to display hyperlinks for user functionalities -->

	<jsp:include page="header.jsp" />
	<div align="right">
		<a href="index.jsp">Logout</a>
	</div>
	<h4>User Dash Board</h4>
	<hr />
	<div align="center">
		<a href="application.jsp">Apply for Loan</a>
	</div>
	<br>
	<div align="center">
		<a href="trackloan.jsp">Track Loan Application</a>
	</div>
	<br>
	<div align="center">
		<a href="editloan.jsp">Edit Loan Application</a>
	</div>
	<hr />
	<jsp:include page="footer.jsp" />
</body>
</html>