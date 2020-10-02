package service;

public interface CustomerDaoInterface {
	public void addProductToTheCart(String email, int productId,int quantity) throws Exception ;
}
