<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User</title>
	</head>
	
	<body>
		<h3>WELCOME!!!</h3> <br><br>
		What Would You Like To Do?
		<br><br>
		<a href="sellItem.jsp">
			<button style="border-radius:5px;background-color:#333333;color:#FFFFFF;height:20px;weight:20px">
				AUCTION AN ITEM
			</button>
		</a>
		<br><br>
		<a href="buyItem.jsp">
			<button style="border-radius:5px;background-color:#333333;color:#FFFFFF;height:20px;weight:20px">
				BUY AN ITEM
			</button>
		</a>
	</body>
</html>