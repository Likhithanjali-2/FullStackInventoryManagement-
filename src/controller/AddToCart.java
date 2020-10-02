package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDAO;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddToCart() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//userView page opens when request comes
		RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/WEB-INF/views/userView.jsp");
		rd.forward(request, response);
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//getting values stored in session
    	HttpSession session = request.getSession(true);
		String email = (String) session.getAttribute("username");
		
		CustomerDAO customerdao = new CustomerDAO();
		//getting data given by the user from the userview Jsp page
		int productId = Integer.parseInt(request.getParameter("productId")); 
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		try {
			//add the product to cart of user database
			customerdao.addProductToTheCart(email, productId, quantity); 	
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/WEB-INF/views/userView.jsp");
		rd.forward(request, response);
	}

}
