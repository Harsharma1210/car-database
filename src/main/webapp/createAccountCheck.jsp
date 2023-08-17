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
			String entity = request.getParameter("newbuyerusername");
			String entity2 = request.getParameter("newbuyerpassword");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT username, password FROM buyerseller WHERE username=\'" + entity +
				"\' AND password=\'" + entity2 +"\'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			if(!result.first())
			{
				//FIND THE MAX ID NUMBER ALREADY IN THE TABLE
				
				Statement idQuery = con.createStatement();
				String idNumQuery = "SELECT MAX(buyerid) as max_id FROM buyerseller";
				ResultSet idResult = idQuery.executeQuery(idNumQuery);
				
				int newIdNum = 0;
				
				if(result.next())
				{
					newIdNum = idResult.getInt(1) + 1;
				}
				
				//WE CAN CREATE THE ACCOUNT BECAUSE IT DOESN'T EXIST
				Statement stmt2 = con.createStatement();
				String str2 = "INSERT INTO buyerseller VALUES (" + newIdNum + ", \'" + entity + "\', \'" + entity2 + "\')";
				int rows = stmt2.executeUpdate(str2);
				
				db.closeConnection(con);
				response.sendRedirect("accountCreated.jsp");
			}
			else
			{
				//ACCOUNT EXISTS SO WE REPROMPT
				%>
				ACCOUNT ALREADY EXISTS! TRY AGAIN!
				<br>
				<br>
				Input Your Account Information Below:
				<br>
				<br>
					<form method="get" action="createAccountCheck.jsp">
						<table>
							<tr>    
								<td>Username: </td><td><input type="text" name="newbuyerusername"></td>
							</tr>
							<tr>
								<td>Password: </td><td><input type="text" name="newbuyerpassword"></td>
							</tr>
						</table>
						<input type="submit" value="Submit">
					</form>
				<br> 
				<%
			}
		} 
		catch (Exception e) 
		{
			out.print(e);
		}%>
	

	</body>
</html>
