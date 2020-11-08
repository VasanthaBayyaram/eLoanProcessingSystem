<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loan Application Form</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body onload="myFunction()" style="background-color: powderblue;">

	<!--
	write the html code to accept laon info from user and send to placeloan servlet
-->
	<jsp:include page="header.jsp" />
	<div align="right">
		<a href="index.jsp">Logout</a>
	</div>
	<h4>Loan Application Form</h4>
	<hr />

	<div>
		<label>Date :&nbsp;</label>
		<%!LocalDate date = LocalDate.now();%>
		<span><strong><%=date%></strong></span>
	</div>
	<br>
	<div>
		<label for="loanName">Loan Name</label>
		<textarea rows="2" cols="30" name="loanName" required></textarea>
	</div>
	<br>
	<hr />
	<jsp:include page="footer.jsp" />

</body>
</html>