<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Smart Inventory Management System</title>
<link type="text/css" rel="stylesheet" href="./css/style.css">

</head>
<body class="body">
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
<div class="login-form">
	<h3>Login Here!</h3>
    <form action="${pageContext.request.contextPath}/Login" method="post">
    	<div>
        <input type="text" name="Username" placeholder="Username/Email" id="Username"></div>
        <br>
        <div>
        <input type="password" name="password" placeholder="Password" id="password"></div>
        <br><br>
        <button class="button1" type="submit">Login</button>
	</form>
</div>

</body>
</html>