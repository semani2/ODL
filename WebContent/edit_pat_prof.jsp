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
<% Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797"); 
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	int pid1= Integer.parseInt(session.getAttribute("pid").toString());
	ResultSet rs1 = st1.executeQuery("select p.p_password from patients p where pid="+pid1+"");
	rs1.next();
	
	String password = rs1.getString(1);
	rs1.close();
	String old_password = request.getParameter("old_password");
	String new_password= request.getParameter("new_password");
	String con_password = request.getParameter("con_password");
	int pid =Integer.parseInt(session.getAttribute("pid").toString());
	if(new_password.equals(con_password))
	{
	// Check if old password is matching
	if(old_password.equals(password))
	{
	// Update profile
	st2.executeUpdate("update patients set p_password='"+new_password+"' where pid="+pid+"");
	response.sendRedirect("EditProfile.jsp?error=Password Updated Successfully !");
	}
	else
	{
		response.sendRedirect("EditProfile.jsp?error=Old Password incorrect");
	}
	}
	else
	{
		response.sendRedirect("EditProfile.jsp?error=Confirm Password not matching");	
	}
	
	 %>
</body>
</html>