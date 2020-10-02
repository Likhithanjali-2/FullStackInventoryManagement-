package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bussinessLogic.RegistrationValidation;
import dao.UserDAO;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public SignUp() {
        super();
    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//signupView page opens when this servlet is called
		RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/WEB-INF/views/signupView.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//creating object for userDao to access functions used for signing up
		UserDAO userdao= new UserDAO();
		
		//getting data from the sign up form 
		String name = request.getParameter("Username"); 
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String email = request.getParameter("email");
		
		//validate the user data
		RegistrationValidation regVal = new RegistrationValidation();
		if(regVal.checkUserDetails(name,password, confirmPassword,email)) {
			try {
				userdao.addUserDetails(name, password,confirmPassword, email);
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("Successufully registered");
		}
		else
			System.out.println("Invalid Data!");
		
		//After user signed in successfully open login page
		RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
		rd.forward(request, response);
	}
}
