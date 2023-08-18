<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Add Question</title>
</head>
<body>
    <h1>Question Added</h1>
    <%
        String questionText = request.getParameter("question");
        
    try {
        // Establish a database connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Cars", "root", "root");
        
        // Prepare the SQL statement for inserting the question
        String insertQuery = "INSERT INTO questions (question_text) VALUES (?)";
        PreparedStatement pstmt = con.prepareStatement(insertQuery);
        pstmt.setString(1, questionText);
        
        // Execute the SQL statement
        pstmt.executeUpdate();
        
        // Close resources
        pstmt.close();
        con.close();
        
        // Redirect to the viewQuestions.jsp page
        response.sendRedirect("viewQuestions.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("askQuestion.jsp?error=true");
    }
%>
<p>Your question has been added successfully.</p>
<p><a href="viewQuestions.jsp">View Questions</a></p>
</body>
</html>