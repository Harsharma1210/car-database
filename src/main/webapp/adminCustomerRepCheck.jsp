<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login Confirmed</title>
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
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT username, password FROM buyer WHERE username=\'" + entity +
				"\' AND password=\'" + entity2 +"\'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			if(!result.first())
				out.print("Not a Valid User");
			else
				out.print("Welcome!");
			
			db.closeConnection(con);
		%>
			
			
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>