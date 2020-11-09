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
	<form action="user?action=placeloan" name="loanApplication"
		method="post">
		<div>
			<div>
				<label for="loanName"><strong>Loan Name</strong></label>
				<textarea rows="1" cols="30" name="loanName"
					placeholder="Enter Loan Name" required></textarea>
			</div>
			<br>
			<div>
				<label for="purpose"><strong>Purpose</strong></label>
				<textarea rows="1" cols="30" name="purpose"
					placeholder="Enter purpose" required></textarea>
			</div>
			<br>
			<div>
				<label for="loanAmountRequested"><strong>Loan
						Amount</strong></label> <input type="number" step="any"
					id="loanAmountRequested" name="loanAmountRequested" placeholder="Enter Loan Amount in INR" required>
			</div>
		</div>
		<br>
		<div>
			<div>
				<label for="loanApplicationDate"><strong>Loan
						Application Date</strong></label> <input type="date" id="loanApplicationDate"
					name="loanApplicationDate" readonly value=<%=LocalDate.now()%>>
			</div>
		</div>
		<br>
		<div>
			<div>
				<label for="businessStructure"><strong>Select
						Business Structure</strong></label>
			</div>
			<input type="radio" id="individual" name="businessStructure"
				value="individual" required> <label for="individual">Individual</label>
			<input type="radio" id="organization" name="businessStructure"
				value="organisation"> <label for="organization">Organization</label>
		</div>
		<br>
		<div>
			<div>
				<label for="billingIndicator"><strong>Select
						Billing Indicator</strong></label>
			</div>
			<input type="radio" id="salariedPerson" name="billingIndicator"
				value="salaried" required> <label for="salariedPerson">Salaried</label>
			<input type="radio" id="nonSalariedPerson" name="billingIndicator"
				value="non-salaried"> <label for="nonSalariedPerson">Non-Salaried</label>
		</div>
		<br>
		<div>
			<div>
				<label for="taxIndicator"><strong>Select Tax
						Indicator</strong></label>
			</div>
			<input type="radio" id="taxPayer" name="taxIndicator"
				value="taxpayer" required> <label for="taxPayer">Yes</label>
			<input type="radio" id="nontaxPayer" name="taxIndicator"
				value="nontaxpayer"> <label for="nontaxPayer">No</label>
		</div>
		<br>
			<div>
				<label for="address"><strong>Address</strong></label>
				<textarea rows="4" cols="30" name="address"
					placeholder="Enter Address" required></textarea>
			</div>
			<br>
			<div>
				<label for="email"><strong>Email ID</strong></label> <input
					type="email" id="email"
					pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}" name="email"
					placeholder="Enter Email ID" size="30" title="xxxxxxx@xxx.xxx"
					required>
			</div>
			<br>			
			<div>
				<label for="PhoneNumber"><strong>Phone Number</strong></label> <input
					type="tel" name="PhoneNumber" placeholder="123-456-7890"
					pattern="[6-9]{1}[0-9]{9}" maxlength="10"
					title="Phone number should start with 6-9 and remaing 9 digits within 0-9 range"
					required>
			</div>
			<br> <br>
			<div>
				<div>
					<button type="submit" value="Apply Loan">Apply Loan</button>
				</div>
			</div>
	</form>
	<hr />
	<jsp:include page="footer.jsp" />

</body>
</html>