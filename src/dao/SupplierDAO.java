package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import service.SupplierDaoInterface;
import utility.ConnectionManager;

public class SupplierDAO implements SupplierDaoInterface {

	public void removeSupplier(int supplierId) throws Exception {
		Connection con=ConnectionManager.getConnection();
		PreparedStatement pstmt = con.prepareStatement("delete from supplierproducts where id="+supplierId);
		pstmt.executeUpdate();
	}
}
