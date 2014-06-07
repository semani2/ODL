<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
 <%@ page import="javax.sql.*" %>
 <%@ page import="java.io.*,java.util.*" %>

<%@ page import= "java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="PatientHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%
	// JDBC CONNECTION
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797");  
	Statement st = con.createStatement();
	ResultSet rs1 = st.executeQuery("select * from "+request.getParameter("obs_name")+"_type");
	ResultSetMetaData rsmd = rs1.getMetaData();
	String att_name = rsmd.getColumnName(2);
	String observation_name = request.getParameter("obs_name");
	//session.setAttribute("obs_name",observation_name);
	
 %>
 <h2><center> Make your <%=request.getParameter("obs_name") %> observation</center></h2>
<form name="form1" action="AddCustomObservation.jsp?obs_name=<%= request.getParameter("obs_name")%>" method="post">
	
<%=att_name %> <input type="text" name="obs_made"/><br/><br/>

Date of observation: <input type="text" name="obv_day" size="4" />
		<select name="obv_month">
				<option value="000">Select one</option>
		
		<option value="jan">January</option>
<option value="feb">February</option>
<option value="mar">March</option>
<option value="apr">April</option>
<option value="may">May</option>
<option value="jun">June</option>
<option value="jul">July</option>
<option value="aug">August</option>
<option value="sep">September</option>
<option value="oct">October</option>
<option value="nov">November</option>
<option value="dec">December</option>
		</select>
		<input type="text" name="obv_year" size=5 />(DD:MM:YYYY)<br/><br/>

Time of observation:<input type="text" name="obv_hr" size="4" />
                    <input type="text" name="obv_min" size="4" />
                    <input type="text" name="obv_sec" size="4" /><select name="obv_ampm">
				<option value="000">Select one</option>
				<option value="AM">AM</option>
				<option value="PM">PM</option>
		</select>(HH:MM:SS)

<br/><br/><br/>
<input type="submit" value="Submit observation"/><br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/><br/><br/>

<a href="newobservation.jsp">Back to observation types</a>


</form>

</body>
</html>