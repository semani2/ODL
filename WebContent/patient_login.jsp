<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<% 
// JDBC CONNECTION
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797");  
//Requesting for email and password
	String patient_id= request.getParameter("patient_id");
	String user_password = request.getParameter("patient_password");
	String password = "";
	String patient_name = "";
	String patient_class="";
	int pc_id= 0;
	int pid=0;
	// Performing authentication
	Statement st1 = con.createStatement();
	ResultSet rs = st1.executeQuery("select * from patients where patientid='"+patient_id+"'");
	// If user exists verify password
	if(rs.next() == true)
	{
		rs.close();
		// Verifying password of user
		Statement st2 = con.createStatement();
		rs = st2.executeQuery("select p_password,pname,pid from patients where patientid='"+patient_id+"'");
		while(rs.next())
		{
			password = rs.getString(1);
			patient_name = rs.getString(2);
			
			pid = rs.getInt(3);
		}
		if(user_password.equals(password))
		{
			rs.close();
			// Correct password
			// first getting the patient class name from patient class table
			
			rs.close();
			session.setAttribute("pid",pid);
			session.setAttribute("patient_name",patient_name);
			
			response.sendRedirect("PatientHome.jsp");
		}
		else
		{
		rs.close();
		//Incorrect password
			String message = "Incorrect Password";
			response.sendRedirect("ODLhomepage.jsp?error="+message);
	 	}
	}
	// No such user exists
	else
	{ 
	rs.close();
			String message = "No user with Patient ID : "+patient_id;
			response.sendRedirect("ODLhomepage.jsp?error="+message);
	}
%>
</body>
</html>