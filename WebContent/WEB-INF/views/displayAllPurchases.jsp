<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>  
<%@page import="java.time.LocalDate"%>
<%@page import="utility.ConnectionManager"%>
<%@page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Smart Inventory Management System</title>
<link type="text/css" rel="stylesheet" href="./css/style.css">
</head>

<body>
<%

String email = (String) session.getAttribute("username");

Connection con=ConnectionManager.getConnection();
PreparedStatement pstmt = con.prepareStatement("select customerpurchases.productname,customerpurchases.category,customerpurchases.quantity,customerpurchases.price,customerdata.name from customerpurchases,customerdata where customerpurchases.id=customerdata.id and customerdata.email=?");
pstmt.setString(1, email);
ResultSet rs = pstmt.executeQuery();
%>
<table border="1">
<tr>
<th>Name</th>
<th>Category</th>
<th>ProductName</th>
<th>Quantity</th> 
<th>Price</th>   
</tr>
 
<%
while (rs.next()) { 
%>
<tr>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("category")%></td>
<td><%=rs.getString("productname")%></td>
<td><%=rs.getInt("quantity")%></td>
<td><%=rs.getInt("price")*rs.getInt("quantity")%></td>
</tr>

<%
}
con.close();
%> 

</table>
</body>
</html>
