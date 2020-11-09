<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>eLoan system</title>
</head>
<body style="background-color: powderblue;">
	<!-- write the html code to read user credentials and send it to validateservlet
	    to validate and user servlet's registernewuser method if create new user
	    account is selected
	-->

	<jsp:include page="header.jsp" />
	<hr />

	<div align="center">
		<h3>Log In</h3>
		<form action="user?action=validate" id="loginform" name="loginform" autocomplete="off" method="post">
			<div>
				<strong><label for="loginid">Login ID</label></strong> <input type="text"
					id="loginid" name="loginid" placeholder="Enter your Login ID"
					maxlength="20" required>
			</div>
			<br>
			<div>
				<strong><label for="password">Password</label></strong><input type="password"
					id="password" name="password" placeholder="Enter your Password" required>
			</div>
			<br>
			<div>
				<button type="submit" value="Log In">Log In</button>
			</div>
			<br> <span>New User? <a href="register.jsp">Register
					here</a>
			</span>
		</form>
	</div>

	<hr />
	<jsp:include page="footer.jsp" />
</body>
</html>