package com.iiht.evaluation.eloan.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.iiht.evaluation.eloan.dto.LoanDto;
import com.iiht.evaluation.eloan.exception.ELoanException;
import com.iiht.evaluation.eloan.model.ApprovedLoan;
import com.iiht.evaluation.eloan.model.LoanInfo;
import com.iiht.evaluation.eloan.model.User;

public class ConnectionDao {
	private static final long serialVersionUID = 1L;
	private String jdbcURL;
	private String jdbcUsername;
	private String jdbcPassword;
	private Connection jdbcConnection;

	public ConnectionDao(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		this.jdbcURL = jdbcURL;
		this.jdbcUsername = jdbcUsername;
		this.jdbcPassword = jdbcPassword;
	}

	public Connection connect() throws SQLException {
		if (jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}
			jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}
		return jdbcConnection;
	}

	public void disconnect() throws SQLException {
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}

	// put the relevant DAO methods here..

	public int createUser(User user) throws SQLException {
		Connection connection = connect();
		String sqlCommand = "INSERT INTO User values(?, ?)";
		PreparedStatement pst = connection.prepareStatement(sqlCommand);
		pst.setString(1, user.getUsername());
		pst.setString(2, user.getPassword());
		int result = pst.executeUpdate();
		return result;
	}

	public String validateAUserWhileLogin(User user) throws SQLException {
		String pageToBeDisplayed = null;
		Connection connection = connect();
		try {
			String sqlCommand = "SELECT *FROM User WHERE User_ID=? and Password=?";
			PreparedStatement pst = connection.prepareStatement(sqlCommand);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				if (user.getUsername().equals("admin")) {
					pageToBeDisplayed = "adminhome1.jsp";
				} else {
					pageToBeDisplayed = "userhome1.jsp";
				}
			} else {
				pageToBeDisplayed = "index.jsp";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pageToBeDisplayed;
	}

	public int registerALoan(LoanInfo loaninfo) throws SQLException {
		Connection connection = connect();
		String sqlCommand = "INSERT INTO LOANINFO( );";
		PreparedStatement pst = connection.prepareStatement(sqlCommand);
		pst.setString(1, loaninfo.getApplno());
		pst.setString(2, loaninfo.getPurpose());
		pst.setInt(3, loaninfo.getAmtrequest());
		pst.setString(4, loaninfo.getDoa());
		pst.setString(5, loaninfo.getBstructure());
		pst.setString(6, loaninfo.getBindicator());
		pst.setString(7, loaninfo.getAddress());
		pst.setString(8, loaninfo.getEmail());
		pst.setString(9, loaninfo.getMobile());
		int result = pst.executeUpdate();
		return result;
	}

	public List<LoanInfo> displayAllLoanDetails() throws SQLException {
		List<LoanInfo> loansList = new ArrayList<LoanInfo>();
		String sqlCommand = "SELECT *FROM Loan;";
		Connection connection = connect();
		Statement st = connection.createStatement();
		ResultSet rs = st.executeQuery(sqlCommand);
		while (rs.next()) {
			String applno = rs.getString(1);
			String purpose = rs.getString(3);
			int amtrequest = rs.getInt(4);
			String doa = rs.getString(5);
			String bstructure = rs.getString(6);
			String bindicator = rs.getString(7);
			String address = rs.getString(9);
			String email = rs.getString(10);
			String mobile = rs.getString(11);
			String status = rs.getString(12);
			LoanInfo loanInfo = new LoanInfo(applno, purpose, amtrequest, doa, bstructure, bindicator, address, email,
					mobile, status);
			loansList.add(loanInfo);
		}
		return loansList;
	}

	public LoanDto calculateEmi(ApprovedLoan approvedLoan) throws SQLException {
		int interest_Rate =8;
		Connection connection = connect();
		String sqlCommand = "SELECT Loan_Requested_Amount FROM Loan WHERE Application_ID=?;";
		PreparedStatement pst = connection.prepareStatement(sqlCommand);
		pst.setInt(1, Integer.parseInt(approvedLoan.getApplno()));
		ResultSet rs = pst.executeQuery();
		rs.next();
		int sanctioned_Loan_Amount= rs.getInt(1);
		int loan_Term= approvedLoan.getLoanterm();
		int term_Payment_Amount = (sanctioned_Loan_Amount) * (1 + interest_Rate/100) ^ (loan_Term);
		int emi =  term_Payment_Amount/loan_Term;
		approvedLoan.setEmi(emi);
		approvedLoan.setAmotsanctioned(rs.getInt(1));
		LoanDto loanDto = new LoanDto(approvedLoan.getApplno(), approvedLoan.getAmotsanctioned(), emi);
		return loanDto;
	}
	
	public List<ApprovedLoan> updateEMIDetailsInDB(ApprovedLoan aLoan) throws SQLException {
		List<ApprovedLoan> approvedLoansList = new ArrayList<ApprovedLoan>();
		Connection connection = connect();
		String sqlCommand = "INSERT INTO ApprovedLoans values(?, ?, ?, ?, ?, ?)";
		PreparedStatement pst = connection.prepareStatement(sqlCommand);
		pst.setString(1, aLoan.getApplno());
		pst.setInt(2, aLoan.getAmotsanctioned());
		pst.setInt(3, aLoan.getLoanterm());
		pst.setString(4, aLoan.getPsd());
		pst.setString(5, aLoan.getLcd());
		pst.setInt(6, aLoan.getEmi());
		pst.executeUpdate();
		String sqlCommandForDisplay = "SELECT DISTINCT *FROM ApprovedLoans WHERE Application_ID='"+aLoan.getApplno()+"';";
		Statement st = connection.createStatement();
		ResultSet rs = st.executeQuery(sqlCommandForDisplay);
		while(rs.next()) {
			String applno = rs.getString(1);
			int amountsanctioned = rs.getInt(2);
			int loanterm = rs.getInt(3);
			String psd = rs.getString(4);
			String lcd = rs.getString(5);
			int emi = rs.getInt(6);
			ApprovedLoan approvedLoan = new ApprovedLoan(applno, amountsanctioned, loanterm, psd, lcd, emi);
			approvedLoansList.add(approvedLoan);
		}
		return approvedLoansList;
	}

	public void updateLoanStatus(Integer appNo, String status) throws SQLException {
		Connection connection = connect();
		String sqlCommand = "UPDATE Loan SET Status=? WHERE Application_ID=?;";
		PreparedStatement pst = connection.prepareStatement(sqlCommand);
		pst.setString(1, status);
		pst.setInt(2, appNo);
		pst.executeUpdate();
	}

	public String trackLoanStatus(String applID) throws SQLException {
		Connection connection = connect();
		String sqlCommand = "SELECT status FROM Loan WHERE applno='" + applID + "';";
		Statement st = connection.createStatement();
		ResultSet rs = st.executeQuery(sqlCommand);
		String status = rs.getString(12);
		return status;
	}

	public String editLoanDetails(String applID) throws SQLException {
		return applID;

	}

}