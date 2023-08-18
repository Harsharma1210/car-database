<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,com.cs336.pkg.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search User</title>
</head>
<body>
    <h1>Search User</h1>
    <form action="userDetails.jsp" method="get">
        <label for="username">Username:</label>
        <input type="text" name="username">
        <input type="submit" value="Search">
    </form>
    
    <p><a href="customerRep.jsp">Back to Dashboard</a></p>
</body>
</html>