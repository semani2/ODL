<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
	// JDBC CONNECTION
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797"); 
		String patient_id = request.getParameter("patient_id");
		int pc_id= Integer.parseInt(request.getParameter("class"));
		//out.println(patient_id+"   "+pc_id);
		// Checking if patient exists
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("select pid from patients where patientid='"+patient_id+"'");
		if(rs1.next() == true)
		{
			// Patient exists
			
			rs1.close();
			// Getting pid from patient class
			Statement st3 = con.createStatement();
			ResultSet rs3 = st3.executeQuery("select pid from patients where patientid='"+patient_id+"'");
			rs3.next();
			int pid = rs3.getInt(1);
			rs3.close();
			// Checking if the patient belongs to that particular class
			Statement st2 = con.createStatement();
			ResultSet rs2 = st2.executeQuery("select * from patient_belongs_to_class where pc_id="+pc_id+" AND pid="+pid+"");
			if(rs2.next() == true)
			{
				// Patient already belongs to the selected class
				response.sendRedirect("AssignPatientClass.jsp?error=Patient already belongs to the selected class");
				rs2.close();
			}
			else
			{
				//Assigning patient to class
				rs2.close();
				Statement st4 = con.createStatement();
				//out.println(pc_id+""+pid);
				st4.executeUpdate("insert into patient_belongs_to_class values("+pid+","+pc_id+")");
				// Removing patient from general if he has been assigned to another class
				//Statement st5 = con.createStatement();
				//ResultSet rs4 = st5.executeQuery("select * from patient_belongs_to_class where pid="+pid+" AND pc_id=5");
				// checking if already removed from general
				/* if(rs4.next() == true)
				{
					//Remove him
					rs4.close();
					Statement st6 = con.createStatement();
					st6.executeUpdate("delete from patient_belongs_to_class where pid="+pid+" AND pc_id=5");
				}
				else
				{
					// Already removed
					rs4.close();
				}
				 */
				response.sendRedirect("AssignPatientClass.jsp?message=Patient Successfully added");
				
			}
		}
		else
		{
			// Patient doesnt Exist
			String message ="Patient with ID :"+patient_id+" doesnt exist!";
			response.sendRedirect("AssignPatientClass.jsp?error="+message);
		}
		
	%>
</body>
</html>