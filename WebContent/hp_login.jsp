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
	String hpid= request.getParameter("hpid");
	String user_password = request.getParameter("hp_password");
	String password = "";
	String professional_name = "";
	int prof_id = 0;
	// Performing authentication
	Statement st1 = con.createStatement();
	ResultSet rs = st1.executeQuery("select * from healthprofessionals where healthproid='"+hpid+"'");
	// If user exists verify password
	if(rs.next() == true)
	{
		rs.close();
		// Verifying password of user
		Statement st2 = con.createStatement();
		rs = st2.executeQuery("select hp_password,hp_name,hp_id from healthprofessionals where healthproid='"+hpid+"'");
		while(rs.next())
		{
			password = rs.getString(1);
			professional_name = rs.getString(2);
			prof_id = rs.getInt(3);
		}
		if(password.equals(user_password)) // Comparing passwords
		{
			// Correct password
			session.setAttribute("professional_name",professional_name);
			session.setAttribute("professional_id",prof_id);
			//out.println(hpid+"  "+user_password+"  "+password+"   "+professional_name);
			response.sendRedirect("HealthProfHome.jsp");
		}
		else
		{
		//Incorrect password
			String message = "Incorrect Password";
			response.sendRedirect("ODLhomepage2.jsp?error="+message);
			//out.println(message+"     "+user_password+"  "+password+"   "+professional_name);
	 	}
	}
	// No such user exists
	else
	{ 
			String message = "No user with  ID :"+hpid;
			//out.println(message+"     "+user_password+"  "+password+"   "+professional_name);
			response.sendRedirect("ODLhomepage2.jsp?error="+message);
	}
%>
</body>
</html>