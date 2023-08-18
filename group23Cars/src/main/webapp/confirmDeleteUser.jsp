<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Confirm Delete User</title>
</head>
<body>
    <h1>Confirm Delete User</h1>
    <%
        int userId = Integer.parseInt(request.getParameter("userId"));

        try {
            // Establish database connection
            ApplicationDB db = new ApplicationDB();
            Connection con = db.getConnection();

            // Fetch user information from the customerRep table based on the provided userId
            String customerRepQuery = "SELECT * FROM customerRep WHERE id = ?";
            PreparedStatement customerRepPstmt = con.prepareStatement(customerRepQuery);
            customerRepPstmt.setInt(1, userId);
            ResultSet customerRepRs = customerRepPstmt.executeQuery();

            // Fetch user information from the buyerSeller table based on the provided userId
            String buyerSellerQuery = "SELECT * FROM buyerSeller WHERE buyerid = ?";
            PreparedStatement buyerSellerPstmt = con.prepareStatement(buyerSellerQuery);
            buyerSellerPstmt.setInt(1, userId);
            ResultSet buyerSellerRs = buyerSellerPstmt.executeQuery();

            // Display user information if found in customerRep or buyerSeller tables
            boolean userFound = false;

            // Display customerRep information
            if (customerRepRs.next()) {
                userFound = true;
                String userUsername = customerRepRs.getString("username");
    %>
    <p>Are you sure you want to delete the customer representative with the username <%= userUsername %>? This action cannot be undone.</p>
    <form action="deleteUser.jsp" method="post">
        <input type="hidden" name="userId" value="<%= userId %>">
        <input type="submit" value="Delete">
    </form>
    <%
            }

            // Display buyerSeller information
            if (buyerSellerRs.next()) {
                userFound = true;
                String userUsername = buyerSellerRs.getString("username");
    %>
    <p>Are you sure you want to delete the buyer seller with the username <%= userUsername %>? This action cannot be undone.</p>
    <form action="deleteUser.jsp" method="post">
        <input type="hidden" name="userId" value="<%= userId %>">
        <input type="submit" value="Delete">
    </form>
    <%
            }

            // If user not found in both tables
            if (!userFound) {
    %>
    <p>No user found with the provided user ID.</p>
    <%
            }

            customerRepRs.close();
            customerRepPstmt.close();
            buyerSellerRs.close();
            buyerSellerPstmt.close();
            db.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <p><a href="searchUser.jsp">Back to Search</a></p>
</body>
</html>