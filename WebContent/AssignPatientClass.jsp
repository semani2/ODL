<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="HealthProfHeader.jsp"%>
<%
String error=request.getParameter("error");
if(error==null || error=="null"){
 error="";
}
String message=request.getParameter("message");
if(message==null || message=="null"){
 message="";
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Patients to Classes</title>
</head>
<body>
<%  // JDBC CONNECTION
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797"); %>
	<h2>Assigning Patients to Class</h2><br/>
	<div style="color:#00FF00"><%=message%></div><br/>
	<form name="form1" action="assignpatient.jsp" method="post">
	Enter Patient ID : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=text name="patient_id"/> &nbsp; &nbsp; <div style="color:#FF0000"><%=error%></div><br/>
	Select Class to be assigned : <select name="class"><option value="null">Select</option>
	<%
		Statement st3 = con.createStatement();
		ResultSet rs = st3.executeQuery("select pc_id,pc_name from patientclass where pc_id=1 OR pc_id=2 OR pc_id=3 OR pc_id=4 ");	 
		while(rs.next()){ %>	
			<option value="<%= rs.getInt(1)%>"><%= rs.getString(2) %></option>
		
	<%
		}
	
		rs.close();
	 %>
	 </select>
	<br/>
	<input type="submit" value="Assign Patient"/>
	</form>
	
	<h3>Listing Patients</h3>
	<table>
		<tr>
			<th>Patient ID</th>
			<th>Patient Name</th>
			<th>Age</th>
			<th>Sex</th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
		<%
			Statement st1=con.createStatement();
			ResultSet rs1 = st1.executeQuery("select pid,patientid,pname,p_age,psex from patients");
			
			while(rs1.next())
			{
				// Itearating all patients
				%>
			<tr>
			<td><%= rs1.getString(2) %></td>
			<td><%= rs1.getString(3) %></td>
			<td><%= rs1.getString(4) %></td>
			<td><%= rs1.getString(5) %></td>
			<% 
				Statement st2 = con.createStatement();
				ResultSet rs2 = st2.executeQuery("select pc_id from patient_belongs_to_class where pid="+rs1.getInt(1)+"");
				while(rs2.next())
				{
					// Iterating classes of patients
					//Checking for HIV
					if(rs2.getInt(1) == 1){
						//HIV Present
						%><td>HIV</td><%
						
						}
					if(rs2.getInt(1) == 2){
						//Obesity Present
						%><td>Obesity</td><%
						
						}
					if(rs2.getInt(1) == 3){
						//Obesity Present
						%><td>High Risk Pregnancy</td><%
						
						}
						if(rs2.getInt(1) == 4){
						//Obesity Present
						%><td>COPD</td><%
						
						}
										
				}
			rs2.close();	
			%>
			</tr>
			
			<% }
			 rs1.close();
		 %>
	</table>
</body>
</html>