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
<title>Insert title here</title>
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
	//Inserting into observations table and into the required custom table
	String obs_made = request.getParameter("obs_made"); // attribute
	int id=Integer.parseInt(session.getAttribute("pid").toString());
	String date_o=request.getParameter("obv_day")+""+request.getParameter("obv_month")+""+request.getParameter("obv_year");
    String time_o=request.getParameter("obv_hr")+":"+request.getParameter("obv_min")+":"+request.getParameter("obv_sec")+" "+request.getParameter("obv_ampm");
   	String dt_o=date_o+" "+time_o;
   	// get ot_id of the custom type
   	String obs_name = request.getParameter("obs_name").toString();//observation type
   //	out.println(obs_name);
   	
   	//session.removeAttribute("obs_name");
   	//get attribute name
   	int primary_key =0; 
   	ResultSet rs1 = st1.executeQuery("select * from "+obs_name+"_type");
	ResultSetMetaData rsmd = rs1.getMetaData();
	String col_name = rsmd.getColumnName(2);
	rs1.close();
   	rs1 = st1.executeQuery("select ot_id from observationtype where ot_name='"+obs_name+"'");
   	rs1.next();
   	int ot_id = rs1.getInt(1);
   	rs1.close();
   	//get previous id and increment
   	rs1 = st1.executeQuery("select max("+obs_name+"_id) from "+obs_name+"_type");
   	if(rs1.isBeforeFirst() == false)
   	{
   		primary_key = 1;
   	}
   	else
   	{
   		rs1.next();
   		primary_key = rs1.getInt(1);
   		primary_key++;
   	}
   	
   	
   	st1.executeUpdate("INSERT INTO observations(ot_id,pid,ob_dto,ob_dtr) VALUES("+ot_id+","+id+",'"+dt_o+"','"+dt_r+"')");
   	ResultSet rs=st3.executeQuery("SELECT ob_id from observations where ob_dtr='"+dt_r+"' AND pid="+id+"");
	rs.next();
	st3.executeUpdate("INSERT INTO "+obs_name+"_type("+obs_name+"_id,ot_id,"+col_name+",ob_id) VALUES ("+primary_key+","+ot_id+","+obs_made+","+rs.getInt(1)+")");
	rs.close();
	response.sendRedirect("newobservation.jsp?message=Observation has been recorded successfully!");
	
	
	
	
%>
</body>
</html>