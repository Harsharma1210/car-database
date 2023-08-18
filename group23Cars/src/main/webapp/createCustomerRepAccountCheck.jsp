<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login</title>
	</head>
	<body>
		<%
        try {
            // Get the database connection
            ApplicationDB db = new ApplicationDB();  
            Connection con = db.getConnection();       

            // Create a SQL statement
            Statement stmt = con.createStatement();
            String entity = request.getParameter("newRepUsername");
            String entity2 = request.getParameter("newRepPassword");
            // Make a SELECT query to check if account exists
            String str = "SELECT username FROM customerRep WHERE username='" + entity + "'";
            ResultSet result = stmt.executeQuery(str);

            if (!result.first()) {
                // Find the maximum ID number already in the table
                Statement idQuery = con.createStatement();
                String idNumQuery = "SELECT MAX(id) as max_id FROM customerRep";
                ResultSet idResult = idQuery.executeQuery(idNumQuery);

                int newIdNum = 1; // Default if no rows
                if (idResult.next()) {
                    newIdNum = idResult.getInt(1) + 1;
                }

                // Create the customer rep account
                Statement stmt2 = con.createStatement();
                String str2 = "INSERT INTO customerRep VALUES (" + newIdNum + ", '" + entity + "', '" + entity2 + "')";
                int rows = stmt2.executeUpdate(str2);

                db.closeConnection(con);
                response.sendRedirect("customerRepAccountCreated.jsp");
            } else {
                // Account exists, reprompt
                // Display the form again
                %>
                ACCOUNT ALREADY EXISTS! TRY AGAIN!
                <br>
                <br>
                Input Customer Rep Account Information Below:
                <br>
                <br>
                <form method="get" action="createCustomerRepAccountCheck.jsp">
                    <table>
                        <tr>    
                            <td>Username: </td><td><input type="text" name="newRepUsername"></td>
                        </tr>
                        <tr>
                            <td>Password: </td><td><input type="password" name="newRepPassword"></td>
                        </tr>
                    </table>
                    <input type="submit" value="Submit">
                </form>
                <br> 
                <%
            }
        } catch (Exception e) {
            out.print(e);
        }
    %>
	

	</body>
</html>