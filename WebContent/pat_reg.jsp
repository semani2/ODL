<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	String patientName = request.getParameter("patient_name");
	String day= request.getParameter("day");
	String month = request.getParameter("month");
	String year = request.getParameter("patient_year");
	String tempDate = day+"-"+month+"-"+year;
	int age =Integer.parseInt(request.getParameter("patient_age"));
	String sex = request.getParameter("sex");
	String status = request.getParameter("public_status");
	String patient_id= request.getParameter("patient_id");
	String password = request.getParameter("patient_password");
	String street = request.getParameter("patient_street");
	String city = request.getParameter("patient_city");
	int zipcode = Integer.parseInt(request.getParameter("patient_zipcode"));
	String state = request.getParameter("patient_state");
	String country = request.getParameter("patient_country");
	int pc_id = 5;
	
	// JDBC CONNECTION
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797");  
	// Creating a prepared statement for inserting into patients table
	// Checking if user already exists
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from patients where patientid='"+patient_id+"'");
	if(rs.next() == true)
	{
	rs.close();
		String message="ID already taken !";
		response.sendRedirect("PatientRegistration.jsp?error="+message);
	}
	else
	{
	 Statement st1 = con.createStatement();
	 int i= st1.executeUpdate("insert into patients(pname,pdob,psex,p_pubstatus,p_password,p_street,p_city,p_state,p_country,p_zipcode,p_age,patientid) values('"+patientName+"','"+tempDate+"','"+sex+"','"+status+"','"+password+"','"+street+"','"+city+"','"+state+"','"+country+"',"+zipcode+","+age+",'"+patient_id+"')");
	 rs.close();
	 Statement st2= con.createStatement();
	 rs=st2.executeQuery("select pid from patients where patientid='"+patient_id+"'");
	 rs.next();
	 int pid = rs.getInt(1);
	 rs.close();
	 session.setAttribute("pid",pid);
	 session.setAttribute("patient_name",patientName);
	 session.setAttribute("patient_class",pc_id);
	 response.sendRedirect("PatientHome.jsp");
	
	}
	
	 %>

</body>
</html>