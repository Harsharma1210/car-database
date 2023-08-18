<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Add Reply</title>
</head>
<body>
    <h1>Add Reply</h1>
    <form action="submitReply.jsp" method="post">
        <input type="hidden" name="questionId" value="<%= request.getParameter("questionId") %>">
        <label for="reply">Your Reply:</label><br>
        <textarea name="reply" rows="4" cols="50"></textarea><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>