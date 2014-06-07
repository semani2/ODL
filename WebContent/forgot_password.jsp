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
	String id = request.getParameter("patientid").toString();
	String day = request.getParameter("day").toString();
	String month = request.getParameter("month").toString();
	String year = request.getParameter("year").toString();
	String date = year+"-"+month+"-"+day;
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select pdob,p_password from patients where patientid='"+id+"'");
	rs.next();
	String date1 = rs.getDate(1).toString();
	String password = rs.getString(2);
	if(date.equals(date1))
	{
		//out.println(date+"   "+date1);
		response.sendRedirect("ForgetPassword.jsp?error=Your password is :  "+password);
	}
	else{
	//out.println(date+"   "+date1);
		response.sendRedirect("ForgetPassword.jsp?error=You have entered the wrong date of birth");
	}
	
 %>

</body>
</html>