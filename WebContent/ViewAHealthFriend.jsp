<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="PatientHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View A health friend</title>
</head>
<body>
	<% 
// JDBC CONNECTION
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797");  
	int pid = Integer.parseInt(request.getParameter("id").toString());
	String pname = request.getParameter("name").toString();
	
	%>
	<center>
		<a href="view_patient_by_name_pat.jsp?pat_name=<%=pname %>">View Observations of <%= pname %></a><br/>
		<a href="ViewAlertsHF.jsp?pid=<%= pid %>">View alerts of <%= pname %></a><br/>
	</center>
	
</body>
</html>