<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Process</title>
</head>
<body style="background-color: powderblue;">
	<!-- write the code to read application number, and send it to admincontrollers
	     callemi method to calculate the emi and other details also provide links
	     to logout and admin home page
	-->
	<jsp:include page="header.jsp" />
	<div align="right">
		<a href="index.jsp">Logout</a>
	</div>
	<h4>Process Application</h4>
	<hr />
	<form action="admin?action=callemi" id="processForm" name="processForm"
		method="post">
		<div>
			<label for="applicationNumber" name="applicationNumber">Application Number</label> <input
				type="text" id="applicationNumber" name="applicationNumber"
				placeholder="Enter the Application Number" required>
		</div>
		<br>
		<div>
			<button type="submit" value="submit">Submit</button>
		</div>

	</form>
	<hr />
	<jsp:include page="footer.jsp" />

</body>
</html>