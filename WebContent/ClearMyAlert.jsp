<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
 <%@ page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797");
	Statement st=con.createStatement();
	int alert_id=Integer.parseInt(request.getParameter("aid").toString());
	st.executeUpdate("update alerts set alert_viewed='y' where a_id="+alert_id+"");
	response.sendRedirect("ViewAndClearMyAlerts.jsp?message=Your alert has been cleared successfully!");
 %>

</body>
</html>