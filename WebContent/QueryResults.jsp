<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Query Results</title>
</head>
<body>
<% Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797"); 
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	Statement st3 = con.createStatement(); 
	ResultSet rs1,rs2,rs3,rs4 = null;
	int query_no = Integer.parseInt(request.getParameter("query_no").toString());
	switch(query_no)
	{
		case 1:
		rs1= st1.executeQuery("select distinct p.pname,w1.w_amt from patients p,observations o,patient_belongs_to_class pb,weight w1 where p.pid=o.pid and o.ob_id=w1.ob_id and p.pid=pb.pid and pb.pc_id=1 and w1.w_amt=(select min(w.w_amt) from weight w,observations o,patient_belongs_to_class p1 where p1.pc_id=1 AND p1.pid=o.pid AND w.ob_id=o.ob_id)");
		if(rs1.isBeforeFirst() == false)
		{%>
			<br/><br/>
			<h3>Sorry no related observations have been made</h3>
		<%}	
		else
		{%>
		<table border="1" bordercolor="blue" cellpadding="2" cellspacing="1">
		<tr>
			<th>Patient Name</th>
			<th>Weight</th>
		</tr>
		<% 
			while(rs1.next())
			{%>
				<tr>
					<td><%=rs1.getString(1) %></td>
					<td><%= rs1.getInt(2) %></td>
				</tr>
					
		 <% }
		 rs1.close();
		%>
		</table>
		
		
	<%	}
		break;
		case 2:
		rs1 = st1.executeQuery("select distinct p.pname,bp.bp_sys,bp.bp_dia from patients p,observations o,patient_belongs_to_class pb,bloodpressure bp where p.pid=o.pid and o.ob_id=bp.ob_id and p.pid=pb.pid and (pb.pc_id=2 OR pb.pc_id=3) and bp.bp_sys=(select max(bp.bp_sys) from bloodpressure bp,observations o,patient_belongs_to_class p1 where (p1.pc_id=2 OR p1.pc_id=3) AND p1.pid=o.pid AND bp.ob_id=o.ob_id)");
		if(rs1.isBeforeFirst() == false)
		{%>
			<br/><br/>
			<h3>Sorry no related observations have been made</h3>
		<%}
		else
		{%>
		<table border="1" bordercolor="blue" cellpadding="2" cellspacing="1">
		<tr>
			<th>Patient Name</th>
			<th>Systolic</th>
			<th>Diastolic</th>
		</tr>
		<% 
			while(rs1.next())
			{%>
				<tr>
					<td><%=rs1.getString(1) %></td>
					<td><%= rs1.getInt(2) %></td>
					<td><%= rs1.getInt(3) %></td>
				</tr>
					
		 <% }
		 rs1.close();
		%>
		</table>
		
		
	<% }
		break;
		case 3:
		rs1 = st1.executeQuery("select p.pname,p.pid from patients p where p.pid IN((select DISTINCT h.pid_2 from healthfriends h where h.pid_1 IN(SELECT distinct a.pid FROM alerts a WHERE a.alert_viewed='y' AND a.pid NOT IN(SELECT distinct a1.pid FROM alerts a1 WHERE a1.alert_viewed='n')))UNION(select DISTINCT h.pid_1 from healthfriends h where h.pid_2 IN(SELECT distinct a.pid FROM alerts a WHERE a.alert_viewed='y' AND a.pid NOT IN(SELECT distinct a1.pid FROM alerts a1 WHERE a1.alert_viewed='n'))))");
		if(rs1.isBeforeFirst() == false)
		{%>
			<br/><br/>
			<h3>Sorry no related observations have been made</h3>
		<%}
		else
		{%>
		<table border="1" bordercolor="blue" cellpadding="2" cellspacing="1">
		<tr>
			<th>Patient Name</th>
			<th>Patient ID</th>
			
		</tr>
		<% 
			while(rs1.next())
			{%>
				<tr>
					<td><%=rs1.getString(1) %></td>
					<td><%= rs1.getInt(2) %></td>
				
				</tr>
					
		 <% }
		 rs1.close();
		%>
		</table>
		
		
	<% }
		break;
		
		case 4:
		String pat_name = request.getParameter("pat_name").toString();
		rs1 = st1.executeQuery("select pid from patients where pname='"+pat_name+"'");
		rs1.next();
		int pid = rs1.getInt(1);
		rs1.close();
		rs1 = st1.executeQuery("select p1.pid,p1.pname,p1.p_city from patients p1 where p1.p_city IN(select p.p_city from patients p where p.pid="+pid+") AND p1.pid IN((select hf.pid_1 from healthfriends hf where hf.pid_2="+pid+")UNION(select hf.pid_2 from healthfriends hf where hf.pid_1="+pid+"))");
		if(rs1.isBeforeFirst() == false)
		{%>
			<br/><br/>
			<h3>Sorry no related observations have been made</h3>
		<%}
		else
		{%>
		<table border="1" bordercolor="blue" cellpadding="2" cellspacing="1">
		<tr>
			<th>Patient ID</th>
			<th>Patient Name</th>
			<th>Patient City</th>
		</tr>
		<% 
			while(rs1.next())
			{%>
				<tr>
					<td><%=rs1.getInt(1) %></td>
					<td><%= rs1.getString(2) %></td>
					<td><%= rs1.getString(3) %></td>
				</tr>
					
		 <% }
		 rs1.close();
		%>
		</table>
		
		
	<% }
	break;	
	case 5 :
	String pat_name1 = request.getParameter("pat_name").toString();
		rs1 = st1.executeQuery("select pid from patients where pname='"+pat_name1+"'");
		rs1.next();
		int pid1 = rs1.getInt(1);
		rs1.close();
		rs1= st1.executeQuery("select distinct p.pname,hf.hf_dt from healthfriends hf inner join patients p ON p.pid=hf.pid_1 AND p.pid<>"+pid1+" OR p.pid=hf.pid_2 AND p.pid<>"+pid1+" where hf.pid_1="+pid1+" OR hf.pid_2="+pid1+" order by hf.hf_dt desc");
	if(rs1.isBeforeFirst() == false)
		{%>
			<br/><br/>
			<h3>Sorry no related observations have been made</h3>
		<%}
		else
		{%>
		<table border="1" bordercolor="blue" cellpadding="2" cellspacing="1">
		<tr>
			<th>HealthFriend Name</th>
			<th>Date</th>
			
		</tr>
		<% 
			while(rs1.next())
			{%>
				<tr>
					<td><%=rs1.getString(1) %></td>
					<td><%= rs1.getString(2) %></td>
					
				</tr>
					
		 <% }
		 rs1.close();
		%>
		</table>
		
		
	<% }
	break;
	case 6:
	rs1= st1.executeQuery("select p.pid,p.pname,count(distinct h.hf_id) from patients p,healthfriends h where p.pid IN (select pid from patients p) and(h.pid_1=p.pid or h.pid_2=p.pid) and h.hf_dt between CURRENT_DATE-30 and CURRENT_DATE group by p.pid,p.pname");
	if(rs1.isBeforeFirst() == false)
		{%>
			<br/><br/>
			<h3>Sorry no related observations have been made</h3>
		<%}
		else
		{%>
		<table border="1" bordercolor="blue" cellpadding="2" cellspacing="1">
		<tr>
			<th>Patient ID</th>
			<th>Patient Name</th>
			<th>No of health Friends</th>
		</tr>
		<% 
			while(rs1.next())
			{%>
				<tr>
					<td><%=rs1.getInt(1) %></td>
					<td><%= rs1.getString(2) %></td>
					<td><%=rs1.getInt(3) %></td>
				</tr>
					
		 <% }
		 rs1.close();
		%>
		</table>
		
		
	<% }
	break;
	case 7:
	rs1= st1.executeQuery("select p.pname,t.ot_id,t.ot_name,count(o.ob_id) from observations o,patients p,observationtype t where o.pid=p.pid and o.ot_id=t.ot_id group by p.pid,p.pname,t.ot_id,t.ot_name");
	if(rs1.isBeforeFirst() == false)
		{%>
			<br/><br/>
			<h3>Sorry no related observations have been made</h3>
		<%}
		else
		{%>
		<table border="1" bordercolor="blue" cellpadding="2" cellspacing="1">
		<tr>
			
			<th>Patient Name</th>
			<th>Observation_Type ID</th>
			<th>Observation Type</th>
			<th>Number of observations</th>
		</tr>
		<% 
			while(rs1.next())
			{%>
				<tr>
					
					<td><%= rs1.getString(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					<td><%= rs1.getString(3) %></td>
					<td><%=rs1.getInt(4) %></td>
				</tr>
					
		 <% }
		 rs1.close();
		%>
		</table>
		
		
	<% }
	break;
	case 8:
	rs1= st1.executeQuery("select p.pid,p.pname as Patient_Name,p1.pid,p1.pname as Health_Friend,count(a.a_id) from patients p,patients p1,healthfriends h left outer join alerts a on h.pid_2=a.pid where h.pid_1=p.pid and h.pid_2=p1.pid and a.alert_viewed='n' group by p.pid,p.pname,p1.pid,p1.pname");
	if(rs1.isBeforeFirst() == false)
		{%>
			<br/><br/>
			<h3>Sorry no related observations have been made</h3>
		<%}
		else
		{%>
		<table border="1" bordercolor="blue" cellpadding="2" cellspacing="1">
		<tr>
			<th>Patient ID</th>
			<th>Patient Name</th>
			<th>Health Friend ID</th>
			<th>Health Friend Name</th>
			<th>No of Lingering alerts</th>
		</tr>
		<% 
			while(rs1.next())
			{%>
				<tr>
					<td><%=rs1.getInt(1) %></td>
					<td><%= rs1.getString(2) %></td>
					<td><%=rs1.getInt(3) %></td>
					<td><%= rs1.getString(4) %></td>
					<td><%=rs1.getInt(5) %></td>
				</tr>
					
		 <% }
		 rs1.close();
		%>
		</table>
		
		
	<% }
	break;
	
	
	
	
	
	}//switch close
	
	
	%>
	<br/><br/>
<a href="QueryList.jsp">Back</a>
</body>
</html>