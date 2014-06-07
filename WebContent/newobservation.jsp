<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
             <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="PatientHeader.jsp"%>
<% String message=request.getParameter("message");
if(message==null || message=="null"){
 message="";
}%>
<% String error=request.getParameter("error");
if(error==null || error=="null"){
 error="";
}%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Make a new observation</title>
</head>
<body>
<%
	int pid = Integer.parseInt(session.getAttribute("pid").toString());
	int[] pc_id = new int[10];
	int a=0;
	int flag = 0;
	int gen_ite = 0;
	// JDBC CONNECTION
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797");  
	Statement st1 = con.createStatement();
	ResultSet rs1 = st1.executeQuery("select pc_id from patient_belongs_to_class where pid="+pid+" and pc_id<>5");
	while(rs1.next())
	{
		pc_id[a] = rs1.getInt(1);
		a++;
	}
	rs1.close();
	
 %>
<center>

 <h2>Select the observation type:</h2><br/>
 <div style="color:#00FF00"><%=message%></div><br/><div style="color:#FF0000"><%=error%></div><br/>
 <a href="DietObservation.jsp">Diet</a><br/><br/>
 <a href="WeightObservation.jsp">Weight</a><br/><br/>
 <a href="ExerciseObservation.jsp">Exercise</a><br/><br/>
 <a href="MoodObservation.jsp">Mood</a><br/><br/>
 <a href="BloodPressureObservation.jsp">Blood Pressure</a><br/><br/>
 <%
 	// for other general observations
 	int[] gen_types = new int[50];
 	Statement st_gen = con.createStatement();
 	ResultSet rs_gen = st_gen.executeQuery("select ot_id from observationtype where (ot_id<>1 and ot_id<>2 and ot_id<>3 and ot_id<>8) and ot_id<>7 and ot_id<>9");
  	if(rs_gen.isBeforeFirst() == false)
  	{}
  	else
  	{
  	
		while(rs_gen.next())
		{
			gen_types[gen_ite] = rs_gen.getInt(1);
			gen_ite++;
		}  	
		rs_gen.close();
		for(int gen=0;gen<gen_ite;gen++)
 		 	{
 		 		// Display all those custom types
 		 		Statement st_gen1 = con.createStatement();
 		 		ResultSet rs_gen1 = st_gen1.executeQuery("select ot_name from observationtype where ot_id="+gen_types[gen]+"");
 		 		rs_gen1.next();
 		 		String gen_type_name = rs_gen1.getString(1);
 		 		rs_gen1.close();
 		 		%>
 		 		<a href="CustomObservation.jsp?obs_name=<%= gen_type_name%>"><%=gen_type_name %></a><br/><br/>	
 		 <%	}
  	}
  
  %>
 <%
 	for(int b=0;b<a;b++)
 	{
 		switch(pc_id[b]){
 		case 1: // HIV
 		 %><a href="TemperatureObservation.jsp">Temperature</a><br/><br/><% 
 		 int[] hiv_types = new int[10];
 		 Statement st2 = con.createStatement();
 		 ResultSet rs2 = st2.executeQuery("select ot_id from type_belongs_to_class where pc_id=1 and (ot_id<>10 and ot_id<>1 and ot_id <>2 and ot_id<>3)");
 		 if(rs2.isBeforeFirst() == false)
 		 	continue;
 		 else
 		 {
 		 	int e = 0;
 		 	while(rs2.next())
 		 	{
 		 	// getting ob_types of HIV
 		 		hiv_types[e] = rs2.getInt(1);
 		 		e++;
 		 	}
 		 	rs2.close();
 		 	for(int f=0;f<e;f++)
 		 	{
 		 		// Display all those custom types
 		 		st2 = con.createStatement();
 		 		rs2 = st2.executeQuery("select ot_name from observationtype where ot_id="+hiv_types[f]+"");
 		 		rs2.next();
 		 		String hiv_type_name = rs2.getString(1);
 		 		rs2.close();
 		 		%>
 		 		<a href="CustomObservation.jsp?obs_name=<%= hiv_type_name%>"><%=hiv_type_name %></a><br/><br/>	
 		 <%	}
 		 }
 		 break;
 		 
 		 case 2: // Obesity
 		 %> <a href="BloodPressureObservation.jsp">Blood pressure</a><br/><br/>
 		 <%int[] obe_types = new int[10];
 		 Statement st3 = con.createStatement();
 		 ResultSet rs3 = st3.executeQuery("select ot_id from type_belongs_to_class where pc_id=2 and ot_id<>4 and ot_id<>1 and ot_id <>2 and ot_id<>3 and ot_id<>8");
 		 if(rs3.isBeforeFirst() == false)
 		 	continue;
 		 else
 		 {
 		 	int x = 0;
 		 	while(rs3.next())
 		 	{
 		 	// getting ob_types of HIV
 		 		obe_types[x] = rs3.getInt(1);
 		 		x++;
 		 	}
 		 	rs3.close();
 		 	for(int y=0;y<x;y++)
 		 	{
 		 		// Display all those custom types
 		 		st3 = con.createStatement();
 		 		rs3 = st3.executeQuery("select ot_name from observationtype where ot_id="+obe_types[y]+"");
 		 		rs3.next();
 		 		String obe_type_name = rs3.getString(1);
 		 		rs3.close();
 		 		%>
 		 		<a href="CustomObservation.jsp?obs_name=<%= obe_type_name%>"><%=obe_type_name %></a><br/><br/>	
 		 <%	}
 		 }
 		 
 		 break;
 		 
 		 case 3: //HRP
 		 %><a href="PainObservation.jsp">Pain</a><br/><br/>
 		 <a href="ContractionObservation.jsp">Contraction</a><br/><br/>
 		 <%
 		 	for(int d=0;d<a;d++)
 		 	{
 		 		if(pc_id[d] == 2)
 		 		{
 		 			flag =1;
 		 		}
 		 	}
 		 	if(flag==0)
 		 	{
 		  %>
 		 	<a href="BloodPressureObservation.jsp">Blood pressure</a><br/><br/>
 		  <%
 		  }
 		  int[] hrp_types = new int[10];
 		 Statement st4 = con.createStatement();
 		 ResultSet rs4 = st4.executeQuery("select ot_id from type_belongs_to_class where pc_id=3 and ot_id<>4 and ot_id<>7 and ot_id<>9 and ot_id<>1 and ot_id <>2 and ot_id<>3 and ot_id<>8");
 		 if(rs4.isBeforeFirst() == false)
 		 	continue;
 		 else
 		 {
 		 	int g = 0;
 		 	while(rs4.next())
 		 	{
 		 	// getting ob_types of HIV
 		 		hrp_types[g] = rs4.getInt(1);
 		 		g++;
 		 	}
 		 	rs4.close();
 		 	for(int h=0;h<g;h++)
 		 	{
 		 		// Display all those custom types
 		 		st4 = con.createStatement();
 		 		rs4 = st4.executeQuery("select ot_name from observationtype where ot_id="+hrp_types[h]+"");
 		 		rs4.next();
 		 		String hrp_type_name = rs4.getString(1);
 		 		rs4.close();
 		 		%>
 		 		<a href="CustomObservation.jsp?obs_name=<%= hrp_type_name%>"><%=hrp_type_name %></a><br/><br/>	
 		 <%	}
 		 }
 		  break;
 		  
 		  case 4: // COPD
 		  %> 
 		  <a href="ExerciseToleranceObservation.jsp">Exercise tolerance</a><br/><br/>
  		  <a href="OxygenSaturationObservation.jsp">Oxygen Saturation</a><br/><br/>
        <%
        
        int[] copd_types = new int[10];
 		 Statement st5 = con.createStatement();
 		 ResultSet rs5 = st5.executeQuery("select ot_id from type_belongs_to_class where pc_id=4 and ot_id<>7 and ot_id<>5 and ot_id<>6 and ot_id<>1 and ot_id <>2 and ot_id<>3 and ot_id<>8 ");
 		 if(rs5.isBeforeFirst() == false)
 		 	continue;
 		 else
 		 {
 		 	int j = 0;
 		 	while(rs5.next())
 		 	{
 		 	// getting ob_types of HIV
 		 		copd_types[j] = rs5.getInt(1);
 		 		j++;
 		 	}
 		 	rs5.close();
 		 	for(int k=0;k<j;k++)
 		 	{
 		 		// Display all those custom types
 		 		st5 = con.createStatement();
 		 		rs5 = st5.executeQuery("select ot_name from observationtype where ot_id="+copd_types[k]+"");
 		 		rs5.next();
 		 		String copd_type_name = rs5.getString(1);
 		 		rs5.close();
 		 		%>
 		 		<a href="CustomObservation.jsp?obs_name=<%= copd_type_name%>"><%=copd_type_name %></a><br/><br/>	
 		 <%	}
 		 }
 		  break;
 		}
 	
 	}
 
  %>
 	
  
  
  
 
  
 
  
  
  
  
  </center>
 
  
 
 
 


</body>
</html>