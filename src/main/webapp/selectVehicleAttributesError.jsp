<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User</title>
	</head>
	
	<body>
		<h4>One or More Fields Were Not Filled! Try Again.</h4>
		<br>	
		SELECT VEHICLE ATTRIBUTES:
		<%
		String vehicleType = request.getParameter("vehicle-type");
		
		if(vehicleType.equals("motorcycle"))
		{
			//HTML CODE w/ MOTORCYCLE OPTIONS
			%>
			<form method="get" action="createAuction.jsp">
	    		<label for="vehicle-type">You Selected:</label> 
	    		<select name="vehicle-type" id="vehicle-type"> 
	        		<option value="motorcycle">Motorcycle</option>   
	    		</select>
	    		<table>
					<tr>    
						<td>Make: </td><td><input type="text" name="make"></td>
					</tr>
					<tr>
						<td>Model: </td><td><input type="text" name="model"></td>
					</tr>
		
				</table>
	    		<br><br>
	    		<label for="year">Year:</label>
	    		<select name="vehicle-year" id="vehicle-year">
	    			<option value="2023">2023</option>
	    			<option value="2022">2022</option>
	    			<option value="2021">2021</option>
	    			<option value="2020">2020</option>
	    			<option value="2019">2019</option>
	    			<option value="2018">2018</option>
	    			<option value="2017">2017</option>
	    			<option value="2016">2016</option>
	    			<option value="2015">2015</option>
	    			<option value="2014">2014</option>
	    			<option value="2013">2013</option>
	    		</select>
	    		<br><br>
	    		<label for="fuel-type">Fuel Type:</label>
	    		<select name="fuel-type" id="fuel-type">
	    			<option value="gas">Gas</option>
	    			<option value="hybrid">Hybrid</option>
	    			<option value="electric">Electric</option>
	    		</select>
	    		<br><br>
	    		<label for="preowned">Pre-Owned:</label>
	    		<select name="preowned" id="preowned">
	    			<option value="yes">YES</option>
	    			<option value="no">NO</option>
	    		</select>
	    		<br><br>
	    		<label for="condition">Condition:</label>
	    		<select name="condition" id="condition">
	    			<option value="new">New</option>
	    			<option value="slighty used">Slightly Used</option>
	    			<option value="scratched">Scratched</option>
	    		</select>
	    		<br><br>
	    		<label for="fully-assembled">Fully-Assembled:</label>
	    		<select name="fully-assembled" id="fully-assembled">
	    			<option value="yes">YES</option>
	    			<option value="no">NO</option>
	    		</select>
	    		<br><br>
	    		<label for="tilt-steering">Tilt-Steering:</label>
	    		<select name="tilt-steering" id="tilt-steering">
	    			<option value="yes">YES</option>
	    			<option value="no">NO</option>
	    		</select>
	    		<br><br>
	    		<table>
					<tr>    
						<td>Miles: </td><td><input type="text" name="milenum"></td>
					</tr>
					<tr>
						<td>Color: </td><td><input type="text" name="color"></td>
					</tr>
					<tr>
						<td>Price: </td><td><input type="text" name="price"></td>
					</tr>
					<tr>
						<td>Minimum Rate: </td><td><input type="text" name="minrate"></td>
					</tr>
					<tr>
						<td>VIN: </td><td><input type="text" name="vin"></td>
					</tr>
				</table>
				<br>
				<label for="selltime">Sell Date (date and time):</label>
  				<input type="date" id="date" name="date">
  				<label for="hour">Hour:</label>
	    		<select name="hour" id="hour">
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
	    		<input type="submit" value="Submit">
    		</form>
			<%
		}
		else
		{
			if(vehicleType.equals("car"))
			{
				//HTML CODE w/ CAR OPTIONS
				%>
				<form method="get" action="selectVehicleAttributes.jsp">
		    	<label for="vehicle-type">You Selected:</label> 
	    			<select name="vehicle-type" id="vehicle-type"> 
	        			<option value="car">Car</option>   
	    			</select>
		    		<table>
						<tr>    
							<td>Make: </td><td><input type="text" name="make"></td>
						</tr>
						<tr>
							<td>Model: </td><td><input type="text" name="model"></td>
						</tr>
			
					</table>
		    		<br><br>
		    		<label for="year">Year:</label>
		    		<select name="vehicle-year" id="vehicle-year">
		    			<option value="2023">2023</option>
		    			<option value="2022">2022</option>
		    			<option value="2021">2021</option>
		    			<option value="2020">2020</option>
		    			<option value="2019">2019</option>
		    			<option value="2018">2018</option>
		    			<option value="2017">2017</option>
		    			<option value="2016">2016</option>
		    			<option value="2015">2015</option>
		    			<option value="2014">2014</option>
		    			<option value="2013">2013</option>
		    		</select>
		    		<br><br>
		    		<label for="fuel-type">Fuel Type:</label>
		    		<select name="fuel-type" id="fuel-type">
		    			<option value="gas">Gas</option>
		    			<option value="hybrid">Hybrid</option>
		    			<option value="electric">Electric</option>
		    		</select>
		    		<br><br>
		    		<label for="preowned">Pre-Owned:</label>
		    		<select name="preowned" id="preowned">
		    			<option value="yes">YES</option>
		    			<option value="no">NO</option>
		    		</select>
		    		<br><br>
		    		<label for="condition">Condition:</label>
		    		<select name="condition" id="condition">
		    			<option value="new">New</option>
		    			<option value="slgihty used">Slightly Used</option>
		    			<option value="scratched">Scratched</option>
		    		</select>
		    		<br><br>
	    			<label for="body-upgrades">Body Upgrades:</label>
	    			<select name="body-upgrades" id="body-upgrades">
	    				<option value="yes">YES</option>
	    				<option value="no">NO</option>
	    			</select>
		    		<br><br>
		    		<table>
						<tr>    
							<td>Miles: </td><td><input type="text" name="milenum"></td>
						</tr>
						<tr>
							<td>Color: </td><td><input type="text" name="color"></td>
						</tr>
						<tr>
							<td>Price: </td><td><input type="text" name="price"></td>
						</tr>
						<tr>
							<td>Minimum Rate: </td><td><input type="text" name="minrate"></td>
						</tr>
						<tr>
							<td>VIN: </td><td><input type="text" name="vin"></td>
						</tr>
					</table>
					<br>
					<label for="selltime">Sell Date (date and time):</label>
					<input type="date" id="date" name="date">
	  				<label for="hour">Hour:</label>
		    		<select name="hour" id="hour">
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
		    		<input type="submit" value="Submit">
    			</form>
				<%
			}
			else
			{
				if(vehicleType.equals("truck"))
				{
					//HTML CODE w/ TRUCK OPTIONS
					%>
					<form method="get" action="selectVehicleAttributes.jsp">
			    		<label for="vehicle-type">You Selected:</label> 
	    					<select name="vehicle-type" id="vehicle-type"> 
	        					<option value="truck">Truck</option>   
	    					</select>
			    		<table>
							<tr>    
								<td>Make: </td><td><input type="text" name="make"></td>
							</tr>
							<tr>
								<td>Model: </td><td><input type="text" name="model"></td>
							</tr>
						</table>
			    		<br><br>
			    		<label for="year">Year:</label>
			    		<select name="vehicle-year" id="vehicle-year">
			    			<option value="2023">2023</option>
			    			<option value="2022">2022</option>
			    			<option value="2021">2021</option>
			    			<option value="2020">2020</option>
			    			<option value="2019">2019</option>
			    			<option value="2018">2018</option>
			    			<option value="2017">2017</option>
			    			<option value="2016">2016</option>
			    			<option value="2015">2015</option>
			    			<option value="2014">2014</option>
			    			<option value="2013">2013</option>
			    		</select>
			    		<br><br>
			    		<label for="fuel-type">Fuel Type:</label>
			    		<select name="fuel-type" id="fuel-type">
			    			<option value="gas">Gas</option>
			    			<option value="hybrid">Hybrid</option>
			    			<option value="electric">Electric</option>
			    		</select>
			    		<br><br>
			    		<label for="preowned">Pre-Owned:</label>
			    		<select name="preowned" id="preowned">
			    			<option value="yes">YES</option>
			    			<option value="no">NO</option>
			    		</select>
			    		<br><br>
			    		<label for="condition">Condition:</label>
			    		<select name="condition" id="condition">
			    			<option value="new">New</option>
			    			<option value="slgihty used">Slightly Used</option>
			    			<option value="scratched">Scratched</option>
			    		</select>
			    		<br><br>
			    		<table>
			    			<tr>    
								<td>Storage Space (sqft): </td><td><input type="text" name="storage"></td>
							</tr>
							<tr>    
								<td>Miles: </td><td><input type="text" name="milenum"></td>
							</tr>
							<tr>
								<td>Color: </td><td><input type="text" name="color"></td>
							</tr>
							<tr>
								<td>Price: </td><td><input type="text" name="price"></td>
							</tr>
							<tr>
								<td>Minimum Rate: </td><td><input type="text" name="minrate"></td>
							</tr>
							<tr>
								<td>VIN: </td><td><input type="text" name="vin"></td>
							</tr>
						</table>
						<br>
						<label for="selltime">Sell Date (date and time):</label>
						<input type="date" id="date" name="date">
		  				<label for="hour">Hour:</label>
			    		<select name="hour" id="hour">
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
			    		<input type="submit" value="Submit">
    				</form>
					<%
				}
				else
				{
					//HTML CODE INDICATING FAILURE
					%>
						THE CODE SHOULD NEVER GET HERE!!!
					<%
				}
			}
		}
		%>
	</body>
</html>