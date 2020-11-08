<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body style="background-color: powderblue;">
	<jsp:include page="header.jsp" />
	<hr />
	<h2 align=center>Create a new account</h2>
	<div align=center>
		<form action="user?action=registernewuser" id="signUpForm"
			name="signUpForm" autocomplete="off" method="post">
			<div>
				<label for="loginId">Login ID</label> <input type="text"
					id="loginId" name="loginId" placeholder="Enter your Login ID"
					maxlength="20" required>
			</div>
			<br>
			<div>
				<label for="password">Password</label> <input type="password"
					id="password" name="password" placeholder="Enter your Password"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					title="Must contain at least 1 number, 1 uppercase, 1 lowercase letter and at least 8 or more characters"
					required />
			</div>
			<br>
			<div>
				<label for="confirmPassword">Confirm Password</label> <input
					type="password" id="confirmPassword" name="confirmPassword"
					placeholder="Re-enter your Password" oninput="validatePassWord();"
					required>
				<p id="message" style="Color: grey"></p>
				<script>
					function validatePassWord() {
						document.getElementById('signUp').disabled = false;
						if ((document.getElementById('password').value) != (document
								.getElementById('confirmPassword').value)) {
							document.getElementById("message").innerHTML = "Passwords doesn't match";
							document.getElementById('signUp').disabled = true;
						} else {
							document.getElementById("message").innerHTML = "Passwords match";
							document.getElementById('signUp').disabled = false;
						}
					}
				</script>
			</div>
			<br>
			<div>
				<button type="submit" id="signUp" value="Sign Up"
					style="background-color: lightGreen">Sign Up</button>
			</div>
			<br>
			<div>
				Existing User? <a href="index.jsp">Login here</a>
			</div>
		</form>
	</div>
	<hr />
	<jsp:include page="footer.jsp" />
</body>
</html>