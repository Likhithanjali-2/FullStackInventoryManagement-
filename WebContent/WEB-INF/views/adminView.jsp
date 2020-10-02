<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Smart Inventory Management System</title>
<link type="text/css" rel="stylesheet" href="./css/style.css">
</head>
<body>
<div class="top-grid">
<div class="header">
	Smart Inventory Management System
</div>
<div>
	<a href="${pageContext.request.contextPath}/Login">Login</a>
</div>
<div>
    <a href="${pageContext.request.contextPath}/SignUp">Sign Up</a>
</div>
</div>
<h3>Welcome To Admin Panel</h3>
<div class="nav">
	<button class="button"  onclick="addNewProduct()">Add New Product</button>
	<button class="button"  onclick="removeSuppliers()">Remove Suppliers</button>
	<button class="button"  onclick="viewAllproducts()">View all products in store</button>
	<button class="button"  onclick="viewAllCustomers()">View all customer purchases</button>
</div>

<div id="AddNewProduct" class="simple-form">      
	<div><h3>Products From Suppliers :</h3>
		<jsp:include page="displayProductsFromSuppliers.jsp" />
	<h3>Add Product Here!</h3><form action="${pageContext.request.contextPath}/AddNewProduct" method="post" class="special">
			<div>
            <input type="number" name="supplierId" placeholder="Give supplier Id to add: " id="supplierId"></div>
            <div>
            <input type="number" name="quantity" placeholder="How many items you want to add: " id="quantity"></div>
            <br><br>
            <button class="button1" type="submit">ADD</button>
    </form>
    </div>
</div>

<div id="RemoveSuppliers" class="simple-form">      
	<h3>Products From Suppliers :</h3>
	<jsp:include page="displayProductsFromSuppliers.jsp" />
	<h3>Remove Suppliers Here!</h3>
	<form action="${pageContext.request.contextPath}/RemoveSuppliers" method="post" class="special">
			<div>
            <input type="number" name="supplierId" placeholder="To Remove suppliers enter the supplierId: " id="supplierId">
            <button class="button1" type="submit">Remove</button>
            </div>
	</form>
</div>
<div id="ViewAllproducts">    
	<h3>Products From Store :</h3>
	<jsp:include page="displayProductsFromStore.jsp" />  
</div>
<div id="ViewAllCustomers">    
	<h3>All Customers To Store :</h3>
	<jsp:include page="displayCustomersFromStore.jsp" />  
</div>
<script>
	function addNewProduct() {
  		document.getElementById("AddNewProduct").style.display = "block";
  		document.getElementById("RemoveSuppliers").style.display = "none";
  		document.getElementById("ViewAllproducts").style.display = "none";
  		document.getElementById("ViewAllCustomers").style.display = "none";
  	}
	function removeSuppliers() {
  		document.getElementById("AddNewProduct").style.display = "none";
  		document.getElementById("RemoveSuppliers").style.display = "block";
  		document.getElementById("ViewAllproducts").style.display = "none";
  		document.getElementById("ViewAllCustomers").style.display = "none";
  	}
	function viewAllproducts() {
  		document.getElementById("AddNewProduct").style.display = "none";
  		document.getElementById("RemoveSuppliers").style.display = "none";
  		document.getElementById("ViewAllproducts").style.display = "block";
  		document.getElementById("ViewAllCustomers").style.display = "none";
  	}
	function viewAllCustomers() {
  		document.getElementById("AddNewProduct").style.display = "none";
  		document.getElementById("RemoveSuppliers").style.display = "none";
  		document.getElementById("ViewAllproducts").style.display = "none";
  		document.getElementById("ViewAllCustomers").style.display = "block";
  	}
</script>
</body>
</html>