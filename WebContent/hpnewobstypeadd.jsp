<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
// JDBC CONNECTION
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797");  
	String newtype_name = request.getParameter("nt_type").replaceAll(" ","_");
	String newtype_att = request.getParameter("nt_amt").replaceAll(" ","_");
	int newtype_cat = Integer.parseInt(request.getParameter("nt_cat"));
	int newtype_class = Integer.parseInt(request.getParameter("illness"));
	//out.println(newtype_name+" "+newtype_att+" "+newtype_cat+" "+newtype_illness);
	// Checking if observation type already exists
	Statement st3 = con.createStatement();
	ResultSet rs2 = st3.executeQuery("select * from observationtype where ot_name='"+newtype_name+"'");
	if(rs2.next() == true)
	{
		response.sendRedirect("NewObservationTypeHealthProf.jsp?error="+newtype_name+" already exists");
	}
	else
	{
	// Inserting into observation type table
	//Retrieving last primary key ot_id and increment by one
	int ot_id = 0;
	Statement st1 = con.createStatement();
	ResultSet rs1 = st1.executeQuery("select max(ot_id) from observationtype");
	rs1.next();
	ot_id = rs1.getInt(1)+1; // New ot_id
	rs1.close();
	Statement st2 = con.createStatement();
	st2.executeUpdate("insert into observationtype values("+ot_id+",'"+newtype_name+"',"+newtype_cat+")");
	// creating new table
	Statement st4 = con.createStatement();
	st4.executeUpdate("create table "+newtype_name+"_type("+newtype_name+"_id number,"+newtype_att+" varchar2(30),ob_id number,ot_id number,primary key("+newtype_name+"_id,ob_id),foreign key(ob_id) references observations(ob_id),foreign key(ot_id) references observationtype(ot_id))");
	// Type belonging to class
	Statement st5 = con.createStatement();
	st5.executeUpdate("insert into type_belongs_to_class values("+ot_id+","+newtype_class+")");
	response.sendRedirect("NewObservationTypeHealthProf.jsp?message="+newtype_name+" has been added !");
	}
	%>
</body>
</html>