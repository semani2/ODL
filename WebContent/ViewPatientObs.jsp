<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="HealthProfHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Patient by Observation</title>
</head>
<body>
<%
	String error=request.getParameter("error");
	if(error==null || error=="null"){
 	error="";
 	}
 %>



<% 
// JDBC CONNECTION
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797");  %>
	<h3>View Patient By Observation type</h3>
	<br/>
	<form name= "form1" action="view_patient_by_obs.jsp" method="post">
	Select observation type : <select name="obs_type">
		<option value="null">Select</option>
	<% Statement st1= con.createStatement();
	   ResultSet rs1 = st1.executeQuery("select ot_id,ot_name from observationtype");
	   while(rs1.next())
	   {%>
	   		<option value="<%= rs1.getInt(1) %>"><%= rs1.getString(2) %></option>
	   
	  <%
	    }
	  rs1.close();
	 %>
	
	
	</select>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Search"/>
	</form><br/>
	<div><%= error %></div>
	
	
	
</body>
</html>