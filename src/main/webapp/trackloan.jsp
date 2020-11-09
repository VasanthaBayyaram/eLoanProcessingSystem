<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Track Loan Application</title>
</head>
<body style="background-color: powderblue;">
	<!-- write html code to read the application number and send to usercontrollers'
             displaystatus method for displaying the information
	-->
	<jsp:include page="header.jsp" />
	<div align="right">
		<a href="index.jsp">Logout</a>
	</div>
		<hr />
	<h4>Track Loan Application</h4>
		<form action="user?action=displaystatus" id="trackLoanApp" name="trackLoanApp"
		method="post">
		<div>
			<label for="applicationNumber">Application Number</label> <input
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