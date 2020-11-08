<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loan Details</title>
</head>
<body style="background-color: powderblue;">
	<!-- write the code to display the loan status information 
	     received from usercontrollers' displaystatus method
	-->
	
		<jsp:include page="header.jsp" />
	<div align="right">
		<a href="index.jsp">Logout</a>
	</div>
	<h4>Loan Details</h4>
  	<hr/>
  	<hr/>
  		<jsp:include page="footer.jsp" />
  	
</body>
</html>