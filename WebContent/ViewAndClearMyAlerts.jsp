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
	int id=Integer.parseInt(session.getAttribute("pid").toString());
	ResultSet rs=st1.executeQuery("select a.ent_val,a.thr_val,o.ob_dto,a.a_id from alerts a, observations o where a.ob_id=o.ob_id and o.pid="+id+"and a.alert_viewed='n'");
	String val = null;
	%>
	<%if(rs.isBeforeFirst()==false){
		out.println(message);
      out.println("You have no alerts to be viewed");
      }
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
	<td>Your temperature was greater than <%=rs.getString(2) %> on <%=rs.getTimestamp(3) %> </td>
	<td><a href="ClearMyAlert.jsp?aid=<%=rs.getInt(4)%>">Clear</a></td>
	<%}
	if(val.equals("oxygensaturation")){
	%>
	<td>Your Oxygen Saturation was lesser than <%=rs.getString(2) %> on <%=rs.getTimestamp(3)%></td>
	<td><a href="ClearMyAlert.jsp?aid=<%=rs.getInt(4)%>">Clear</a></td>
	<% }
	if(val.equals("pain")){
	%>
	<td>Your pain was greater than <%=rs.getString(2) %>/10 on <%=rs.getTimestamp(3) %> </td>
	<td><a href="ClearMyAlert.jsp?aid=<%=rs.getInt(4)%>">Clear</a></td>
	<%}
	if(val.equals("contraction frequency")){
	%>
	<td>Your contraction frequency was greater than <%=rs.getString(2) %>/hour on <%=rs.getTimestamp(3) %> </td>
	<td><a href="ClearMyAlert.jsp?aid=<%=rs.getInt(4)%>">Clear</a></td>
	<%}
	if(val.equals("systolic blood pressure")){
	%>
	<td>Your systolic blood pressure was greater than <%=rs.getString(2) %> on <%=rs.getTimestamp(3) %> </td>
	<td><a href="ClearMyAlert.jsp?aid=<%=rs.getInt(4)%>">Clear</a></td>
	<%}
	if(val.equals("diastolic blood pressure")){
	%>
	<td>Your diastolic blood pressure was greater than <%=rs.getString(2) %> on <%=rs.getTimestamp(3) %> </td>
	<td><a href="ClearMyAlert.jsp?aid=<%=rs.getInt(4)%>">Clear</a></td>
	<%}

	%></tr>
	<%}//while close
	}//else close%>
	</table></center>

</body>
</html>