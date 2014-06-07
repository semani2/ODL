<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%@ page import="java.io.*,java.util.*" %>
        <%@ page import= "java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% int pid1=Integer.parseInt(session.getAttribute("pid").toString());

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797"); 
	int pid2 = Integer.parseInt(request.getParameter("pid"));
	
	java.util.Date dNow = new java.util.Date();
	SimpleDateFormat tft = new SimpleDateFormat("dd-MMM-yyyy");
	String date_of_friendship= tft.format(dNow).toString();
//	out.println(pid1+"   "+pid2);
	Statement st  =con.createStatement();
	int hs_id = 2;
	st.executeUpdate("insert into healthfriends(pid_1,pid_2,hf_dt,hs_id) values("+pid1+","+pid2+",'"+date_of_friendship+"',"+hs_id+")");
	st.close();
	con.close();
	response.sendRedirect("NewHealthFriend.jsp");
	%>

</body>
</html>