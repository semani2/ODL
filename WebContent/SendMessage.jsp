<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797"); 
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	Statement st3 = con.createStatement();
	String val = null;
	String rec_name = request.getParameter("rec_name").toString();
	ResultSet rs1,rs2,rs3 = null;
	// Query to get all health friends
	int sender = Integer.parseInt(session.getAttribute("pid").toString()); 
	int receiver = Integer.parseInt(request.getParameter("receiver").toString());
	//
	int message_id =0;
	
	int count = Integer.parseInt(request.getParameter("count").toString());
	String message = "You have "+count+" alerts pending. Please view and clear them.";
	//
	rs1 = st1.executeQuery("select max(message_id) from messages");
	if(rs1.isBeforeFirst() == false)
	{   // First entry in messages table
		message_id = 1;
	}
	else
	{ // increment message_id counter
		rs1.next();
		message_id = rs1.getInt(1);
		rs1.close();
		message_id++;
	}
	// insert into messages table
	int i = st1.executeUpdate("insert into messages values("+message_id+","+sender+","+receiver+",'"+message+"','n')");
	if(i!=0)
	response.sendRedirect("RiskyHealthFriend.jsp?message=Your message to "+rec_name+" has been sent.");
	else
	response.sendRedirect("RiskyHealthFriend.jsp?error=Your message to "+rec_name+" has not been sent. Please try again");
	%>
</body>
</html>