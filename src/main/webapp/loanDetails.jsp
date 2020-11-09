<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<br>

	<h3>Loan Details</h3>
	<div>
		<strong><label for="applicationNo">Loan Application
				No</label></strong> <input type="text" id="loanName" name="loanName"
			value="${loan.getApplno()}" readonly>
	</div>
	<br>
	<div>
		<strong><label for="loanName">Loan Name</label></strong> <input
			type="text" id="loanName" name="loanName"
			value="${loan.getLoanName()}" readonly>
	</div>
	<br>
	<div>
		<strong><label for="purpose">Purpose</label></strong> <input
			type="text" id="purpose" name="purpose" value="${loan.getPurpose()}"
			readonly>
	</div>
	<br>
	<div>
		<strong><label for="loanAmountRequested">Loan Amount
				(INR) </label></strong> <input type="number" step="any" id="loanAmountRequested"
			name="loanAmountRequested" value="${loan.getAmtrequest()}" readonly>
	</div>
	<br>
	<div>
		<strong><label for="loanApplicationDate">Application
				Date</label></strong> <input type="date" id="loanApplicationDate"
			name="loanApplicationDate" value="${loan.getDoa() }" readonly>
	</div>
	<br>
	<div>
		<strong><label for="businessStructure">Business
				Structure</label></strong> <input type="text" id="businessStructure"
			name="businessStructure" value="${loan.getBstructure() }" readonly>
	</div>
	<br>
	<div>
		<strong><label for="billingIndicator">Billing
				Indicator</label></strong> <input type="text" id="billingIndicator"
			name="billingIndicator" value="${loan.getBindicator() }" readonly>
	</div>
	<br>
	<div>
		<strong><label for="taxIndicator">Tax Indicator</label></strong> <input
			type="text" id="taxIndicator" name="taxIndicator"
			value="${loan.getTindicator()}" readonly>
	</div>
	<br>
	<div>
		<strong><label for="address">Address</label></strong> <input
			type="text" id="address" name="address" size="30"
			value="${loan.getAddress()}" readonly>
	</div>
	<br>
	<div>
		<strong><label for="phone">Phone no.</label></strong> <input
			type="number" id="phone" name="phone" value="${loan.getMobile()}"
			readonly>
	</div>
	<br>
	<div>
		<strong><label for="email">Email id</label></strong> <input
			type="email" id="email" size="30" name="email"
			value="${loan.getEmail()}" readonly>
	</div>
	<br>
	<hr />
	<hr />
	<jsp:include page="footer.jsp" />

</body>
</html>