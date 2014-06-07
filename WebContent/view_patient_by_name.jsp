<%@page import="javax.management.openmbean.TabularType"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="HealthProfHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Patient</title>
</head>
<body>
	<br/>
	<br/>
	<h2></h2>
	<% 
// JDBC CONNECTION
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797");  
	String patient_name = request.getParameter("pat_name");
	String patientid= null;
	String gen_ob_type_name = null;
	int pid = 0;
	String temp = null;
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select patientid,pid from patients where pname='"+patient_name+"'");
	if(rs.next())
		{
			patientid=rs.getString(1);
			pid = rs.getInt(2);
			rs.close();
		}
	else
		{
		rs.close();
			response.sendRedirect("ViewPatientName.jsp?error=Sorry no patient found with name "+patient_name);
			
		}
	int[] patient_class_id = new int[50];
	Statement st1 = con.createStatement();
	ResultSet rs1 = st1.executeQuery("select pc_id from patient_belongs_to_class where pid = "+pid+" and pc_id <> 5");
	int i=0;
	while(rs1.next())
	{
		
		patient_class_id[i] = rs1.getInt(1);
		i++;
	}
	rs1.close();
	
	%>
	<h3>Diet observations for <%=patient_name %></h3>
	<%
		// Getting all the diet observations
		Statement st2 = con.createStatement();
		ResultSet rs2 = st2.executeQuery("select o.ob_id,d.d_item,d.d_qty,o.ob_dto,o.ob_dtr from patients p,observations o,diet d where p.pid=o.pid and o.ob_id=d.ob_id and p.pid="+pid+" order by o.ob_dto desc");
		if(rs2.isBeforeFirst() == false)
			{
	 %>
	 	Sorry no diet observations have been made !
	 <%
	 
	 	}
	 	else
	 	{
	 	 	%>	
	 	 <table>
	 	 	<tr>
	 	 		<th>Observation Id</th>
	 	 		<th>Item</th>
	 	 		<th>Quantity</th>
	 	 		<th>Date and Time of observation</th>
	 	 		<th>Date and Time of recording</th>
	 	 	</tr>
	 	 	
	 	 
	 	 	
	 	 	
	 <% 	
	 		while(rs2.next())
	 		{
	 			%>
	 			<tr>
	 				<td><%= rs2.getInt(1)%></td>
	 				<td><%= rs2.getString(2)%></td>
	 				<td><%= rs2.getString(3)%></td>
	 				<td><%= rs2.getString(4)%></td>
	 				<td><%= rs2.getString(5)%></td>
	 			</tr>
	 		<%}
	 
	 }
	 rs2.close();
	%> 
	</table>	
	<br/>
	-----------------------------------------------------------------------------------------------------------
	<br/>
	<h3>Weight Observations for <%=patient_name %></h3>
	<%
		// Getting all weight observations
		st2 = con.createStatement();
		rs2 = st2.executeQuery("select o.ob_id,w.w_amt,o.ob_dto,o.ob_dtr from patients p,observations o,weight w where p.pid=o.pid and o.ob_id=w.ob_id and p.pid="+pid+" order by o.ob_dto desc");
		if(rs2.isBeforeFirst() == false)
			{
	 %>
	 	Sorry no weight observations have been made !
	 <%
	 
	 	}
	 	else
	 	{
	 	 	%>	
	 	 <table>
	 	 	<tr>
	 	 		<th>Observation Id</th>
	 	 		<th>Weight(in lbs)</th>
	 	 		<th>Date and Time of observation</th>
	 	 		<th>Date and Time of recording</th>
	 	 	</tr>
	 	 	
	 	 
	 	 	
	 	 	
	 <% 	
	 		while(rs2.next())
	 		{
	 			%>
	 			<tr>
	 				<td><%= rs2.getInt(1)%></td>
	 				<td><%= rs2.getString(2)%></td>
	 				<td><%= rs2.getString(3)%></td>
	 				<td><%= rs2.getString(4)%></td>
	 				
	 			</tr>
	 		<%}
	 
	 }
	 rs2.close();
	%> 
	</table>	
	<br/>
		-----------------------------------------------------------------------------------------------------------
	<br/> 
	<h3>Exercise Observations for <%=patient_name %></h3>
	<%
		// Getting all exercise observations
		st2 = con.createStatement();
		rs2 = st2.executeQuery("select o.ob_id,e_kind,e_duration,o.ob_dto,o.ob_dtr from patients p,observations o,exercise e where p.pid=o.pid and o.ob_id=e.ob_id and p.pid="+pid+" order by o.ob_dto desc");
		if(rs2.isBeforeFirst() == false)
			{
	 %>
	 	Sorry no exercise observations have been made !
	 <%
	 
	 	}
	 	else
	 	{
	 	 	%>	
	 	 <table>
	 	 	<tr>
	 	 		<th>Observation Id</th>
	 	 		<th>Exercise</th>
	 	 		<th>Duration</th>
	 	 		<th>Date and Time of observation</th>
	 	 		<th>Date and Time of recording</th>
	 	 	</tr>
	 	 	
	 	 
	 	 	
	 	 	
	 <% 	
	 		while(rs2.next())
	 		{
	 			%>
	 			<tr>
	 				<td><%= rs2.getInt(1)%></td>
	 				<td><%= rs2.getString(2)%></td>
	 				<td><%= rs2.getString(3)%></td>
	 				<td><%= rs2.getString(4)%></td>
	 				<td><%= rs2.getString(4)%></td>
	 				
	 			</tr>
	 		<%}
	 
	 }
	 rs2.close();
	%> 
	</table>	
	<br/>
	-----------------------------------------------------------------------------------------------------------
	
	<br/> 
	<h3>Mood Observations for <%= patient_name %></h3>
	<%
		// Getting all mood observations
		st2 = con.createStatement();
		rs2 = st2.executeQuery("select o.ob_id,m.m_value,o.ob_dto,o.ob_dtr from patients p,observations o,mood m where p.pid=o.pid and o.ob_id=m.ob_id and p.pid="+pid+" order by o.ob_dto desc");
		if(rs2.isBeforeFirst() == false)
			{
	 %>
	 	Sorry no Mood observations have been made !
	 <%
	 
	 	}
	 	else
	 	{
	 	 	%>	
	 	 <table>
	 	 	<tr>
	 	 		<th>Observation Id</th>
	 	 		<th>Mood</th>
	 	 		
	 	 		<th>Date and Time of observation</th>
	 	 		<th>Date and Time of recording</th>
	 	 	</tr>
	 	 	
	 	 
	 	 	
	 	 	
	 <% 	
	 		while(rs2.next())
	 		{
	 			%>
	 			<tr>
	 				<td><%= rs2.getInt(1)%></td>
	 				<td><%= rs2.getString(2)%></td>
	 				<td><%= rs2.getString(3)%></td>
	 				<td><%= rs2.getString(4)%></td>
	 				
	 				
	 			</tr>
	 		<%}
	 
	 }
	 rs2.close();
	%> 
	</table>	
	<br/>
	-----------------------------------------------------------------------------------------------------------
	<%
		// get all the other general observations for patients
		Statement st_gen = con.createStatement();
		ResultSet rs_gen = st_gen.executeQuery("select ot_id from observationtype where  (ot_id <>10 and ot_id<>1 and ot_id<>2 and ot_id<>3 and ot_id<>8)and(oc_id =4) ");
		int[] gen_types = new int[50];
		int gen=0;
		String gen_table_att_name = null;
		if(rs_gen.isBeforeFirst() == false)
		{
			
		}		
		else
		{
			// getting other observation types for general
			while(rs_gen.next())
			{
				gen_types[gen] = rs_gen.getInt(1);
				gen++;
			}
			rs_gen.close();
			
			for(int gen_ite=0;gen_ite<gen;gen_ite++)
			{
				// generate all observation tables for HIV
				Statement st_gen1 = con.createStatement();
				ResultSet rs_gen1 = st_gen1.executeQuery("select ot_name from observationtype where ot_id="+gen_types[gen_ite]+"");
				rs_gen1.next();
				gen_ob_type_name = rs_gen1.getString(1);
				rs_gen1.close();
				//out.println(hiv_ob_type_name);
				// Generate the  required observation table
				// for that first get the required observation type's attribute
				temp = gen_ob_type_name+"_type";
				rs_gen1 = st_gen1.executeQuery("select * from "+temp+"");
				ResultSetMetaData rsmd_gen = rs_gen1.getMetaData();
				gen_table_att_name = rsmd_gen.getColumnName(2);
				rs_gen1.close();
				// retrieve table
				%> 
				<h3><%=gen_ob_type_name %> observations for <%= patient_name %></h3>
				<%
	 	 
	 	  
	 	 		Statement st_gen2 = con.createStatement(); 
	 	 		ResultSet rs_gen2 = st_gen2.executeQuery("select o.ob_id,t."+gen_table_att_name+",o.ob_dto,o.ob_dtr from patients p,observations o,"+gen_ob_type_name+"_type t where p.pid=o.pid and o.ob_id=t.ob_id and p.pid="+pid+" order by o.ob_dto desc");
	 			if(rs_gen2.isBeforeFirst() == false)
	 			{
	 				out.println("Sorry no "+gen_ob_type_name+" observations found");
	 			}
	 			else
	 			{ %>
	 			<table>
	 	 		<tr>
	 	 			<th>Observation ID</th>
	 	 			
	 	 			<th><%= gen_table_att_name %></th>
	 	 		
	 	 			<th>Date and Time of observation</th>
	 	 			<th>Date and Time of recording</th>
	 	 		</tr>
	 			<%	
	 				while(rs_gen2.next())
	 				{ %>
	 					<tr>
	 						<td><%= rs_gen2.getInt(1) %></td>	
	 						<td><%= rs_gen2.getString(2) %></td>
	 						<td><%= rs_gen2.getString(3) %></td>	
	 						<td><%= rs_gen2.getString(4) %></td>
	 					</tr>
	 				
	 			 <% }
	 				
	 			}
	 			
	 		}
	 		}	%>
	 	 		
	 	 	
	 	 
	 	 </table>	
	 	 <br/>
	----------------------------------------------------------------------------------------------------------
	
	
	
	
	<% 
	
	for(int j=0;j<i;j++ ){
		// Switching between each patient class
		switch(patient_class_id[j])
		{
			case 1:// HIV
			// Temperature observation for sure
			%><br/> 
	<h3>Temperature Observations for <%= patient_name %></h3>
	<%
		// Getting all mood observations
		st2 = con.createStatement();
		rs2 = st2.executeQuery("select o.ob_id,t.t_amt,o.ob_dto,o.ob_dtr from patients p,observations o,temperature t where p.pid=o.pid and o.ob_id=t.ob_id and p.pid="+pid+" order by o.ob_dto desc");
		if(rs2.isBeforeFirst() == false)
			{
	 			%>
	 		Sorry no temperature observations have been made !
	 			<%
	 
	 		}
	 		else
	 		{
	 	 	%>	
	 	 <table>
	 	 	<tr>
	 	 		<th>Observation Id</th>
	 	 		<th>Temperature</th>
	 	 		
	 	 		<th>Date and Time of observation</th>
	 	 		<th>Date and Time of recording</th>
	 	 	</tr>
	 	 	
	 	 
	 	 	
	 	 	
	 <% 	
	 		while(rs2.next())
	 		{
	 			%>
	 			<tr>
	 				<td><%= rs2.getInt(1)%></td>
	 				<td><%= rs2.getString(2)%></td>
	 				<td><%= rs2.getString(3)%></td>
	 				<td><%= rs2.getString(4)%></td>
	 				
	 				
	 			</tr>
	 		<%	}
	 
	 		}
	 rs2.close();
	%> 
	</table>	
	<br/>
	-----------------------------------------------------------------------------------------------------------
			
			
		<%	
		//Getting all HIV - observation types and their observation tables
		Statement st3 = con.createStatement();
		ResultSet rs3 = st3.executeQuery("select ot_id from type_belongs_to_class where pc_id =1 and ot_id <>10 and ot_id<>1 and ot_id<>2 and ot_id<>3 and ot_id<>8");
		int[] hiv_types = new int[50];
		int k=0;
		if(rs3.isBeforeFirst() == false)
		{
			continue;
		}		
		else
		{
			// getting other observation types for HIV
			while(rs3.next())
			{
				hiv_types[k] = rs3.getInt(1);
				k++;
			}
			rs3.close();
			String hiv_ob_type_name = null;
			for(int a=0;a<k;a++)
			{
				// generate all observation tables for HIV
				st3 = con.createStatement();
				rs3 = st3.executeQuery("select ot_name from observationtype where ot_id="+hiv_types[a]+"");
				rs3.next();
				hiv_ob_type_name = rs3.getString(1);
				rs3.close();
				//out.println(hiv_ob_type_name);
				// Generate the  required observation table
				// for that first get the required observation type's attribute
				rs3 = st3.executeQuery("select * from "+hiv_ob_type_name+"_type");
				ResultSetMetaData rsmd = rs3.getMetaData();
				String table_att_name = rsmd.getColumnName(2);
				rs3.close();
				// retrieve table
				%> 
				<h3><%=hiv_ob_type_name %> observations for <%= patient_name %></h3>
				<%
	 	 
	 	  
	 	 		st3 = con.createStatement(); 
	 	 		rs3 = st3.executeQuery("select o.ob_id,t."+table_att_name+",o.ob_dto,o.ob_dtr from patients p,observations o,"+hiv_ob_type_name+"_type t where p.pid=o.pid and o.ob_id=t.ob_id and p.pid="+pid+" order by o.ob_dto desc");
	 			if(rs3.isBeforeFirst() == false)
	 			{
	 				out.println("Sorry no "+hiv_ob_type_name+" observations found");
	 			}
	 			else
	 			{ %>
	 			<table>
	 	 		<tr>
	 	 			<th>Observation ID</th>
	 	 			
	 	 			<th><%= table_att_name %></th>
	 	 		
	 	 			<th>Date and Time of observation</th>
	 	 			<th>Date and Time of recording</th>
	 	 		</tr>
	 			<%	
	 				while(rs3.next())
	 				{ %>
	 					<tr>
	 						<td><%= rs3.getInt(1) %></td>	
	 						<td><%= rs3.getString(2) %></td>
	 						<td><%= rs3.getString(3) %></td>	
	 						<td><%= rs3.getString(4) %></td>
	 					</tr>
	 				
	 			 <% }
	 				
	 			}
	 			
	 			%>
	 	 		
	 	 	
	 	 
	 	 </table>	
	 	 <br/>
	-----------------------------------------------------------------------------------------------------------
	 <% 	
				
			}
		}
		break;
		
		case 2://Obesity
		// Blood Pressure observation for sure%><br/> 
	<h3>Blood Pressure Observations for <%= patient_name %></h3>
	<%
		// Getting all mood observations
		st2 = con.createStatement();
		rs2 = st2.executeQuery("select o.ob_id,b.bp_sys,b.bp_dia,o.ob_dto,o.ob_dtr from patients p,observations o,bloodpressure b where p.pid=o.pid and o.ob_id=b.ob_id and p.pid="+pid+" order by o.ob_dto desc");
		if(rs2.isBeforeFirst() == false)
			{
	 			%>
	 		Sorry no Blood pressure observations have been made !
	 			<%
	 
	 		}
	 		else
	 		{
	 	 	%>	
	 	 <table>
	 	 	<tr>
	 	 		<th>Observation Id</th>
	 	 		<th>Systolic</th>
	 	 		<th>Diastolic</th>
	 	 		<th>Date and Time of observation</th>
	 	 		<th>Date and Time of recording</th>
	 	 	</tr>
	 	 	
	 	 
	 	 	
	 	 	
	 <% 	
	 		while(rs2.next())
	 		{
	 			%>
	 			<tr>
	 				<td><%= rs2.getInt(1)%></td>
	 				<td><%= rs2.getInt(2)%></td>
	 				<td><%= rs2.getInt(3)%></td>
	 				<td><%= rs2.getString(4)%></td>
	 				<td><%= rs2.getString(5)%></td>
	 				
	 				
	 			</tr>
	 	<% 	}
	 
	 		}
	 rs2.close();
	%> 
	</table>	
	<br/>
	-----------------------------------------------------------------------------------------------------------
			<%	
		//Getting all Obesity - observation types and their observation tables
		Statement st4 = con.createStatement();
		ResultSet rs4 = st4.executeQuery("select ot_id from type_belongs_to_class where pc_id =2 and ot_id <>4 and ot_id<>1 and ot_id<>2 and ot_id<>3 and ot_id<>8");
		int[] obesity_types = new int[50];
		int b=0;
		if(rs4.isBeforeFirst() == false)
		{
			continue;
		}		
		else
		{
			// getting other observation types for HIV
			while(rs4.next())
			{
				obesity_types[b] = rs4.getInt(1);
				b++;
			}
			rs4.close();
			String obe_ob_type_name = null;
			for(int c=0;c<b;c++)
			{
				// generate all observation tables for Obesity
				st4 = con.createStatement();
				rs4 = st4.executeQuery("select ot_name from observationtype where ot_id="+obesity_types[c]+"");
				rs4.next();
				obe_ob_type_name = rs4.getString(1);
				rs4.close();
				//out.println(hiv_ob_type_name);
				// Generate the  required observation table
				// for that first get the required observation type's attribute
				rs4 = st4.executeQuery("select * from "+obe_ob_type_name+"_type");
				ResultSetMetaData rsmd1 = rs4.getMetaData();
				String table_att_name = rsmd1.getColumnName(2);
				rs4.close();
				// retrieve table
				%> 
				<h3><%=obe_ob_type_name %> observations for <%= patient_name %></h3>
				<%
	 	 
	 	  
	 	 		st4 = con.createStatement(); 
	 	 		rs4 = st4.executeQuery("select o.ob_id,t."+table_att_name+",o.ob_dto,o.ob_dtr from patients p,observations o,"+obe_ob_type_name+"_type t where p.pid=o.pid and o.ob_id=t.ob_id and p.pid="+pid+" order by o.ob_dto desc");
	 			if(rs4.isBeforeFirst() == false)
	 			{
	 				out.println("Sorry no "+obe_ob_type_name+" observations found");
	 			}
	 			else
	 			{ %>
	 			<table>
	 	 		<tr>
	 	 			<th>Observation ID</th>
	 	 			
	 	 			<th><%= table_att_name %></th>
	 	 		
	 	 			<th>Date and Time of observation</th>
	 	 			<th>Date and Time of recording</th>
	 	 		</tr>
	 			<%	
	 				while(rs4.next())
	 				{ %>
	 					<tr>
	 						<td><%= rs4.getInt(1) %></td>	
	 						<td><%= rs4.getString(2) %></td>
	 						<td><%= rs4.getString(3) %></td>	
	 						<td><%= rs4.getString(4) %></td>
	 					</tr>
	 				
	 			 <% }
	 				
	 			}
	 			
	 			%>
	 	 		
	 	 	
	 	 
	 	 </table>	
	 	 <br/>
	-----------------------------------------------------------------------------------------------------------	
	<%
		}
		}
		break;
		case 3://High Risk Pregnancy
		int flag = 0;
		for(int ite =0 ;ite<i;ite++)
		{
		if(patient_class_id[ite] == 2)
			{
				flag =1;
			}
		}
		// Blood Pressure observation for sure
		%><br/> 
		<% if(flag == 0)
		{ %>
	<h3>Blood Pressure Observations for <%= patient_name %></h3>
	<%
		// Getting all mood observations
		st2 = con.createStatement();
		rs2 = st2.executeQuery("select o.ob_id,b.bp_sys,b.bp_dia,o.ob_dto,o.ob_dtr from patients p,observations o,bloodpressure b where p.pid=o.pid and o.ob_id=b.ob_id and p.pid="+pid+" order by o.ob_dto desc");
		if(rs2.isBeforeFirst() == false)
			{
	 			%>
	 		Sorry no Blood pressure observations have been made !
	 			<%
	 
	 		}
	 		else
	 		{
	 	 	%>	
	 	 <table>
	 	 	<tr>
	 	 		<th>Observation Id</th>
	 	 		<th>Systolic</th>
	 	 		<th>Diastolic</th>
	 	 		<th>Date and Time of observation</th>
	 	 		<th>Date and Time of recording</th>
	 	 	</tr>
	 	 	
	 	 
	 	 	
	 	 	
	 <% 	
	 		while(rs2.next())
	 		{
	 			%>
	 			<tr>
	 				<td><%= rs2.getInt(1)%></td>
	 				<td><%= rs2.getInt(2)%></td>
	 				<td><%= rs2.getInt(3)%></td>
	 				<td><%= rs2.getString(4)%></td>
	 				<td><%= rs2.getString(5)%></td>
	 				
	 				
	 			</tr>
	 	<% }
	 
	 		}
	 rs2.close();
	%> 
	</table>
	<br/>
	-----------------------------------------------------------------------------------------------------------
	<% } %>
	

	<h3>Pain Observations for <%= patient_name %></h3>
	<%
		// Getting all mood observations
		st2 = con.createStatement();
		rs2 = st2.executeQuery("select o.ob_id,p.pain_scale,o.ob_dto,o.ob_dtr from patients p,observations o,pain p where p.pid=o.pid and o.ob_id=p.ob_id and p.pid="+pid+" order by o.ob_dto desc");
		if(rs2.isBeforeFirst() == false)
			{
	 			%>
	 		Sorry no Pain observations have been made !
	 			<%
	 
	 		}
	 		else
	 		{
	 	 	%>	
	 	 <table>
	 	 	<tr>
	 	 		<th>Observation Id</th>
	 	 		<th>Pain Scale(1-10)</th>
	 	 		
	 	 		<th>Date and Time of observation</th>
	 	 		<th>Date and Time of recording</th>
	 	 	</tr>
	 	 	
	 	 
	 	 	
	 	 	
	 <% 	
	 		while(rs2.next())
	 		{
	 			%>
	 			<tr>
	 				<td><%= rs2.getInt(1)%></td>
	 				<td><%= rs2.getInt(2)%></td>
	 				
	 				<td><%= rs2.getString(3)%></td>
	 				<td><%= rs2.getString(4)%></td>
	 				
	 				
	 			</tr>
	 	<% }
	 
	 		}
	 rs2.close();
	%> 
	</table>
		<br/>
	-----------------------------------------------------------------------------------------------------------
	<h3>Contraction Observations for <%= patient_name %></h3>
	<%
		// Getting all mood observations
		st2 = con.createStatement();
		rs2 = st2.executeQuery("select o.ob_id,c.con_frequency,o.ob_dto,o.ob_dtr from patients p,observations o,contraction c where p.pid=o.pid and o.ob_id=c.ob_id and p.pid="+pid+" order by o.ob_dto desc");
		if(rs2.isBeforeFirst() == false)
			{
	 			%>
	 		Sorry no Contraction observations have been made !
	 			<%
	 
	 		}
	 		else
	 		{
	 	 	%>	
	 	 <table>
	 	 	<tr>
	 	 		<th>Observation Id</th>
	 	 		<th>Contraction Frequency</th>
	 	 		
	 	 		<th>Date and Time of observation</th>
	 	 		<th>Date and Time of recording</th>
	 	 	</tr>
	 	 	
	 	 
	 	 	
	 	 	
	 <% 	
	 		while(rs2.next())
	 		{
	 			%>
	 			<tr>
	 				<td><%= rs2.getInt(1)%></td>
	 				<td><%= rs2.getFloat(2)%></td>
	 				
	 				<td><%= rs2.getString(3)%></td>
	 				<td><%= rs2.getString(4)%></td>
	 				
	 				
	 			</tr>
	 	<% }
	 
	 		}
	 rs2.close();
	%> 
	</table>
		<br/>
	-----------------------------------------------------------------------------------------------------------
	
	<%	
		//Getting all Obesity - observation types and their observation tables
		Statement st5 = con.createStatement();
		ResultSet rs5 = st5.executeQuery("select ot_id from type_belongs_to_class where pc_id =3 and ot_id <>4 and ot_id<>7 and ot_id<>9 and ot_id<>1 and ot_id<>2 and ot_id<>3 and ot_id<>8");
		int[] hrp_types = new int[50];
		int d=0;
		if(rs5.isBeforeFirst() == false)
		{
			continue;
		}		
		else
		{
			// getting other observation types for HIV
			while(rs5.next())
			{
				hrp_types[d] = rs5.getInt(1);
				d++;
			}
			rs5.close();
			String hrp_ob_type_name = null;
			for(int e=0;e<d;e++)
			{
				// generate all observation tables for Obesity
				st5 = con.createStatement();
				rs5 = st5.executeQuery("select ot_name from observationtype where ot_id="+hrp_types[e]+"");
				rs5.next();
				hrp_ob_type_name = rs5.getString(1);
				rs5.close();
				//out.println(hiv_ob_type_name);
				// Generate the  required observation table
				// for that first get the required observation type's attribute
				rs5 = st5.executeQuery("select * from "+hrp_ob_type_name+"_type");
				ResultSetMetaData rsmd2 = rs5.getMetaData();
				String table_att_name = rsmd2.getColumnName(2);
				rs5.close();
				// retrieve table
				%> 
				<h3><%=hrp_ob_type_name %> observations for <%= patient_name %></h3>
				<%
	 	 
	 	  
	 	 		st5 = con.createStatement(); 
	 	 		rs5 = st5.executeQuery("select o.ob_id,t."+table_att_name+",o.ob_dto,o.ob_dtr from patients p,observations o,"+hrp_ob_type_name+"_type t where p.pid=o.pid and o.ob_id=t.ob_id and p.pid="+pid+" order by o.ob_dto desc");
	 			if(rs5.isBeforeFirst() == false)
	 			{
	 				out.println("Sorry no "+hrp_ob_type_name+" observations found");
	 			}
	 			else
	 			{ %>
	 			<table>
	 	 		<tr>
	 	 			<th>Observation ID</th>
	 	 			
	 	 			<th><%= table_att_name %></th>
	 	 		
	 	 			<th>Date and Time of observation</th>
	 	 			<th>Date and Time of recording</th>
	 	 		</tr>
	 			<%	
	 				while(rs5.next())
	 				{ %>
	 					<tr>
	 						<td><%= rs5.getInt(1) %></td>	
	 						<td><%= rs5.getString(2) %></td>
	 						<td><%= rs5.getString(3) %></td>	
	 						<td><%= rs5.getString(4) %></td>
	 					</tr>
	 				
	 			 <% }
	 				
	 			}
	 			
	 			%>
	 	 		
	 	 	
	 	 
	 	 </table>	
	 	 <br/>
	-----------------------------------------------------------------------------------------------------------	
	<%
		}
		}
		break;
		
		case 4: // COPD
		%><br/>
		<h3>Exercise Tolerance Observations for <%= patient_name %></h3>
	<%
		// Getting all exercise tolerance observations
		st2 = con.createStatement();
		rs2 = st2.executeQuery("select o.ob_id,e.et_numex,o.ob_dto,o.ob_dtr from patients p,observations o,exercisetolerance e where p.pid=o.pid and o.ob_id=e.ob_id and p.pid="+pid+" order by o.ob_dto desc");
		if(rs2.isBeforeFirst() == false)
			{
	 			%>
	 		Sorry no Exercise tolerance observations have been made !
	 			<%
	 
	 		}
	 		else
	 		{
	 	 	%>	
	 	 <table>
	 	 	<tr>
	 	 		<th>Observation Id</th>
	 	 		<th>Number of steps</th>
	 	 		
	 	 		<th>Date and Time of observation</th>
	 	 		<th>Date and Time of recording</th>
	 	 	</tr>
	 	 	
	 	 
	 	 	
	 	 	
	 <% 	
	 		while(rs2.next())
	 		{
	 			%>
	 			<tr>
	 				<td><%= rs2.getInt(1)%></td>
	 				<td><%= rs2.getFloat(2)%></td>
	 				
	 				<td><%= rs2.getString(3)%></td>
	 				<td><%= rs2.getString(4)%></td>
	 				
	 				
	 			</tr>
	 	<% }
	 
	 		}
	 rs2.close();
	%> 
	</table>
		<br/>
	-----------------------------------------------------------------------------------------------------------
	<h3>Oxygen Saturation Observations for <%= patient_name %></h3>
	<%
		// Getting all mood observations
		st2 = con.createStatement();
		rs2 = st2.executeQuery("select o.ob_id,ox.os_amt,o.ob_dto,o.ob_dtr from patients p,observations o,oxygensaturation ox where p.pid=o.pid and o.ob_id=ox.ob_id and p.pid="+pid+" order by o.ob_dto desc");
		if(rs2.isBeforeFirst() == false)
			{
	 			%>
	 		Sorry no Oxygen Saturation observations have been made !
	 			<%
	 
	 		}
	 		else
	 		{
	 	 	%>	
	 	 <table>
	 	 	<tr>
	 	 		<th>Observation Id</th>
	 	 		<th>Saturation</th>
	 	 		
	 	 		<th>Date and Time of observation</th>
	 	 		<th>Date and Time of recording</th>
	 	 	</tr>
	 	 	
	 	 
	 	 	
	 	 	
	 <% 	
	 		while(rs2.next())
	 		{
	 			%>
	 			<tr>
	 				<td><%= rs2.getInt(1)%></td>
	 				<td><%= rs2.getFloat(2)%></td>
	 				
	 				<td><%= rs2.getString(3)%></td>
	 				<td><%= rs2.getString(4)%></td>
	 				
	 				
	 			</tr>
	 	<% }
	 
	 		}
	 rs2.close();
	%> 
	</table>
		<br/>
	-----------------------------------------------------------------------------------------------------------
	
	<%	
		//Getting all Obesity - observation types and their observation tables
		Statement st6 = con.createStatement();
		ResultSet rs6 = st6.executeQuery("select ot_id from type_belongs_to_class where pc_id =4 and ot_id <>5 and ot_id<>6 and ot_id<>1 and ot_id<>2 and ot_id<>3 and ot_id<>8");
		int[] copd_types = new int[50];
		int f=0;
		if(rs6.isBeforeFirst() == false)
		{
			continue;
		}		
		else
		{
			// getting other observation types for HIV
			while(rs6.next())
			{
				copd_types[f] = rs6.getInt(1);
				f++;
			}
			rs6.close();
			String copd_ob_type_name = null;
			for(int g=0;g<f;g++)
			{
				// generate all observation tables for Obesity
				st6 = con.createStatement();
				rs6 = st6.executeQuery("select ot_name from observationtype where ot_id="+copd_types[g]+"");
				rs6.next();
				copd_ob_type_name = rs6.getString(1);
				rs6.close();
				//out.println(hiv_ob_type_name);
				// Generate the  required observation table
				// for that first get the required observation type's attribute
				rs6 = st6.executeQuery("select * from "+copd_ob_type_name+"_type");
				ResultSetMetaData rsmd3 = rs6.getMetaData();
				String table_att_name = rsmd3.getColumnName(2);
				rs6.close();
				// retrieve table
				%> 
				<h3><%=copd_ob_type_name %> observations for <%= patient_name %></h3>
				<%
	 	 
	 	  
	 	 		st6 = con.createStatement(); 
	 	 		rs6 = st6.executeQuery("select o.ob_id,t."+table_att_name+",o.ob_dto,o.ob_dtr from patients p,observations o,"+copd_ob_type_name+"_type t where p.pid=o.pid and o.ob_id=t.ob_id and p.pid="+pid+" order by o.ob_dto desc");
	 			if(rs6.isBeforeFirst() == false)
	 			{
	 				out.println("Sorry no "+copd_ob_type_name+" observations found");
	 			}
	 			else
	 			{ %>
	 			<table>
	 	 		<tr>
	 	 			<th>Observation ID</th>
	 	 			
	 	 			<th><%= table_att_name %></th>
	 	 		
	 	 			<th>Date and Time of observation</th>
	 	 			<th>Date and Time of recording</th>
	 	 		</tr>
	 			<%	
	 				while(rs6.next())
	 				{ %>
	 					<tr>
	 						<td><%= rs6.getInt(1) %></td>	
	 						<td><%= rs6.getString(2) %></td>
	 						<td><%= rs6.getString(3) %></td>	
	 						<td><%= rs6.getString(4) %></td>
	 					</tr>
	 				
	 			 <% }
	 				
	 			}
	 			
	 			%>
	 	 		
	 	 	
	 	 
	 	 </table>	
	 	 <br/>
	-----------------------------------------------------------------------------------------------------------	
	<%
		}
		}
		break;
		}// switch close
	}//while close %>
	
</body>
</html>