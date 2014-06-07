<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="PatientHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br/>
<br/>

<% int pid1=Integer.parseInt(session.getAttribute("pid").toString());

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797");

Statement st1=con.createStatement();

ResultSet rs1=st1.executeQuery("select p.pname,p.psex,p.p_city,p.patientid,p.pid from patients p where p.p_pubstatus='y' AND p.pid IN(select DISTINCT p1.pid from patient_belongs_to_class p1 where p1.pc_id<>5 and p1.pid NOT IN((select DISTINCT h.pid_2 from healthfriends h where h.pid_1="+pid1+") UNION(select DISTINCT h.pid_1 from healthfriends h where h.pid_2="+pid1+")) AND p1.pid!="+pid1+" AND p1.pc_id IN(Select p2.pc_id from patient_belongs_to_class p2 where p1.pc_id<>5 and p2.pid="+pid1+"))");
Integer pid = new Integer(0);
String tag_pid = null;
%>
<table align="center">
<tr>
	<th>Name</th>
	<th>Sex</th>
	<th>City</th>
	<th>ID</th>
	<th></th>
</tr>
<% while(rs1.next())
{%>
<tr>
	<td><%=rs1.getString(1) %></td>
	<td><%=rs1.getString(2) %></td>
	<td><%=rs1.getString(3) %></td>
	<td><%=rs1.getString(4) %></td>
	
	<td><a href="add_health_friend.jsp?pid=<%= rs1.getString(5) %>">Add</a></td>
	
</tr>




<%}%>
</table>
<br/>
<br/>
<center><button><a href="ManageHealthFriends.jsp">Back</a></button></center>
</body>
</html>