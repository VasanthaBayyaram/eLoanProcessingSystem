<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User Landing Page</title>
</head>
<body style="background-color: powderblue;">
	<!-- read user name and password from user to create account
	     and send to usercontrollers registeruser method
	-->
	<jsp:include page="header.jsp" />
	<div align="right">
		<a href="index.jsp">Logout</a>
	</div>
	<h4>Welcome to eLoan Processing System!!</h4>
  	<hr/>
  	<hr/>
  		<jsp:include page="footer.jsp" />
  	
</body>
</html>