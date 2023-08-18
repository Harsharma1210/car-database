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
		CREATE CUSTOMER REPRESENTATIVE ACCOUNT
    <br>
    <br>
    Input Customer Rep Account Information Below:
    <br>
    <br>
    <form method="get" action="createCustomerRepAccountCheck.jsp">
        <table>
            <tr>    
                <td>Username: </td><td><input type="text" name="newRepUsername"></td>
            </tr>
            <tr>
                <td>Password: </td><td><input type="password" name="newRepPassword"></td>
            </tr>
        </table>
        <input type="submit" value="Submit">
    </form>
    <br> 

	</body>
</html>