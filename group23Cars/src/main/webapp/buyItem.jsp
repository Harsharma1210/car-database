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
		
		<% try 
		{
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement getDatabase = con.createStatement();
			
			//Create String to Retrieve Auction List
			String getDB = "SELECT vin, sellerid, highestbid, isopen, closedate, closetime FROM auction";
			
			//Run the Query
			ResultSet result = getDatabase.executeQuery(getDB);
			
			//Parse result and print table
			%>
			<table>
				<tr>
					<th>VIN</th>
					<th>Seller</th>
					<th>Highest Bid</th>
					<th>Open/Closed</th>
					<th>Close Date</th>
					<th>Close Time</th>
				</tr>
				<%//Between the Rows we parse the list and print the results
				while(result.next())
				{
					//For this loop we have to grab the username by doing another quick query
					Statement getUser = con.createStatement();
					String gU = "SELECT username FROM seller WHERE sellerid=\'" + result.getInt("sellerid") + "\'";
					ResultSet grabUser = getUser.executeQuery(gU);
					String username = "";
					if(grabUser.next())
					{
						username = grabUser.getString(1);
					}
				%>
				<tr>
					<td><%=result.getInt("vin")%></td>
					<td><%=username%></td>
					<td><%=result.getInt("highestbid")%></td>
					<td><%=result.getString("isopen")%></td>
					<td><%=result.getString("closedate")%></td>
					<td><%=result.getString("closetime")%></td>
				</tr>
				<%} %>
			</table>
			<br><br><br>
			<div id="sort">
			SELECT YOUR SORTING PREFERENCES: <br><br>
				<form method="get" action="buyItemQueried.jsp">
					<div>
						Open/Closed <br>
						<input type="radio" id="open" name="open_closed" value="yes">
						<label for="open">Open</label><br>
						
						<input type="radio" id="closed" name="open_closed" value="no">
						<label for="closed">Closed</label><br><br>
					</div>
					<div>
						VIN #: <input type="text" name="vinConstraint"><br>
						Name of Seller: <input type="text" name="sellerName"><br>
						Bid Should Be At Least: <input type="text" name="minBid"><br>
						Max Bid: <input type="text" name="maxBid"><br><br>
						<label for="selldate">End Date:</label>
  						<input type="date" id="date" name="date">
						<br><br>
					</div>
					<input type="submit" value="Submit">
				</form>
			</div>
			<div id="bid">
			</div>
			<br><br>
			BIDDING WORK IN PROGRESS--------
			<%
		} 
		catch (Exception e) 
		{
			out.print(e);
		}
		%>
	</body>
</html>