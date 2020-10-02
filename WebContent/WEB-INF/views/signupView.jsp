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
<div class="signup-form">
    <form action="${pageContext.request.contextPath}/SignUp" method="post">
    	<div>
        <input type="text" name="Username" placeholder="Username/Email" id="Username"></div>
        <br>
        <div>
        <input type="password" name="password" placeholder="Password" id="password"></div>
        <br>
        <div>
        <input type="password" name="confirmPassword" placeholder="Confirm Password" id="confirmPassword"></div>
        <br>
        <div>
        <input type="text" name="email" placeholder ="Email" id="email"></div>
        <br>
        <button class="button1" type="submit">Sign Up</button>
	</form>
</div>

</body>
</html>