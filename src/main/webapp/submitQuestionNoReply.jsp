<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Submit Question</title>
</head>
<body>
    <%
        String questionText = request.getParameter("question");

        try {
            // Establish database connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Cars", "root", "root");
          
            // Insert question into the database
            String insertQuery = "INSERT INTO questions (question_text) VALUES (?)";
            PreparedStatement pstmt = con.prepareStatement(insertQuery);
            pstmt.setString(1, questionText);
            pstmt.executeUpdate();
            pstmt.close();
            
           
            
            con.close();
            
            
            response.sendRedirect("viewQuestionsNoReply.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("askQuestion.jsp?error=true");
        }
    %>
    
</body>
</html>