<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,com.cs336.pkg.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Details</title>
</head>
<body>
    <h1>User Details</h1>
    <%
        String username = request.getParameter("username");
        
        try {
        	ApplicationDB db = new ApplicationDB();
        	Connection con = db.getConnection();
            String query = "SELECT * FROM customerRep WHERE username = ? UNION SELECT * FROM buyerSeller WHERE username = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, username);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("id");
                String userUsername = rs.getString("username");
                // Retrieve other user information from the result set
                // ...

                // Display user information
    %>
    <h2>User Information</h2>
    <p><strong>User ID:</strong> <%= userId %></p>
    <p><strong>Username:</strong> <%= userUsername %></p>
    <!-- Display other user information here -->

    <!-- Links to edit and delete pages -->
    <p><a href="editUser.jsp?userId=<%= userId %>">Edit User</a></p>
    <p><a href="confirmDeleteUser.jsp?userId=<%= userId %>">Delete User</a></p>
    <%
            } else {
                // Display a message if the user is not found
                out.println("User not found.");
            }

            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</body>
</html>