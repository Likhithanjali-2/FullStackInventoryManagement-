package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//loginView page opens when request comes
		RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//storing the login form data
		String username = request.getParameter("Username"); 
		String password = request.getParameter("password"); 
		
		//creating session
		HttpSession session = request.getSession(true);
		
		UserDAO userdao= new UserDAO();
		try {
			//check the login details are admin's
			if(userdao.checkAdminCredentials(username,password)) {
				//storing values in session
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/WEB-INF/views/adminView.jsp");
				rd.forward(request, response);
			}
			//check the user login details are valid
			else if(userdao.checkUserCredentials(username,password)) {
				//storing values in session
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/WEB-INF/views/userView.jsp");
				rd.forward(request, response);
			}
			//If invalid go to the same login page
			else
			{
				RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
				rd.forward(request, response);
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
