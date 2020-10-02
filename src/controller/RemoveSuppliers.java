package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SupplierDAO;

/**
 * Servlet implementation class RemoveSuppliers
 */
@WebServlet("/RemoveSuppliers")
public class RemoveSuppliers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RemoveSuppliers() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//adminView page opens when request comes
		RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/WEB-INF/views/adminView.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SupplierDAO supplierdao = new SupplierDAO();
		
		//getting data given by the user from the adminview Jsp page  
		int supplierId = Integer.parseInt(request.getParameter("supplierId"));  
		
		try {
			//remove supplier to store
			supplierdao.removeSupplier(supplierId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/WEB-INF/views/adminView.jsp");
		rd.forward(request, response);
	}
}
