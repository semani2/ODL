<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="HealthProfHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Patient Name</title>
</head>
<body>
<%
String error=request.getParameter("error");
if(error==null || error=="null"){
 error="";
}
%>
	<br/>
	<br/>
	<div style="color:#FF0000"><%= error %></div>
	<h3>View Patient By Name</h3> <br/>
	<form name="form1" action="view_patient_by_name.jsp" method="post">
	Enter Patient Name : <input type="text" name="pat_name" size=25/>
	<br/><br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Search"/>
	</form>
</body>
</html>