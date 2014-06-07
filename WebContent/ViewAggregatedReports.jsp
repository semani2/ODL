<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
 <%@ page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="HealthProfHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reports</title>
</head>
<body>
	<br/>
	<%
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797"); 
		Statement st1 = con.createStatement();
		Statement st2 = con.createStatement();
		Statement st3 = con.createStatement();
		ResultSet rs1 ,rs2,rs3 = null;
		int pat_class = Integer.parseInt(request.getParameter("pat_class").toString());
		switch(pat_class)
		{
			case 1:// HIV - Weight , Mood and Temperature
			// Weight
			%><h3>Aggregated Report of Weight Observations</h3> <%
			rs1 = st1.executeQuery("select max(w.w_amt),min(w.w_amt),avg(w.w_amt) from patients p,observations o,weight w where p.pid=o.pid and o.ob_id=w.ob_id and p.pid IN(select distinct p.pid from patients p,patient_belongs_to_class pb where p.pid=pb.pid and pb.pc_id=1)");
			if(rs1.isBeforeFirst() == false)
			{
				%><br/>Sorry no weight observations have been recorded yet by this patient class<%
			}
			else
			{%>
			<table border="1">
			<tr>
				<th>Max Weight</th>
				<th>Min Weight</th>
				<th>Average Weight</th>
			</tr>
			<% 
				while(rs1.next())
				{ %>
				<tr>
					<td><%=rs1.getInt(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					<td><%=rs1.getInt(3) %></td>
				</tr>
				<%}
			%>
			</table>	
		  <%}
		  //Temperature
		  %><h3>Aggregated Report of Temperature Observations</h3> <%
			rs1 = st1.executeQuery("select max(w.t_amt),min(w.t_amt),avg(w.t_amt) from patients p,observations o,temperature w where p.pid=o.pid and o.ob_id=w.ob_id and p.pid IN(select distinct p.pid from patients p,patient_belongs_to_class pb where p.pid=pb.pid and pb.pc_id=1)");
			if(rs1.isBeforeFirst() == false)
			{
				%><br/>Sorry no temperature observations have been recorded yet by this patient class<%
			}
			else
			{%>
			<table border="1">
			<tr>
				<th>Max Temperature</th>
				<th>Min Temperature</th>
				<th>Average Temperature</th>
			</tr>
			<% 
				while(rs1.next())
				{ %>
				<tr>
					<td><%=rs1.getInt(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					<td><%=rs1.getInt(3) %></td>
				</tr>
				<%}
			%>
			</table>	
		  <%}
		  // Mood
		  %><h3>Aggregated Report of Mood Observations</h3> <%
			rs1 = st1.executeQuery("select m.m_value,count(*) from patients p,observations o,mood m where p.pid=o.pid and o.ob_id=m.ob_id and p.pid IN (select distinct p.pid from patients p,patient_belongs_to_class pb where p.pid=pb.pid and pb.pc_id=1) group by m.m_value");
			if(rs1.isBeforeFirst() == false)
			{
				%><br/>Sorry no mood observations have been recorded yet by this patient class<%
			}
			else
			{%>
			<table border="1">
			<tr>
				<th>Mood</th>
				<th>Count</th>
				
			</tr>
			<% 
				while(rs1.next())
				{ %>
				<tr>
					<td><%=rs1.getString(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					
				</tr>
				<%}
			%>
			</table>	
		  <%}
		  break;
		  case 2:
		  // Obesity - Weight , Mood , Blood Pressure
		  // Weight
		  %><h3>Aggregated Report of Weight Observations</h3> <%
			rs1 = st1.executeQuery("select max(w.w_amt),min(w.w_amt),avg(w.w_amt) from patients p,observations o,weight w where p.pid=o.pid and o.ob_id=w.ob_id and p.pid IN(select distinct p.pid from patients p,patient_belongs_to_class pb where p.pid=pb.pid and pb.pc_id=2)");
			if(rs1.isBeforeFirst() == false)
			{
				%><br/>Sorry no weight observations have been recorded yet by this patient class<%
			}
			else
			{%>
			<table border="1">
			<tr>
				<th>Max Weight</th>
				<th>Min Weight</th>
				<th>Average Weight</th>
			</tr>
			<% 
				while(rs1.next())
				{ %>
				<tr>
					<td><%=rs1.getInt(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					<td><%=rs1.getInt(3) %></td>
				</tr>
				<%}
			%>
			</table>	
		  <%}  
		   // Mood
		    %><h3>Aggregated Report of Mood Observations</h3> <%
			rs1 = st1.executeQuery("select m.m_value,count(*) from patients p,observations o,mood m where p.pid=o.pid and o.ob_id=m.ob_id and p.pid IN (select distinct p.pid from patients p,patient_belongs_to_class pb where p.pid=pb.pid and pb.pc_id=2) group by m.m_value");
			if(rs1.isBeforeFirst() == false)
			{
				%><br/>Sorry no mood observations have been recorded yet by this patient class<%
			}
			else
			{%>
			<table border="1">
			<tr>
				<th>Mood</th>
				<th>Count</th>
				
			</tr>
			<% 
				while(rs1.next())
				{ %>
				<tr>
					<td><%=rs1.getString(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					
				</tr>
				<%}
			%>
			</table>	
		  <%} 
		  
		  // Blood Pressure
		  %><h3>Aggregated Report of Blood Pressure Observations</h3> <%
			rs1 = st1.executeQuery("select max(w.bp_sys),min(w.bp_sys),avg(w.bp_sys),max(w.bp_dia),min(w.bp_dia),avg(w.bp_dia) from patients p,observations o,bloodpressure w where p.pid=o.pid and o.ob_id=w.ob_id and p.pid IN(select distinct p.pid from patients p,patient_belongs_to_class pb where p.pid=pb.pid and pb.pc_id=2)");
			if(rs1.isBeforeFirst() == false)
			{
				%><br/>Sorry no BP observations have been recorded yet by this patient class<%
			}
			else
			{%>
			<table border="1">
			<tr>
				<th>Max Systolic</th>
				<th>Min Systolic</th>
				<th>Average Systolic</th>
				<th>Max Diastolic</th>
				<th>Min Dialic</th>
				<th>Average Diastolic</th>
			</tr>
			<% 
				while(rs1.next())
				{ %>
				<tr>
					<td><%=rs1.getInt(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					<td><%=rs1.getInt(3) %></td>
					<td><%=rs1.getInt(4) %></td>
					<td><%=rs1.getInt(5) %></td>
					<td><%=rs1.getInt(6) %></td>
				</tr>
				<%}
			%>
			</table>	
		  <%}  
			break;
		case 3:// HRP - Weight , Mood ,Contraction , Pain
			// Weight
			%><h3>Aggregated Report of Weight Observations</h3> <%
			rs1 = st1.executeQuery("select max(w.w_amt),min(w.w_amt),avg(w.w_amt) from patients p,observations o,weight w where p.pid=o.pid and o.ob_id=w.ob_id and p.pid IN(select distinct p.pid from patients p,patient_belongs_to_class pb where p.pid=pb.pid and pb.pc_id=3)");
			if(rs1.isBeforeFirst() == false)
			{
				%><br/>Sorry no weight observations have been recorded yet by this patient class<%
			}
			else
			{%>
			<table border="1">
			<tr>
				<th>Max Weight</th>
				<th>Min Weight</th>
				<th>Average Weight</th>
			</tr>
			<% 
				while(rs1.next())
				{ %>
				<tr>
					<td><%=rs1.getInt(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					<td><%=rs1.getInt(3) %></td>
				</tr>
				<%}
			%>
			</table>	
		  <%}
		// MOOD
			 %><h3>Aggregated Report of Mood Observations</h3> <%
			rs1 = st1.executeQuery("select m.m_value,count(*) from patients p,observations o,mood m where p.pid=o.pid and o.ob_id=m.ob_id and p.pid IN (select distinct p.pid from patients p,patient_belongs_to_class pb where p.pid=pb.pid and pb.pc_id=3) group by m.m_value");
			if(rs1.isBeforeFirst() == false)
			{
				%><br/>Sorry no mood observations have been recorded yet by this patient class<%
			}
			else
			{%>
			<table border="1">
			<tr>
				<th>Mood</th>
				<th>Count</th>
				
			</tr>
			<% 
				while(rs1.next())
				{ %>
				<tr>
					<td><%=rs1.getString(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					
				</tr>
				<%}
			%>
			</table>	
		  <%} 
		// Contraction
			%><h3>Aggregated Report of Contraction Observations</h3> <%
			rs1 = st1.executeQuery("select max(w.con_frequency),min(w.con_frequency),avg(w.con_frequency) from patients p,observations o,contraction w where p.pid=o.pid and o.ob_id=w.ob_id and p.pid IN(select distinct p.pid from patients p,patient_belongs_to_class pb where p.pid=pb.pid and pb.pc_id=3)");
			if(rs1.isBeforeFirst() == false)
			{
				%><br/>Sorry no contraction observations have been recorded yet by this patient class<%
			}
			else
			{%>
			<table border="1">
			<tr>
				<th>Max Contraction frequency</th>
				<th>Min Contraction frequency</th>
				<th>Average Contraction frequency</th>
			</tr>
			<% 
				while(rs1.next())
				{ %>
				<tr>
					<td><%=rs1.getInt(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					<td><%=rs1.getInt(3) %></td>
				</tr>
				<%}
			%>
			</table>	
		  <%}	
			// Pain
			%><h3>Aggregated Report of Pain Observations</h3> <%
			rs1 = st1.executeQuery("select max(w.pain_scale),min(w.pain_scale),avg(w.pain_scale) from patients p,observations o,pain w where p.pid=o.pid and o.ob_id=w.ob_id and p.pid IN(select distinct p.pid from patients p,patient_belongs_to_class pb where p.pid=pb.pid and pb.pc_id=3)");
			if(rs1.isBeforeFirst() == false)
			{
				%><br/>Sorry no pain observations have been recorded yet by this patient class<%
			}
			else
			{%>
			<table border="1">
			<tr>
				<th>Max Pain</th>
				<th>Min Pain</th>
				<th>Average Pain</th>
			</tr>
			<% 
				while(rs1.next())
				{ %>
				<tr>
					<td><%=rs1.getInt(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					<td><%=rs1.getInt(3) %></td>
				</tr>
				<%}
			%>
			</table>	
		  <%}
			break;
			case 4:// COPD - Weight , MOOD , Oxygen saturation , Exercise Tolerance
			%><h3>Aggregated Report of Weight Observations</h3> <%
			rs1 = st1.executeQuery("select max(w.w_amt),min(w.w_amt),avg(w.w_amt) from patients p,observations o,weight w where p.pid=o.pid and o.ob_id=w.ob_id and p.pid IN(select distinct p.pid from patients p,patient_belongs_to_class pb where p.pid=pb.pid and pb.pc_id=4)");
			if(rs1.isBeforeFirst() == false)
			{
				%><br/>Sorry no weight observations have been recorded yet by this patient class<%
			}
			else
			{%>
			<table border="1">
			<tr>
				<th>Max Weight</th>
				<th>Min Weight</th>
				<th>Average Weight</th>
			</tr>
			<% 
				while(rs1.next())
				{ %>
				<tr>
					<td><%=rs1.getInt(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					<td><%=rs1.getInt(3) %></td>
				</tr>
				<%}
			%>
			</table>	
		  <%}
		// MOOD
			 %><h3>Aggregated Report of Mood Observations</h3> <%
			rs1 = st1.executeQuery("select m.m_value,count(*) from patients p,observations o,mood m where p.pid=o.pid and o.ob_id=m.ob_id and p.pid IN (select distinct p.pid from patients p,patient_belongs_to_class pb where p.pid=pb.pid and pb.pc_id=4) group by m.m_value");
			if(rs1.isBeforeFirst() == false)
			{
				%><br/>Sorry no mood observations have been recorded yet by this patient class<%
			}
			else
			{%>
			<table border="1">
			<tr>
				<th>Mood</th>
				<th>Count</th>
				
			</tr>
			<% 
				while(rs1.next())
				{ %>
				<tr>
					<td><%=rs1.getString(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					
				</tr>
				<%}
			%>
			</table>	
		  <%} 		
			// Oxygen Saturation
			%><h3>Aggregated Report of Oxygen Saturation Observations</h3> <%
			rs1 = st1.executeQuery("select max(w.os_amt),min(w.os_amt),avg(w.os_amt) from patients p,observations o,oxygensaturation w where p.pid=o.pid and o.ob_id=w.ob_id and p.pid IN(select distinct p.pid from patients p,patient_belongs_to_class pb where p.pid=pb.pid and pb.pc_id=4)");
			if(rs1.isBeforeFirst() == false)
			{
				%><br/>Sorry no oxygen saturation observations have been recorded yet by this patient class<%
			}
			else
			{%>
			<table border="1">
			<tr>
				<th>Max Saturation</th>
				<th>Min Saturation</th>
				<th>Average Saturation</th>
			</tr>
			<% 
				while(rs1.next())
				{ %>
				<tr>
					<td><%=rs1.getInt(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					<td><%=rs1.getInt(3) %></td>
				</tr>
				<%}
			%>
			</table>	
		  <%}
		  // Exercise Tolerance
		  %><h3>Aggregated Report of Exercise Tolerance Observations</h3> <%
			rs1 = st1.executeQuery("select max(w.et_numex),min(w.et_numex),avg(w.et_numex) from patients p,observations o,exercisetolerance w where p.pid=o.pid and o.ob_id=w.ob_id and p.pid IN(select distinct p.pid from patients p,patient_belongs_to_class pb where p.pid=pb.pid and pb.pc_id=4)");
			if(rs1.isBeforeFirst() == false)
			{
				%><br/>Sorry no exercise tolerance observations have been recorded yet by this patient class<%
			}
			else
			{%>
			<table border="1">
			<tr>
				<th>Max number of steps</th>
				<th>Min number of steps</th>
				<th>Average number of steps</th>
			</tr>
			<% 
				while(rs1.next())
				{ %>
				<tr>
					<td><%=rs1.getInt(1) %></td>
					<td><%=rs1.getInt(2) %></td>
					<td><%=rs1.getInt(3) %></td>
				</tr>
				<%}
			%>
			</table>	
		  <%}
			break;
		
		
			
		  
		}//switch close
	 %>
</body>
</html>