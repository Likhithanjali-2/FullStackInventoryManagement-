package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StoreDAO;

/**
 * Servlet implementation class AddNewProduct
 */
@WebServlet("/AddNewProduct")
public class AddNewProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddNewProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//adminView page opens when request comes
		RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/WEB-INF/views/adminView.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StoreDAO storedao = new StoreDAO();
		//getting data given by the user from the adminview Jsp page  
		int supplierId = Integer.parseInt(request.getParameter("supplierId")); 
		int quantity = Integer.parseInt(request.getParameter("quantity")); 
		
		try {
			//add product to store
			storedao.addProductsToStore(supplierId,quantity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/WEB-INF/views/adminView.jsp");
		rd.forward(request, response);
	}

}
