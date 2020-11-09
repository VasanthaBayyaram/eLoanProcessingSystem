<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Loan Application</title>
</head>
<body style="background-color: powderblue;">
	<!-- read the application number to edit from user and send to 
	     user controller to edit info
	-->
		<jsp:include page="header.jsp" />
	<div align="right">
		<a href="index.jsp">Logout</a>
	</div>
		<h4>Edit Loan Application</h4>	
  	<hr/>
  	<form action="${pageContext.request.contextPath}/user?action=editLoanProcess" id="editLoanApp" name="editLoanApps"
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
  	
  	<hr/>
  		<jsp:include page="footer.jsp" />
  	
  	
</body>
</html>