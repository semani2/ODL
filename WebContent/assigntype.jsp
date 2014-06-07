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
	int obs_type = Integer.parseInt(request.getParameter("obs_type"));
	int illness = Integer.parseInt(request.getParameter("illness"));
	//out.println(obs_type+" "+illness);
	//Checking if type already in illness
	Statement st1 = con.createStatement();
	ResultSet rs1 = st1.executeQuery("select * from type_belongs_to_class where ot_id="+obs_type+" AND pc_id="+illness+"");
	if(rs1.next()== true)
	{
		// Type Already present in illness
		rs1.close();
		response.sendRedirect("AssignTypeClass.jsp?error=Type Already present in Illness Class!");
	}
	else
	{
		//Not present and has to be added
		rs1.close();
		Statement st2= con.createStatement();
		st2.executeUpdate("insert into type_belongs_to_class values("+obs_type+","+illness+")");
		response.sendRedirect("AssignTypeClass.jsp?message=Observation Type has been added to the Illness");
	}
	
	%>
	

</body>
</html>