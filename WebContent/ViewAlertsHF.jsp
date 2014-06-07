<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
 <%@ page import="javax.sql.*" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="PatientHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View and Clear Alerts</title>
<%
String message =request.getParameter("message");
if(message ==""||message==null)
message= "";
 %>
</head>
<body>
<% 
    
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797");
	Statement st1=con.createStatement();
	int pid = Integer.parseInt(request.getParameter("pid").toString());
	Statement st2 = null;
	ResultSet rs=st1.executeQuery("select a.ent_val,a.thr_val,o.ob_dto,a.a_id from alerts a, observations o where a.ob_id=o.ob_id and o.pid="+pid+"and a.alert_viewed='n'");
	String val = null;
	%>
	<%if(rs.isBeforeFirst()==false){
		out.println(message);%>
      <br/>
      <br>
      You have no alerts to be viewed.
      <% }
      else{	 
	 %>
	<div style="color:#00FF00"><%= message %></div>
	<center>
	<table>
	<tr><th>Alerts</th>
	<td></td>
	</tr>
	<% while (rs.next())
	{%>
	<tr>
	<% val=rs.getString(1);
	
	if(val.equals("temperature")){
	%>
	<td>temperature was greater than <%=rs.getString(2) %> on <%=rs.getTimestamp(3) %> </td>
	
	<%}
	if(val.equals("oxygensaturation")){
	%>
	<td>Oxygen Saturation was lesser than <%=rs.getString(2) %> on <%=rs.getTimestamp(3)%></td>
	
	<% }
	if(val.equals("pain")){
	%>
	<td>pain was greater than <%=rs.getString(2) %>/10 on <%=rs.getTimestamp(3) %> </td>
	
	<%}
	if(val.equals("contraction frequency")){
	%>
	<td>contraction frequency was greater than <%=rs.getString(2) %>/hour on <%=rs.getTimestamp(3) %> </td>
	
	<%}
	if(val.equals("systolic blood pressure")){
	%>
	<td>systolic blood pressure was greater than <%=rs.getString(2) %> on <%=rs.getTimestamp(3) %> </td>
	
	<%}
	if(val.equals("diastolic blood pressure")){
	%>
	<td>diastolic blood pressure was greater than <%=rs.getString(2) %> on <%=rs.getTimestamp(3) %> </td>
	
	<%}

	%></tr>
	<%}//while close
	}//else close%>
	</table></center>

</body>
</html>