<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Create Auction</title>
	</head>
	
	<body>
		<h3>Input Vehicle Information:</h3>
		<br>
		<form method="get" action="selectVehicleAttributes.jsp">
			<label for="vehicle-type">Choose Vehicle Type:</label> 
	    		<select name="vehicle-type" id="vehicle-type"> 
	        		<option value="motorcycle">Motorcycle</option> 
	        		<option value="car">Car</option> 
	        		<option value="truck">Truck</option>  
	    		</select>
	    	<input type="submit" value="Submit">
    	</form>
	</body>
</html>