<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>View Questions</title>
</head>
<body>
    <h1>View Questions</h1>
    
    <!-- Add a search form -->
    <form action="viewQuestionsNoReply.jsp" method="get">
        <label for="keywords">Search by Keywords:</label>
        <input type="text" name="keywords">
        <input type="submit" value="Search">
    </form>
    
    <ul>
        <%
            try {
                // Establish database connection
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Cars", "root", "root");
                
                // Construct the base query
                String baseQuery = "SELECT q.question_id, q.question_text, r.reply_text FROM questions q LEFT JOIN replies r ON q.question_id = r.question_id";
                
                String keywords = request.getParameter("keywords");
                
                // Modify the query if keywords are provided
                String query = baseQuery;
                if (keywords != null && !keywords.isEmpty()) {
                    query = baseQuery + " WHERE q.question_text LIKE '%" + keywords + "%' OR r.reply_text LIKE '%" + keywords + "%'";
                }
                
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                
                int currentQuestionId = -1; // To keep track of the current question

                while (rs.next()) {
                    int questionId = rs.getInt("question_id");
                    String questionText = rs.getString("question_text");
                    String replyText = rs.getString("reply_text");

                    if (currentQuestionId != questionId) {
        %>
        <li>
            <strong>Question:</strong> <%= questionText %><br>
            <%-- Display reply if available --%>
            <strong>Reply:</strong> <%= replyText != null ? replyText : "No reply yet" %><br>
            
        </li>
        <%
                    }
                    currentQuestionId = questionId;
                }

                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </ul>
</body>
</html>