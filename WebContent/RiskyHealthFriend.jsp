<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="PatientHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Health Friends at risk</title>
<%
String message = request.getParameter("message");
String error = request.getParameter("error");
if(message == "" || message == null)
message = "";
if(error == "" || error == null)
error = "";
 %>
</head>
<body>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797"); 
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	Statement st3 = con.createStatement();
	String val = null;
	ResultSet rs2,rs3 = null;
	int counter = 0;
	int flag =0;
	int no_hf =0;
	// Query to get all health friends
	int pid1 = Integer.parseInt(session.getAttribute("pid").toString());
	ResultSet rs1 = st1.executeQuery("select p.pid,p.pname from patients p where p.pid IN((select DISTINCT h.pid_2 from healthfriends h where h.pid_1="+pid1+")UNION(select DISTINCT h.pid_1 from healthfriends h where h.pid_2="+pid1+"))");
	%>
	<br/><br/>
	<div style="color:#FF0000"><%= error %></div>
	<div style="color:#00FF00"><%= message %></div>
	<% if(rs1.isBeforeFirst() == false)
	{
		//No health friends
		%>
		<br/><br/>
		<center><h4>No health friends at risk !</h4></center>
	<% }
	else
	{
		// Health Friends are present
		while(rs1.next()){
		no_hf ++;
			int pid = rs1.getInt(1);
			rs2 = st2.executeQuery("select count(a.a_id) from alerts a where a.pid="+pid+" and a.alert_viewed='n'");
			rs2.next();
			if(rs2.getInt(1) >5 )
			{
				rs3 = st3.executeQuery("select a.a_id,a.ent_val,a.thr_val from alerts a where a.pid="+pid+" and a.alert_viewed='n'");
				// Has 5 unviewed alert and he is a health friend at risk
				%>
				
				<h3>Your Friend <%=rs1.getString(2) %> is at Risk</h3> <br/>
				
				<table> 
					<% while (rs3.next())
	{
	counter++;
	%>
	<tr>
	<% val=rs3.getString(2);
	
	if(val.equals("temperature")){
	%>
	<td>Temperature was greater than <%=rs3.getString(3) %> </td>
	
	<%}
	if(val.equals("oxygensaturation")){
	%>
	<td>Oxygen Saturation was lesser than <%=rs3.getString(3) %></td>
	
	<% }
	if(val.equals("pain")){
	%>
	<td>pain was greater than <%=rs3.getString(3) %>/10</td>
	
	<%}
	if(val.equals("contraction frequency")){
	%>
	<td>contraction frequency was greater than <%=rs3.getString(3) %>/hour  </td>
	
	<%}
	if(val.equals("systolic blood pressure")){
	%>
	<td>systolic blood pressure was greater than <%=rs3.getString(3) %> </td>
	
	<%}
	if(val.equals("diastolic blood pressure")){
	%>
	<td>diastolic blood pressure was greater than <%=rs3.getString(3) %> </td>

	<%}

	%></tr>
	<%}//while close%>
	
				</table><br/>
				<button><a href="SendMessage.jsp?receiver=<%= pid %>&count=<%= counter %>&rec_name=<%= rs1.getString(2) %>">Send Message</a></button><br/>
				------------------------------------------------------------------------------------
				<%
				
			}
			else
			{
			flag++;
			continue;
			}	
		}
		if(flag == no_hf)
		{%>
			<h3>No health Friends at risk</h3>
		<%}
	}
 %>
</body>
</html>