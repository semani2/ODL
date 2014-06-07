<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
String error=request.getParameter("error");
if(error==null || error=="null"){
 error="";
}
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home page</title>

<script type="text/javascript" src="gen_validatorv4.js">	
</script>
<% 
if(session.getAttribute("pid")!=null)
response.sendRedirect("PatientCannotLogin.jsp");
 %>
</head>
<body>
<h1 align="center">Welcome </h1>

<div style="color:#FF0000" id='myform_patient_id_errorloc' ></div>
    
    <div style="color:#FF0000" id='myform_patient_password_errorloc' ></div>
    <br/>
    <br/>


<form id="myform" name="patient_login" action="patient_login.jsp" method="post">
<h3>Please enter your credentials to login:</h3>
 

	<div><%=error%></div>
    Patient ID  : <input type="text" name="patient_id" size = 25 /> 
    <br/>
    Password : <input type="password" name="patient_password" /><br/>
    <br/>
     <button name="p_login">Log in</button>
     <br/>
     <br/>
    New Patient? <a href="PatientRegistration.jsp">Sign Up</a>
   <br/>
   <a href="ForgetPassword.jsp">Forgot Password?</a>
</form>

<script type="text/javascript">

 var frmvalidator  = new Validator("myform");
 
 frmvalidator.addValidation("patient_id","req","Email cannot be left blank");
 
 
 
 frmvalidator.addValidation("patient_password","minlen=6","Password has to be minimum 6 characters");


 
 frmvalidator.EnableOnPageErrorDisplay();
 frmvalidator.EnableMsgsTogether();
 
 </script>



</body>
</html>

