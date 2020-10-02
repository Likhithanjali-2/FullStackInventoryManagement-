<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>  
<%@page import="java.time.LocalDate"%>
<%@page import="utility.ConnectionManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Smart Inventory Management System</title>
<link type="text/css" rel="stylesheet" href="./css/style.css">
</head>
<body>
<%
Connection con=ConnectionManager.getConnection();
PreparedStatement pstmt = con.prepareStatement("select * from supplierproducts");
ResultSet rs = pstmt.executeQuery();
%>
<table border="1">
<tr>
<th>ID</th>
<th>Category</th>
<th>ProductName</th>
<th>Quantity</th> 
<th>Price</th>   
</tr> 
<%
while (rs.next()) { 
%>
<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("category")%></td>
<td><%=rs.getString("productname")%></td>
<td><%=rs.getInt("quantity")%></td>
<td><%=rs.getInt("price")%></td>
</tr>

<%
}
con.close();
%> 

</table>
</body>
</html>
