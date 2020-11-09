package com.iiht.evaluation.eloan.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iiht.evaluation.eloan.dao.ConnectionDao;
import com.iiht.evaluation.eloan.dto.LoanDto;
import com.iiht.evaluation.eloan.exception.ELoanException;
import com.iiht.evaluation.eloan.model.ApprovedLoan;
import com.iiht.evaluation.eloan.model.LoanInfo;
import com.iiht.evaluation.eloan.model.User;
import com.mysql.cj.xdevapi.Statement;

@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ConnectionDao connDao;

	public void setConnDao(ConnectionDao connDao) {
		this.connDao = connDao;
	}

	public void init(ServletConfig config) {
		String jdbcURL = config.getServletContext().getInitParameter("jdbcUrl");
		String jdbcUsername = config.getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = config.getServletContext().getInitParameter("jdbcPassword");
		System.out.println(jdbcURL + jdbcUsername + jdbcPassword);
		this.connDao = new ConnectionDao(jdbcURL, jdbcUsername, jdbcPassword);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		String viewName = "";
		try {
			switch (action) {
			case "registernewuser":
				viewName = registernewuser(request, response);
				break;
			case "validate":
				viewName = validate(request, response);
				break;
			case "placeloan":
				viewName = placeloan(request, response);
				break;
			case "application1":
				viewName = application1(request, response);
				break;
			case "editLoanProcess":
				viewName = editLoanProcess(request, response);
				break;
			case "registeruser":
				viewName = registerUser(request, response);
				break;
			case "register":
				viewName = register(request, response);
				break;
			case "application":
				viewName = application(request, response);
				break;
			case "trackloan":
				viewName = trackloan(request, response);
				break;
			case "editloan":
				viewName = editloan(request, response);
				break;
			case "displaystatus":
				viewName = displaystatus(request, response);
				break;
			default:
				viewName = "notfound.jsp";
				break;
			}
		} catch (Exception ex) {

			throw new ServletException(ex.getMessage());
		}
		RequestDispatcher dispatch = request.getRequestDispatcher(viewName);
		dispatch.forward(request, response);
	}

	private String validate(HttpServletRequest request, HttpServletResponse response) throws SQLException, ELoanException {
		/* write the code to validate the user */
		HttpSession session=request.getSession();
		String loginid = request.getParameter("loginid");
		User user = new User();
		user.setUsername(request.getParameter("loginid"));
		user.setPassword(request.getParameter("password"));
		session.setAttribute( "userName", loginid); 
		String pageToBeDisplayed = connDao.validateAUserWhileLogin(user);
		return pageToBeDisplayed;
	}

	private String placeloan(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		/* write the code to place the loan information */
		HttpSession session=request.getSession();
		LoanInfo loanInfo = new LoanInfo();
		loanInfo.setLoanName(request.getParameter("loanName"));
		loanInfo.setPurpose(request.getParameter("purpose"));
		loanInfo.setAmtrequest(Integer.parseInt(request.getParameter("loanAmountRequested")));
		loanInfo.setDoa(request.getParameter("loanApplicationDate"));
		loanInfo.setBstructure(request.getParameter("businessStructure"));
		loanInfo.setBindicator(request.getParameter("billingIndicator"));
		loanInfo.setTindicator(request.getParameter("taxIndicator"));
		loanInfo.setAddress(request.getParameter("address"));
		loanInfo.setEmail(request.getParameter("email"));
		loanInfo.setMobile(request.getParameter("PhoneNumber"));
		loanInfo.setStatus("pending");
		loanInfo.setUserId(session.getAttribute("userName").toString());
		int rows = connDao.registerALoan(loanInfo);
		return "userhome1.jsp";
	}

	private String application1(HttpServletRequest request, HttpServletResponse response) {
		/* write the code to display the loan application page */

		return "application.jsp";
	}

	private String editLoanProcess(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		/* write the code to edit the loan info */
		HttpSession session=request.getSession();
		LoanInfo loan = new LoanInfo();
	    loan.setApplno(request.getParameter("applictionNo"));
		loan.setLoanName(request.getParameter("loanName"));
		loan.setAmtrequest(Integer.parseInt(request.getParameter("loanAmountRequested")));
		loan.setPurpose(request.getParameter("purpose"));
		loan.setBstructure(request.getParameter("businessStructure"));
		loan.setBindicator(request.getParameter("billingIndicator"));
		loan.setTindicator(request.getParameter("taxIndicator"));
		loan.setAddress(request.getParameter("address"));
		loan.setMobile(request.getParameter("phone"));
		loan.setEmail(request.getParameter("email"));
		loan.setUserId(session.getAttribute("userName").toString());
		connDao.editLoanDetails(loan);
		return "userhome1.jsp";
		
	}

	private String registerUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		/* write the code to redirect page to read the user details */
		return "index.jsp";
	}

	private String registernewuser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		/*
		 * write the code to create the new user account read from user and return to
		 * index page
		 */
		User user = new User();
		user.setUsername(request.getParameter("loginId"));
		user.setPassword(request.getParameter("password"));
		int rows = connDao.createUser(user);
		return "index.jsp";
	}

	private String register(HttpServletRequest request, HttpServletResponse response) {
		/* write the code to redirect to register page */

		return "register.jsp";
	}

	private String displaystatus(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		/*
		 * write the code the display the loan status based on the given application
		 * number
		 */
		HttpSession session=request.getSession();
		LoanInfo loanInfo = new LoanInfo();
		LoanInfo loan;
		String appID=request.getParameter("applicationNumber");
		request.setAttribute("loan", loan=connDao.getAllLoanDetails(loanInfo, appID, session.getAttribute("userName").toString()));
		if(loan.getUserId()==null)
			return "trackloan.jsp";
		else
		return "loanDetails.jsp";
	}

	private String editloan(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		/* write a code to return to editloan page */
		String appID=request.getParameter("applicationNumber");
		HttpSession session=request.getSession();
		LoanInfo loanInfo = new LoanInfo();
/*		String status = connDao.trackLoanStatus(appID);
		if(status.equalsIgnoreCase("pending")) {*/
		request.setAttribute("loan", loanInfo=connDao.getAllLoanDetails(loanInfo, appID, session.getAttribute("userName").toString()));
		if(loanInfo.getUserId()==null)
			return "editloan.jsp";
		else
		return "editloanui.jsp";
/*		} else
			return "editloan.jsp";*/
	}

	private String trackloan(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		/* write a code to return to trackloan page */
		LoanInfo loan = new LoanInfo();
		String appId= request.getParameter("applicationNumber");
		String status = connDao.trackLoanStatus(appId);
		loan.setApplno(appId);
		loan.setStatus(status);
		return "trackloan.page";
	}

	private String application(HttpServletRequest request, HttpServletResponse response) {
		/* write a code to return to trackloan page */
		
		return "trackloan.page";
	}
}