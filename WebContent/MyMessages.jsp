<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="PatientHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Messages</title>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797"); 
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	Statement st3 = con.createStatement();
	String val = null;
	String sender = null;
	int count_of_messages = 0;
	ResultSet rs1,rs2,rs3 = null;
	int pid = Integer.parseInt(session.getAttribute("pid").toString());
	rs1 = st1.executeQuery("select count(*) from messages where receiver_pid="+pid+" and message_viewed='n'");
	rs1.next();
	count_of_messages = rs1.getInt(1);
	rs1.close();
	Integer r_pid = 0;
	%>
	<br/><br/>
	<h3>You have <%=count_of_messages %> new message(s)</h3>
	
	<%
		if(count_of_messages > 0 )
		{// Display the messages 
		rs1 = st1.executeQuery("select message_id,sender_pid,message from messages where receiver_pid="+pid+" and message_viewed='n'");
		%>
			<table>
				<%
					while(rs1.next())
					{
						// Application message handling
						r_pid = rs1.getInt(2);
						if(r_pid == 0)
						{
							sender = "Application";
						}
						else
						{
						rs2 = st2.executeQuery("select pname from patients where pid="+rs1.getInt(2)+"");
						rs2.next();
						sender = rs2.getString(1);
						rs2.close();
						} %>
						<tr>
							<td><%=sender %> :  </td>
							<td><%=rs1.getString(3) %></td>
							<td><a href="ClearMessage.jsp?message_id=<%= rs1.getInt(1) %>">Clear</a></td>
						</tr>
					<%}
					rs1.close();
				 %>			
			</table>
		<%}
	
	%>
</body>
</html>