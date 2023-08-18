<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Reply Submitted</title>
</head>
<body>
    <%
        int questionId = Integer.parseInt(request.getParameter("questionId"));
        String replyText = request.getParameter("reply");

        try {
            // Establish database connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Cars", "root", "root");

            // Insert reply into the database
            String insertQuery = "INSERT INTO replies (question_id, reply_text) VALUES (?, ?)";
            PreparedStatement pstmt = con.prepareStatement(insertQuery);
            pstmt.setInt(1, questionId);
            pstmt.setString(2, replyText);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();

            response.sendRedirect("viewQuestions.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addReply.jsp?questionId=" + questionId + "&error=true");
        }
    %>
</html>