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
		
			//Create INT To See How Many Constraints Are Not Null
			int numConstraints = 0;
			
			//HERE WE GET ALL THE PARAMETERS SPECIFIED IN THE LAST FILE
			String openClose = request.getParameter("open_closed");
			if((openClose!=null) && !(openClose.isEmpty()))
			{
				numConstraints += 1;
			}
			String vinConstraint = request.getParameter("vinConstraint");
			if((vinConstraint!=null) && !(vinConstraint.isEmpty()))
			{
				numConstraints += 1;
			}
			String sellerName = request.getParameter("sellerName");
			if((sellerName!=null) && !(sellerName.isEmpty()))
			{
				numConstraints += 1;
			}
			String minBid = request.getParameter("minBid");
			if((minBid!=null) && !(minBid.isEmpty()))
			{
				numConstraints += 1;
			}
			String maxBid = request.getParameter("maxBid");
			if((maxBid!=null) && !(maxBid.isEmpty()))
			{
				numConstraints += 1;
			}
			String endDate = request.getParameter("date");
			if((endDate!=null) && !(endDate.isEmpty()))
			{
				numConstraints += 1;
			}
			
			//Create String to Retrieve Auction List
			String getDB = "SELECT vin, sellerid, highestbid, isopen, closedate, closetime FROM auction";
			
			//numConstraints now has the number of constraints
			if(numConstraints > 0)
			{
				getDB += " WHERE";
			}
			
			if((openClose!=null) && !(openClose.isEmpty()))
			{
				getDB += " isopen=\'" + openClose + "\'";
				numConstraints -= 1;
				if(numConstraints > 0)
				{
					getDB += " AND";
				}
			}
			
			if((vinConstraint!=null) && !(vinConstraint.isEmpty()))
			{
				getDB += " vin=" + vinConstraint;
				numConstraints -= 1;
				if(numConstraints > 0)
				{
					getDB += " AND";
				}
			}
			
			if((sellerName!=null) && !(sellerName.isEmpty()))
			{
				getDB += " sellername=\'" + sellerName + "\'";
				numConstraints -= 1;
				if(numConstraints > 0)
				{
					getDB += " AND";
				}
			}
			
			if((minBid!=null) && !(minBid.isEmpty()))
			{
				getDB += " highestbid >= " + minBid;
				numConstraints-=1;
				if(numConstraints > 0)
				{
					getDB += " AND";
				}
			}
			
			if((maxBid!=null) && !(maxBid.isEmpty()))
			{
				getDB += " highestbid <= " + maxBid;
				numConstraints-=1;
				if(numConstraints > 0)
				{
					getDB += " AND";
				}
			}
			
			if((endDate!=null) && !(endDate.isEmpty()))
			{
				getDB += " closedate=\'" + endDate + "\'";
				numConstraints -= 1;
				if(numConstraints > 0)
				{
					getDB += " AND";
				}
			}
		
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
						Bid Should Be At Least: <input type="text" name="minbid"><br>
						Max Bid: <input type="text" name="maxbid"><br><br>
						<label for="selltime">End Date:</label>
  						<input type="date" id="date" name="date">
						<label for="endhour">End Hour:</label>
			    		<select name="endhour" id="endhour">
				    		<option value="0">0</option>
				    		<option value="1">1</option>
				    		<option value="2">2</option>
				   			<option value="3">3</option>
				   			<option value="4">4</option>
				   			<option value="5">5</option>
				   			<option value="6">6</option>
			    			<option value="7">7</option>
			    			<option value="8">8</option>
			    			<option value="9">9</option>
				    		<option value="10">10</option>
				    		<option value="11">11</option>
				   			<option value="12">12</option>
				   			<option value="13">13</option>
				   			<option value="14">14</option>
				   			<option value="15">15</option>
			    			<option value="16">16</option>
			    			<option value="17">17</option>
				    		<option value="18">18</option>
				    		<option value="19">19</option>
				   			<option value="20">20</option>
				   			<option value="21">21</option>
				   			<option value="22">22</option>
				   			<option value="23">23</option>
			    		</select>
			    		<label for="minute">Minute:</label>
			    		<select name="minute" id="minute">
			    			<option value="1">1</option> <option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option> 
			    			<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
			    			<option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option>
			    			<option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option>
			    			<option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option>
			    			<option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
			    		</select>
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