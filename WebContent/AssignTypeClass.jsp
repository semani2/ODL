<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="HealthProfHeader.jsp"%>
<%
String error=request.getParameter("error");
if(error==null || error=="null"){
 error="";
}
String message=request.getParameter("message");
if(message==null || message=="null"){
 message="";
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign types to Classes</title>
</head>
<body>
	<h4>Assigning types to Illness</h4>
	<br/>
	<form name="form1" action="assigntype.jsp" method="post">
	<% 
// JDBC CONNECTION
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797");  %>
	<br/>
	<div style="color:#FF0000"><%=error%></div><div style="color:#00FF00"><%=message%></div><br/>
	Observation Type : <select name="obs_type">
	<option value="null">Select</option>
	<% Statement st1= con.createStatement();
	   ResultSet rs1 = st1.executeQuery("select ot_id,ot_name from observationtype");
	   while(rs1.next())
	   {%>
	   		<option value="<%= rs1.getInt(1) %>"><%= rs1.getString(2) %></option>
	   
	  <%  }
	  rs1.close();
	 %>
	
	
	</select>
	<br/>
	Illness : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<select name="illness">
		<option value="null">Select</option>
		<% 
			Statement st2= con.createStatement();
	   		ResultSet rs2 = st2.executeQuery("select pc_id,pc_name from patientclass");
	   		while(rs2.next())
	   		{ %>
	   		
	   			<option value="<%= rs2.getInt(1) %>"><%= rs2.getString(2) %></option>
	   		
		<% }
			rs2.close();
		
		%>
	</select>
	<br/><br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Assign"/>
</form>
</body>
</html>