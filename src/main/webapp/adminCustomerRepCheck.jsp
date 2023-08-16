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
		<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("username");
			String entity2 = request.getParameter("password");
			
			//Check to see if the login information matches those of an admin
			if((entity.equals("admin")) && (entity2.equals("admin")))
			{
				//We send it to the Admin Webpage instead of the Customer Rep page
				db.closeConnection(con);
				response.sendRedirect("adminPage.jsp");
			}
			else
			{
				//WE CHECK THE CUSTOMER REP DATABASE FOR A SUCCESSFUL LOGIN
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				String str = "SELECT username, password FROM customerrep WHERE username=\'" + entity +
					"\' AND password=\'" + entity2 +"\'";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				
				if(!result.first()){ %>
					INCORRECT LOGIN INFO!!!
					<br><br>
					Input Your Login Information Below:
					<br><br>
					<form method="get" action="adminCustomerRepCheck.jsp">
						<table>
							<tr>    
								<td>Username: </td><td><input type="text" name="username"></td>
							</tr>
							<tr>
								<td>Password: </td><td><input type="text" name="password"></td>
							</tr>
						</table>
						<input type="submit" value="Submit">
					</form>
					<br><br>
					<a href="start.jsp">
						<button style="border-radius:5px;background-color:#333333;color:#FFFFFF;height:20px;weight:20px">
							GO BACK
						</button>
					</a>
			<%	}
				else
				{
					//REDIRECT TO CUSTOMER REP PAGE
					db.closeConnection(con);
					response.sendRedirect("customerRep.jsp");
				}
				
				db.closeConnection(con);
			}
			%>	
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>
