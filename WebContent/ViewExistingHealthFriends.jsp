<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@page import="java.sql.*" %>
    <%@page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="PatientHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Health Friends !</title>
</head>
<body>
<center>
<h2>My Health Friends</h2>

<% 
int pid1=Integer.parseInt(session.getAttribute("pid").toString());

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797");

Statement st1=con.createStatement();



ResultSet rs=st1.executeQuery("select p.pname,p.pid from patients p where p.pid IN((select DISTINCT h.pid_2 from healthfriends h where h.pid_1="+pid1+")UNION(select DISTINCT h.pid_1 from healthfriends h where h.pid_2="+pid1+"))");

//ResultSet rs=st1.executeQuery("select p.pname,p.pid from patients p where p.pid IN((select DISTINCT h.pid_2 from healthfriends h where h.pid_1=64)UNION(select DISTINCT h.pid_1 from healthfriends h where h.pid_2=64));");

%>

 <table border=1>
 <tr>
 <td>Name</td>
 </tr>

<% 
while(rs.next())
{
 %>
 <tr>
 <td><a href="ViewAHealthFriend.jsp?id=<%=rs.getInt(2) %>&name=<%= rs.getString(1) %>"><%= rs.getString(1) %></a></td>
 </tr>
<%} %>

 
</table>




</center>
</body>
</html>