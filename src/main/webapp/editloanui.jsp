<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Loan UI</title>
</head>
<body style="background-color: powderblue;">
<jsp:include page="header.jsp"/>
<div align="right"><a href="index.jsp">Logout</a></div>
		<h4>Edit Loan Application UI</h4>
  	<hr/>
  	<h3>Edit Loan Details</h3>
	<form action="editLoanProcess" method="post" name="editor" onsubmit="return validateform()">
	<table>
	<tr><td>
	
	</table>
		<div>
			<div><strong><label for="applictionNo">Loan Application No</label></strong></div>
			<div><input type="text" id="applictionNo" name="applictionNo" value="${loan.getApplno()}" readonly > </div>
		</div>
		<br>
		<div>
			<div><strong><label for="loanName">Enter Loan Description</label></strong></div>
			<div><input type="text" id="loanName" name="loanName" value="${loan.getPurpose()}" required > </div>
		</div>
		<br>
		<div>
			<div><strong><label for="loanAmountRequested">Loan Amount Required(INR) </label></strong></div>
			<div><input type="number" step="any" id="loanAmountRequested" name="loanAmountRequested" value="${String.format('%.2f',loan.getAmtrequest()) }" required> </div>
		</div>
		<br>
		<div>
			<div><strong><label for="loanApplicationDate">Loan Application Date</label></strong></div>
			<div><label for="loanApplicationDate"> ${loan.getDoa() }</label> </div>
		</div>
		<br>
		<div>
			<div><strong><label for="businessStructure">Select Business Structure</label></strong></div>
			<input type="radio" id="individual" name="businessStructure" value="individual" <c:if test="${loan.getBstructure()=='individual'}">checked</c:if> required>
  			<label for="individual">Individual</label>
  			<input type="radio" id="organization" name="businessStructure" value="organisation" <c:if test="${loan.getBstructure()=='organisation'}">checked</c:if> >
  			<label for="organization">Organization</label>
		</div>
		<br>
		<div>
			<div><strong><label for="billingIndicator">Select Billing Indicator</label></strong></div>
			<input type="radio" id="salaried" name="billingIndicator" value="salaried" <c:if test="${loan.getBindicator()=='salaried'}">checked</c:if> required>
  			<label for="salaried">Salaried</label>
  			<input type="radio" id="non-salaried" name="billingIndicator" value="non-salaried" <c:if test="${loan.getBindicator()=='non-salaried'}">checked</c:if>>
  			<label for="nonSalaried">Non-Salaried</label>
		</div>
		<br>
		<div>
			<div><strong><label for="taxIndicator">Select Tax Indicator</label></strong></div>
			<input type="radio" id="taxPayer" name="taxIndicator" value="tax-payer" <c:if test="${loan.getTindicator()=='tax-payer'}">checked</c:if> required>
  			<label for="taxPayer">Tax-Payer</label>
  			<input type="radio" id="nontaxPayer" name="taxIndicator" value="non-tax-payer" <c:if test="${loan.getTindicator()=='non-tax-payer'}">checked</c:if>>
  			<label for="nontaxPayer">Non-Tax Payer</label>
		</div>
		<br>
		<div>
			<div><strong><label for="address">Enter Address</label></strong></div>
			<div><input type="text" id="address" name="address" value="${loan.getAddress()}" required></div>
		</div>
		<br>
		<div>
			<div><strong><label for="phone">Enter Phone no.</label></strong></div>
			<div><input type="number" id="phone" name="phone" value="${loan.getMobile()}" required></div>
		</div>
		<br>
		<div>
			<div><strong><label for="email">Enter Email id</label></strong></div>
			<div><input type="email" id="email" name="email" value="${loan.getEmail()}" required></div>
		</div>
		<br>
		<div>
			<div><input type="submit" value="Update"></div>
		</div>
	</form>
  	
  	  	<hr/>
  	
<jsp:include page="footer.jsp"/>
</body>
</html>