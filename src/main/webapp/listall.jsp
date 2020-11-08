<%@page import="com.iiht.evaluation.eloan.model.LoanInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display All Loans</title>
</head>
<body style="background-color: powderblue;">
	<!-- write code to display all the loan details 
             which are received from the admin controllers' listall method
	-->
	<jsp:include page="header.jsp" />
	<div align="right">
		<a href="index.jsp">Logout</a>
	</div>
	<h4>Loans List</h4>
	<hr />
		<form action="user?action=registernewuser">
	<c:choose>
		<c:when test="${loansList==null || loansList.isEmpty() }">
			<p>No Records Found!!</p>
		</c:when>
		<c:otherwise>
			<table border="1" cellpadding="5" style="text-align: center"
				style="width:100%">
				<thead>
					<tr>
						<th>Loan Application Number</th>
						<th>Purpose</th>
						<th>Requested Amount</th>
						<th>Date of Application</th>
						<th>Business Structure</th>
						<th>Billing Indicator</th>
						<th>Contact Address</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="loan" items="${loansList}">
						<tr>
							<td>${loan.applno }</td>
							<td>${loan.purpose }</td>
							<td>${loan.amtrequest }</td>
							<td>${loan.doa }</td>
							<td>${loan.bstructure }</td>
							<td>${loan.bindicator }</td>
							<td>${loan.address }</td>
							<td>${loan.email }</td>
							<td>${loan.mobile }</td>
							<td>${loan.status }</td>
							<td><select name="appStatus" id="appStatus">
									<option value="Approved">Approved</option>
									<option value="Declined">Declined</option>
							</select></td>
							 <td><a href="admin?action=updatestatus&applno=${loan.applno}">Update</a></td>
	
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
	</form>
	<hr />
	<jsp:include page="footer.jsp" />

</body>
</html>