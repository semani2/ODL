<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="HealthProfHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br/>
<br/>
	<%
 
// JDBC CONNECTION
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797"); 
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	ResultSet rs2 = null;
	ResultSet rs1 = null;
	int pid= 0;
	String obs_type = request.getParameter("obs_type");
	//out.println(obs_type);
	if(obs_type.equals("null"))
	response.sendRedirect("ViewPatientObs.jsp?error=Please select an observation type");
	else
	{
	
	
		
		// switch case for each observation type
		int int_obs_type = Integer.parseInt(request.getParameter("obs_type").toString());
		switch(int_obs_type){
			case 1:
			// Diet
			st1 = con.createStatement();
			rs1 = st1.executeQuery("select distinct p.pid,p.pname from patients p,observations o,diet d where p.pid=o.pid AND o.ob_id=d.ob_id");
			if(rs1.isBeforeFirst() ==false)
			{
				response.sendRedirect("ViewPatientObs.jsp?error=No Diet Observations have been made.");
			}
			else
			{
			
			while(rs1.next())
			{%> <br/><h4>Diet Observations for <%=rs1.getString(2) %></h4><%
				pid = rs1.getInt(1);
				st2 = con.createStatement();
				rs2= st2.executeQuery("select o.ob_id,d.d_item,d.d_qty,o.ob_dto,o.ob_dtr from patients p,observations o,diet d where p.pid=o.pid and o.ob_id=d.ob_id and p.pid="+pid+" order by o.ob_dto desc");
				%>
				<table>
					<tr>
						<th>Observation ID</th>
						<th>Item</th>
						<th>Quantity</th>
						<th>Date of observation</th>
						<th>Date of recording</th>
					</tr>
				<%while(rs2.next()){ %>				
					<tr>
						<td><%=rs2.getInt(1) %></td>
						<td><%=rs2.getString(2) %></td>
						<td><%=rs2.getFloat(3) %></td>
						<td><%=rs2.getString(4) %></td>
						<td><%=rs2.getString(5) %></td>
					</tr>
				<% } %>
				</table>
				-----------------------------------------------------------------------------------------------				
		  <%}
			
			}
			rs1.close();
			rs2.close();
			break;
			
			
			case 2:
			// Weight
			st1 = con.createStatement();
			rs1 = st1.executeQuery("select distinct p.pid,p.pname from patients p,observations o,weight d where p.pid=o.pid AND o.ob_id=d.ob_id");
			if(rs1.isBeforeFirst() ==false)
			{
				response.sendRedirect("ViewPatientObs.jsp?error=No Weight Observations have been made.");
			}
			else
			{
			
			while(rs1.next())
			{%> <br/><h4>Weight Observations for <%=rs1.getString(2) %></h4><%
				pid = rs1.getInt(1);
				st2 = con.createStatement();
				rs2= st2.executeQuery("select o.ob_id,d.w_amt,o.ob_dto,o.ob_dtr from patients p,observations o,weight d where p.pid=o.pid and o.ob_id=d.ob_id and p.pid="+pid+" order by o.ob_dto desc");
				%>
				<table>
					<tr>
						<th>Observation ID</th>
						<th>Weight</th>
						<th>Date of observation</th>
						<th>Date of recording</th>
					</tr>
				<%while(rs2.next()){ %>				
					<tr>
						<td><%=rs2.getInt(1) %></td>
						<td><%=rs2.getFloat(2) %></td>
						<td><%=rs2.getString(3) %></td>
						<td><%=rs2.getString(4) %></td>
					</tr>
				<% } %>
				</table>
				-----------------------------------------------------------------------------------------------				
		  <%}
			
			}
			rs1.close();
			rs2.close();
			break;
			case 3:
			//Exercise
			st1 = con.createStatement();
			rs1 = st1.executeQuery("select distinct p.pid,p.pname from patients p,observations o,exercise d where p.pid=o.pid AND o.ob_id=d.ob_id");
			if(rs1.isBeforeFirst() ==false)
			{
				response.sendRedirect("ViewPatientObs.jsp?error=No Exercise Observations have been made.");
			}
			else
			{
			
			while(rs1.next())
			{%> <br/><h4>Exercise Observations for <%=rs1.getString(2) %></h4><%
				pid = rs1.getInt(1);
				st2 = con.createStatement();
				rs2= st2.executeQuery("select o.ob_id,d.e_kind,d.e_duration,o.ob_dto,o.ob_dtr from patients p,observations o,exercise d where p.pid=o.pid and o.ob_id=d.ob_id and p.pid="+pid+" order by o.ob_dto desc");
				%>
				<table>
					<tr>
						<th>Observation ID</th>
						<th>Exercise type</th>
						<th>Duration</th>
						<th>Date of observation</th>
						<th>Date of recording</th>
					</tr>
				<%while(rs2.next()){ %>				
					<tr>
						<td><%=rs2.getInt(1) %></td>
						<td><%=rs2.getString(2) %></td>
						<td><%=rs2.getFloat(3) %></td>
						<td><%=rs2.getString(4) %></td>
						<td><%=rs2.getString(5) %></td>
					</tr>
				<% } %>
				</table>
				-----------------------------------------------------------------------------------------------				
		  <%}
			
			}
			rs1.close();
			rs2.close();
			break;
			case 4:
			//Blood Pressure
			st1 = con.createStatement();
			rs1 = st1.executeQuery("select distinct p.pid,p.pname from patients p,observations o,bloodpressure d where p.pid=o.pid AND o.ob_id=d.ob_id");
			if(rs1.isBeforeFirst() ==false)
			{
				response.sendRedirect("ViewPatientObs.jsp?error=No Blood Pressure Observations have been made.");
			}
			else
			{
			
			while(rs1.next())
			{%> <br/><h4>Blood Pressure Observations for <%=rs1.getString(2) %></h4><%
				pid = rs1.getInt(1);
				st2 = con.createStatement();
				rs2= st2.executeQuery("select o.ob_id,d.bp_sys,d.bp_dia,o.ob_dto,o.ob_dtr from patients p,observations o,bloodpressure d where p.pid=o.pid and o.ob_id=d.ob_id and p.pid="+pid+" order by o.ob_dto desc");
				%>
				<table>
					<tr>
						<th>Observation ID</th>
						<th>Systolic</th>
						<th>Diastolic</th>
						<th>Date of observation</th>
						<th>Date of recording</th>
					</tr>
				<%while(rs2.next()){ %>				
					<tr>
						<td><%=rs2.getInt(1) %></td>
						<td><%=rs2.getInt(2)%></td>
						<td><%=rs2.getInt(3) %></td>
						<td><%=rs2.getString(4) %></td>
						<td><%=rs2.getString(5) %></td>
					</tr>
				<% } %>
				</table>
				-----------------------------------------------------------------------------------------------				
		  <%}
			
			}
			rs1.close();
			rs2.close();
			break;
			case 5:
			//Exercise Tolerance
			st1 = con.createStatement();
			rs1 = st1.executeQuery("select distinct p.pid,p.pname from patients p,observations o,exercisetolerance d where p.pid=o.pid AND o.ob_id=d.ob_id");
			if(rs1.isBeforeFirst() ==false)
			{
				response.sendRedirect("ViewPatientObs.jsp?error=No Exercise Tolerance Observations have been made.");
			}
			else
			{
			
			while(rs1.next())
			{%> <br/><h4>Exercise Tolerance Observations for <%=rs1.getString(2) %></h4><%
				pid = rs1.getInt(1);
				st2 = con.createStatement();
				rs2= st2.executeQuery("select o.ob_id,d.et_numex,o.ob_dto,o.ob_dtr from patients p,observations o,exercisetolerance d where p.pid=o.pid and o.ob_id=d.ob_id and p.pid="+pid+" order by o.ob_dto desc");
				%>
				<table>
					<tr>
						<th>Observation ID</th>
						<th>Number of Steps</th>
						<th>Date of observation</th>
						<th>Date of recording</th>
					</tr>
				<%while(rs2.next()){ %>				
					<tr>
						<td><%=rs2.getInt(1) %></td>
						<td><%=rs2.getFloat(2) %></td>
						<td><%=rs2.getString(3) %></td>
						<td><%=rs2.getString(4) %></td>
					</tr>
				<% } %>
				</table>
				-----------------------------------------------------------------------------------------------				
		  <%}
			
			}
			rs1.close();
			rs2.close();
			break;
			case 6:
			//Oxygen Saturation
			st1 = con.createStatement();
			rs1 = st1.executeQuery("select distinct p.pid,p.pname from patients p,observations o,oxygensaturation d where p.pid=o.pid AND o.ob_id=d.ob_id");
			if(rs1.isBeforeFirst() ==false)
			{
				response.sendRedirect("ViewPatientObs.jsp?error=No Oxygen Saturation Observations have been made.");
			}
			else
			{
			
			while(rs1.next())
			{%> <br/><h4>Oxygen Saturation Observations for <%=rs1.getString(2) %></h4><%
				pid = rs1.getInt(1);
				st2 = con.createStatement();
				rs2= st2.executeQuery("select o.ob_id,d.os_amt,o.ob_dto,o.ob_dtr from patients p,observations o,oxygensaturation d where p.pid=o.pid and o.ob_id=d.ob_id and p.pid="+pid+" order by o.ob_dto desc");
				%>
				<table>
					<tr>
						<th>Observation ID</th>
						<th>Saturation(%)</th>
						<th>Date of observation</th>
						<th>Date of recording</th>
					</tr>
				<%while(rs2.next()){ %>				
					<tr>
						<td><%=rs2.getInt(1) %></td>
						<td><%=rs2.getFloat(2) %></td>
						<td><%=rs2.getString(3) %></td>
						<td><%=rs2.getString(4) %></td>
					</tr>
				<% } %>
				</table>
				-----------------------------------------------------------------------------------------------				
		  <%}
			
			}
			rs1.close();
			rs2.close();
			break;
			case 7:
			//Pain
			st1 = con.createStatement();
			rs1 = st1.executeQuery("select distinct p.pid,p.pname from patients p,observations o,pain d where p.pid=o.pid AND o.ob_id=d.ob_id");
			if(rs1.isBeforeFirst() ==false)
			{
				response.sendRedirect("ViewPatientObs.jsp?error=No Pain Observations have been made.");
			}
			else
			{
			
			while(rs1.next())
			{%> <br/><h4>Pain Observations for <%=rs1.getString(2) %></h4><%
				pid = rs1.getInt(1);
				st2 = con.createStatement();
				rs2= st2.executeQuery("select o.ob_id,d.pain_scale,o.ob_dto,o.ob_dtr from patients p,observations o,pain d where p.pid=o.pid and o.ob_id=d.ob_id and p.pid="+pid+" order by o.ob_dto desc");
				%>
				<table>
					<tr>
						<th>Observation ID</th>
						<th>Pain Scale</th>
						<th>Date of observation</th>
						<th>Date of recording</th>
					</tr>
				<%while(rs2.next()){ %>				
					<tr>
						<td><%=rs2.getInt(1) %></td>
						<td><%=rs2.getInt(2) %></td>
						<td><%=rs2.getString(3) %></td>
						<td><%=rs2.getString(4) %></td>
					</tr>
				<% } %>
				</table>
				-----------------------------------------------------------------------------------------------				
		  <%}
			
			}
			rs1.close();
			rs2.close();
			break;
			case 8:
			//Mood
			st1 = con.createStatement();
			rs1 = st1.executeQuery("select distinct p.pid,p.pname from patients p,observations o,mood d where p.pid=o.pid AND o.ob_id=d.ob_id");
			if(rs1.isBeforeFirst() ==false)
			{
				response.sendRedirect("ViewPatientObs.jsp?error=No Mood Observations have been made.");
			}
			else
			{
			
			while(rs1.next())
			{%> <br/><h4>Mood Observations for <%=rs1.getString(2) %></h4><%
				pid = rs1.getInt(1);
				st2 = con.createStatement();
				rs2= st2.executeQuery("select o.ob_id,d.m_value,o.ob_dto,o.ob_dtr from patients p,observations o,mood d where p.pid=o.pid and o.ob_id=d.ob_id and p.pid="+pid+" order by o.ob_dto desc");
				%>
				<table>
					<tr>
						<th>Observation ID</th>
						<th>Mood</th>
						<th>Date of observation</th>
						<th>Date of recording</th>
					</tr>
				<%while(rs2.next()){ %>				
					<tr>
						<td><%=rs2.getInt(1) %></td>
						<td><%=rs2.getString(2) %></td>
						<td><%=rs2.getString(3) %></td>
						<td><%=rs2.getString(4) %></td>
					</tr>
				<% } %>
				</table>
				-----------------------------------------------------------------------------------------------				
		  <%}
			
			}
			rs1.close();
			rs2.close();
			break;
			case 9:
			// Contraction
			st1 = con.createStatement();
			rs1 = st1.executeQuery("select distinct p.pid,p.pname from patients p,observations o,contraction d where p.pid=o.pid AND o.ob_id=d.ob_id");
			if(rs1.isBeforeFirst() ==false)
			{
				response.sendRedirect("ViewPatientObs.jsp?error=No Contraction Observations have been made.");
			}
			else
			{
			
			while(rs1.next())
			{%> <br/><h4>Contraction Observations for <%=rs1.getString(2) %></h4><%
				pid = rs1.getInt(1);
				st2 = con.createStatement();
				rs2= st2.executeQuery("select o.ob_id,d.con_frequency,o.ob_dto,o.ob_dtr from patients p,observations o,contraction d where p.pid=o.pid and o.ob_id=d.ob_id and p.pid="+pid+" order by o.ob_dto desc");
				%>
				<table>
					<tr>
						<th>Observation ID</th>
						<th>Frequency</th>
						<th>Date of observation</th>
						<th>Date of recording</th>
					</tr>
				<%while(rs2.next()){ %>				
					<tr>
						<td><%=rs2.getInt(1) %></td>
						<td><%=rs2.getFloat(2) %></td>
						<td><%=rs2.getString(3) %></td>
						<td><%=rs2.getString(4) %></td>
					</tr>
				<% } %>
				</table>
				-----------------------------------------------------------------------------------------------				
		  <%}
			
			}
			rs1.close();
			rs2.close();
			break;
			case 10:
			// Temperature
			st1 = con.createStatement();
			rs1 = st1.executeQuery("select distinct p.pid,p.pname from patients p,observations o,temperature d where p.pid=o.pid AND o.ob_id=d.ob_id");
			if(rs1.isBeforeFirst() ==false)
			{
				response.sendRedirect("ViewPatientObs.jsp?error=No Temperature Observations have been made.");
			}
			else
			{
			
			while(rs1.next())
			{%> <br/><h4>Temperature Observations for <%=rs1.getString(2) %></h4><%
				pid = rs1.getInt(1);
				st2 = con.createStatement();
				rs2= st2.executeQuery("select o.ob_id,d.t_amt,o.ob_dto,o.ob_dtr from patients p,observations o,temperature d where p.pid=o.pid and o.ob_id=d.ob_id and p.pid="+pid+" order by o.ob_dto desc");
				%>
				<table>
					<tr>
						<th>Observation ID</th>
						<th>Temperature</th>
						<th>Date of observation</th>
						<th>Date of recording</th>
					</tr>
				<%while(rs2.next()){ %>				
					<tr>
						<td><%=rs2.getInt(1) %></td>
						<td><%=rs2.getFloat(2) %></td>
						<td><%=rs2.getString(3) %></td>
						<td><%=rs2.getString(4) %></td>
					</tr>
				<% } %>
				</table>
				-----------------------------------------------------------------------------------------------				
		  <%}
			
			}
			rs1.close();
			rs2.close();
			break;
			default:
			Statement st3 = con.createStatement();
			ResultSet rs3 = st3.executeQuery("select ot_name from observationtype where ot_id="+int_obs_type+"");
			rs3.next();
			String table_name = rs3.getString(1);
			rs3.close();
			
			st1 = con.createStatement();
			rs1 = st1.executeQuery("select distinct p.pid,p.pname,p.psex,p.p_age from patients p,observations o,"+table_name+"_type d where p.pid=o.pid AND o.ob_id=d.ob_id");
			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery("select * from "+table_name+"_type");
			ResultSetMetaData rsmd = rs4.getMetaData();
			String att_name = rsmd.getColumnName(2);
			st1 = con.createStatement();
			rs1 = st1.executeQuery("select distinct p.pid,p.pname from patients p,observations o,"+table_name+"_type d where p.pid=o.pid AND o.ob_id=d.ob_id");
			if(rs1.isBeforeFirst() ==false)
			{
				response.sendRedirect("ViewPatientObs.jsp?error=No "+table_name+" Observations have been made.");
			}
			else
			{
			
			while(rs1.next())
			{%> <br/><h4><%=table_name %> Observations for <%=rs1.getString(2) %></h4><%
				pid = rs1.getInt(1);
				st2 = con.createStatement();
				rs2= st2.executeQuery("select o.ob_id,d."+att_name+",o.ob_dto,o.ob_dtr from patients p,observations o,"+table_name+"_type d where p.pid=o.pid and o.ob_id=d.ob_id and p.pid="+pid+" order by o.ob_dto desc");
				%>
				<table>
					<tr>
						<th>Observation ID</th>
						<th><%= att_name %></th>
						<th>Date of observation</th>
						<th>Date of recording</th>
					</tr>
				<%while(rs2.next()){ %>				
					<tr>
						<td><%=rs2.getInt(1) %></td>
						<td><%=rs2.getString(2) %></td>
						<td><%=rs2.getString(3) %></td>
						<td><%=rs2.getString(4) %></td>
					</tr>
				<% } %>
				</table>
				-----------------------------------------------------------------------------------------------				
		  <%}
			
			}
			rs1.close();
			rs2.close();
			break;
		}
		
	}
	
	
	 %>

	<br/>
	<br/>
	
	
</body>
</html>