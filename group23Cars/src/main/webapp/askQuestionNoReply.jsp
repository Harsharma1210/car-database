<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Ask a Question</title>
</head>
<body>
    <h1>Ask a Question</h1>
    <form action="submitQuestionNoReply.jsp" method="post">
        <label for="question">Your Question:</label><br>
        <textarea name="question" rows="4" cols="50"></textarea><br>
        <input type="submit" value="Submit">
    </form>
    
    <form action="adminPage.jsp">
        <input type="submit" value="Back to Admin Page">
    </form>
    
</body>
</html>
