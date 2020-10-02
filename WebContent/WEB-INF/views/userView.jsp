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
<h3>Welcome To The Store</h3>

<div class="nav">
	<button class="button"  onclick="addToCart()">Add To Product</button>
	<button class="button"  onclick="displayAllPurchases()">Display All Purchases</button>
</div>
<div id="AddToCart">    
	<h3>Products From Store :</h3>
	<jsp:include page="displayProductsFromStore.jsp" />  
	<h3>Add Products To Your Cart!</h3><form action="${pageContext.request.contextPath}/AddToCart" method="post" class="special">
			<div>
            <input type="number" name="productId" placeholder="Enter product Id to buy that product: " id="productId"></div>
            <br>
            <div>
            <input type="number" name="quantity" placeholder="How much quantity you want to buy: " id="quantity"></div>
            <br>
            <button class="button1" type="submit">ADD</button>
    </form>
</div>
<div id="DisplayAllPurchases">    
	<h3>Products you bought from store :</h3>
	<jsp:include page="displayAllPurchases.jsp" />
</div>
<script>
	function addToCart() {
  		document.getElementById("AddToCart").style.display = "block";
  		document.getElementById("DisplayAllPurchases").style.display = "none";
	}
	function displayAllPurchases(){
		document.getElementById("AddToCart").style.display = "none";
  		document.getElementById("DisplayAllPurchases").style.display = "block";
	}
</script>
</body>
</html>