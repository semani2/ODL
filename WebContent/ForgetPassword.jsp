<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="PatientHeader.jsp"%>
<%
String error=request.getParameter("error");
if(error==null || error=="null"){
 error="";
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name="form1" action="forgot_password.jsp" method="post">
Enter your ID : <input type="text" name="patientid">
<br>
Date of birth : <input type="text" name="day" size="3" />
		<select name="month">
		<option value="01">January</option>
<option value="02">February</option>
<option value="03">March</option>
<option value="04">April</option>
<option value="05">May</option>
<option value="06">June</option>
<option value="07">July</option>
<option value="08">August</option>
<option value="09">September</option>
<option value="10">October</option>
<option value="11">November</option>
<option value="12">December</option>
		</select>
		<input type="text" name="year" size=4 /><br/><br/>
		<input type="submit" value="Get Password!"/>
		</form>
		<br/>
		<div><%= error %></div>
</body>
</html>