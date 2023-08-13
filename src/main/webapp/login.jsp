<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login</title>
	</head>
	
	<body>
		ADMINISTRATIVE AND CUSTOMER REPRESENTATIVE LOGIN
		<br>
		Input Your Login Information Below:
		<br>
		<br>
			<form method="get" action="adminCustomerRepCheck.jsp">
				<table>
					<tr>    
						<td>Username: </td><td><input type="text" name="username"></td>
					</tr>
					<tr>
						<td>Password: </td><td><input type="text" name="password"></td>
					</tr>
				</table>
				<input type="submit" value="Submit">
			</form>
		<br> 
	
	<!-- THIS HAS BEEN COMMENTED OUT
	Alternatively, lets type in a new bar, a new beer, and a price that this bar will sell the beer for.
	<br>
		<form method="post" action="newBarBeerPrice.jsp">
		<table>
		<tr>    
		<td>Bar</td><td><input type="text" name="bar"></td>
		</tr>
		<tr>
		<td>Beer</td><td><input type="text" name="beer"></td>
		</tr>
		<tr>
		<td>Price</td><td><input type="text" name="price"></td>
		</tr>
		</table>
		<input type="submit" value="Add me!">
		</form>
	<br> -->
	
	<!-- THIS HAS BEEN COMMENTED OUT 
	Or we can query the beers with price:
	<br>
		<form method="get" action="query.jsp">
			<select name="price" size=1>
				<option value="3.0">$3.0 and under</option>
				<option value="5.0">$5.0 and under</option>
				<option value="8.0">$8.0 and under</option>
			</select>&nbsp;<br> <input type="submit" value="submit">
		</form>
	<br> -->

	</body>
</html>
