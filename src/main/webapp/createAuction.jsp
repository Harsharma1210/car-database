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
			Statement stmt = con.createStatement();
			
			//Get the selected radio button from the index.jsp
			String vehicleType = request.getParameter("vehicle-type");
			String make = request.getParameter("make");
			String model = request.getParameter("model");
			String year = request.getParameter("vehicle-year");
			String fuelType = request.getParameter("fuel-type");
			String preowned = request.getParameter("preowned");
			String condition = request.getParameter("condition");
			String miles = request.getParameter("milenum");
			String color = request.getParameter("color");
			String minimumRate = request.getParameter("minrate");
			String vin = request.getParameter("vin");
			String date = request.getParameter("date");
			String hour = request.getParameter("hour");
			String username = (String)session.getAttribute("user");
			
			String fullyAssembled = "";
			String tiltSteering = "";
			String bodyupgrades = "";
			String storageSpace = "";
			
			//CHECK TO SEE IF VALUES ARE NULL
			if(make == null || model == null || miles == null || color == null || minimumRate == null || vin == null || date == null)
			{
				response.sendRedirect("selectVehicleAttributesError.jsp");
			}
			else
			{
				if(Integer.valueOf(hour) < 10)
				{
					hour = "0"+hour;
				}
				String minute = request.getParameter("minute");
				if(Integer.valueOf(minute) < 10)
				{
					minute = "0"+minute;
				}
				
				//INSERT VEHICLE DATA INTO VEHICLE TABLE
				Statement vehicleInsert = con.createStatement();
				String vehicleQuery = "INSERT INTO vehicle VALUES (\'" + make + "\', \'" + model + "\', " + year + ", \'" + fuelType + "\', \'" + preowned + "\', \'" + condition + "\', " + miles + ", \'" + color + "\', \'" + vin + "\')";                  
				int rows3 = vehicleInsert.executeUpdate(vehicleQuery);
				
				//CHECK TO SEE IF IT IS MOTORYCLE, CAR, OR TRUCK
				if(vehicleType.equals("motorcycle"))
				{
					//IF MOTORCYCLE, ADD TO MOTORCYCLE TABLE
					Statement motorcycleInsert = con.createStatement();
					fullyAssembled = request.getParameter("fully-assembled");
					tiltSteering = request.getParameter("tilt-steering");
					
					String motorcycleInput = "INSERT INTO motorcycle VALUES (\'" + vin + "\', \'" + fullyAssembled + "\', \'" + tiltSteering + "\')";
					int rows = motorcycleInsert.executeUpdate(motorcycleInput);
				}
				if(vehicleType.equals("car"))
				{
					Statement carInsert = con.createStatement();
					bodyupgrades = request.getParameter("body-upgrades");
					
					String carInput = "INSERT INTO car VALUES (\'" + vin + "\', \'" + bodyupgrades + "\')";
					int rows = carInsert.executeUpdate(carInput);
				}
				if(vehicleType.equals("truck"))
				{
					Statement truckInsert = con.createStatement();
					storageSpace = request.getParameter("storage");
					
					String truckInput = "INSERT INTO truck VALUES (\'" + vin + "\', " + storageSpace + ")";
					int rows = truckInsert.executeUpdate(truckInput);
				}
				
				//INSERT AUCTION DATA INTO AUCTION TABLE
				Statement idQuery = con.createStatement();
				String idNumQuery = "SELECT MAX(buyerid) as max_id FROM buyer";
				ResultSet idResult = idQuery.executeQuery(idNumQuery);
				
				int sellerIdNum = 0;
					
				if(idResult.next())
				{
					sellerIdNum = idResult.getInt(1);
				}
				
				Statement sellerName = con.createStatement();
				String sellUsername = "SELECT username FROM seller WHERE sellerid=" + sellerIdNum;
				ResultSet sellerUsername = sellerName.executeQuery(sellUsername);
				
				String susername = "";
				
				if(sellerUsername.next())
				{
					susername = sellerUsername.getString(1);
				}
				
				String str = "INSERT INTO auction VALUES (\'" + vin + "\', " + sellerIdNum + ", \'" + susername + "\', " + minimumRate + ", 0," + sellerIdNum + ", \'Yes\', \'" + date + "\', \'" + hour + ":" + minute + ":00" + "\')";
				int rows2 = stmt.executeUpdate(str);
				
				//IF SUCCESSFULL, SHOULD REDIRECT TO CONFIRMATION PAGE
				response.sendRedirect("auctionCreationConfirmation.jsp");
			}
		} 
		catch (Exception e) 
		{
			out.print(e);
		}
		%>
	</body>
</html>