<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin Page</title>
</head>
<body>
    <h1>Welcome, Admin!</h1>

    <h2>Create Customer Representative Account</h2>
    <!-- Button to go to createCustomerRepAccount.jsp -->
    <form action="createCustomerRepAccount.jsp">
        <input type="submit" value="Create Customer Rep Account">
    </form>

    <h2>Generate Sales Reports</h2>
    <a href="generateReport?type=total">Total Earnings</a><br>
    <a href="generateReport?type=item">Earnings per Item</a><br>
    <a href="generateReport?type=itemType">Earnings per Item Type</a><br>
    <a href="generateReport?type=endUser">Earnings per End-User</a><br>
    <a href="generateReport?type=bestSelling">Best-Selling Items</a><br>
    <a href="generateReport?type=bestBuyers">Best Buyers</a><br>
    
    

</body>
</html>