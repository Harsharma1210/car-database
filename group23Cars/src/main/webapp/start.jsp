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
		<h2>WELCOME TO OUR CAR AUCTION SITE!!!</h2>
		<br>
		Select Which Login:
		<br>
		<br id="button 1"> 
			<a href="login.jsp">
				<button style="border-radius:5px;background-color:#333333;color:#FFFFFF;height:20px;weight:20px">
					ADMIN/CUSTOMER REP LOGIN
				</button>
			</a>	
		<br> 
		<br>
		<br id ="button 2">
			<a href="login2.jsp">
				<button style="border-radius:5px;background-color:#333333;color:#FFFFFF;height:20px;weight:20px">
					BUYER/SELLER LOGIN
				</button>
			</a>
		<br>

	</body>
</html>