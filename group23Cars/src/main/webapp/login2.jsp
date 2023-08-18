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
		BUYER/SELLER LOGIN INFORMATION
		<br>
		<br>
		Input Your Login Information Below:
		<br>
		<br>
			<form method="get" action="buyerSellerLoginCheck.jsp">
				<table>
					<tr>    
						<td>Username: </td><td><input type="text" name="buyerusername"></td>
					</tr>
					<tr>
						<td>Password: </td><td><input type="text" name="buyerpassword"></td>
					</tr>
				</table><br>
				<input type="submit" value="Submit">
			</form>
		<br> 
		<a href="start.jsp">
			<button style="border-radius:5px;background-color:#333333;color:#FFFFFF;height:20px;weight:20px">
				RETURN TO START
			</button>
		</a>

	</body>
</html>