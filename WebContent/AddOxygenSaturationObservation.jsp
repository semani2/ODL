<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="javax.sql.*" %>
 <%@ page import="java.io.*,java.util.*" %>

<%@ page import= "java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Weight Observation</title>
</head>
<body>

<% //date and time of recording in format 
	java.util.Date dNow = new java.util.Date();
	SimpleDateFormat tft = new SimpleDateFormat ("dd-MMM-yyyy");
   	SimpleDateFormat dft =  new SimpleDateFormat ("hh:mm:ss a");
    String dt_r = tft.format(dNow).toString()+" "+dft.format(dNow).toString();

//db driver and connection

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797"); 
	Statement st1=con.createStatement(); 
	Statement st2=con.createStatement();
	Statement st3=con.createStatement();

	
//Adding observation into observations and oxygen-saturation table
	
	float x=Float.parseFloat(request.getParameter("os_amt"));
	int id=Integer.parseInt(session.getAttribute("pid").toString());
	String date_o=request.getParameter("obv_day")+""+request.getParameter("obv_month")+""+request.getParameter("obv_year");
    String time_o=request.getParameter("obv_hr")+":"+request.getParameter("obv_min")+":"+request.getParameter("obv_sec")+" "+request.getParameter("obv_ampm");
   	String dt_o=date_o+" "+time_o;
	st1.executeUpdate("INSERT INTO observations(ot_id,pid,ob_dto,ob_dtr) VALUES(6,"+id+",'"+dt_o+"','"+dt_r+"')");
	ResultSet rs=st3.executeQuery("SELECT ob_id from observations where ob_dtr='"+dt_r+"' AND pid="+id+"");
	rs.next();
	st3.executeUpdate("INSERT INTO oxygensaturation(ot_id,os_amt,ob_id) VALUES (6,"+x+","+rs.getInt(1)+")");
	response.sendRedirect("newobservation.jsp?message=Observation has been recorded successfully!");

 %>

</body>
</html>