<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="PatientHeader.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Signup</title>
<script type="text/javascript" src="gen_validatorv4.js">
	
</script>
<%
String error=request.getParameter("error");
if(error==null || error=="null"){
 error="";
}
%>
</head>

<body>
	
	<h2> Edit Profile!</h2><br/>
	
	<div style="color:#FF0000" id='myform_patient_name_errorloc'></div>
    <div style="color:#FF0000" id='myform_day_errorloc' ></div>
    <div style="color:#FF0000" id='myform_patient_year_errorloc' ></div>
    
    <div style="color:#FF0000" id='myform_patient_id_errorloc' ></div>
    
    <div style="color:#FF0000" id='myform_patient_password_errorloc' ></div>
    
    <div style="color:#FF0000" id='myform_patient_confirm_password_errorloc' ></div>
    
    <div style="color:#FF0000" id='myform_patient_street_errorloc' ></div>
    <div style="color:#FF0000" id='myform_patient_city_errorloc' ></div>
    <div style="color:#FF0000" id='myform_patient_state_errorloc' ></div>
    <div style="color:#FF0000" id='myform_patient_country_errorloc' ></div>
    
    
   
    <br/>
    <br/>
	<form id="myform" name="patient_registration" action="edit_pat_prof.jsp" method="post">
	
    Old Password : &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<input type="password" name="old_password" /> <br/>
    New Password : &nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="new_password" /> <br/>
    Confirm Password&nbsp;&nbsp;<input type="password" name="con_password" /> <div style="color:#FF0000"><%= error %></div><br/>
   
    
    <br>
    
    <center><input type="submit" value="Edit"/></center>
	</form>
	
	
 
<script type="text/javascript">
 var frmvalidator  = new Validator("myform");
 
 frmvalidator.addValidation("patient_name","req","Please enter your First Name");
 
 
 frmvalidator.addValidation("day","req","Day cannot be left blank");
 frmvalidator.addValidation("day","maxlen=2","Enter the correct day");
 frmvalidator.addValidation("day","numeric","Enter only numbers");
 
 
 frmvalidator.addValidation("patient_year","req","Year cannot be left blank");
 frmvalidator.addValidation("patient_year","maxlen=4","Enter the correct year ");
 frmvalidator.addValidation("patient_year","numeric","Enter only numbers");

 
 
 frmvalidator.addValidation("patient_id","req","Patient_id cannot be left blank");
 
 
 
 frmvalidator.addValidation("patient_password","minlen=6","Password has to be minimum 6 characters");
 
 frmvalidator.addValidation("patient_confirm_password","eqelmnt=patient_password",
 "The confirmed password is not same as password");
 
 frmvalidator.addValidation("patient_street","req","Street address cannot be left blank");
 frmvalidator.addValidation("patient_street","maxlen=50");
 
 frmvalidator.addValidation("patient_city","req","City cannot be left blank");
 frmvalidator.addValidation("patient_city","maxlen=50");
 
 frmvalidator.addValidation("patient_state","req","State cannot be left blank");
 frmvalidator.addValidation("patient_state","maxlen=50");
 
 frmvalidator.addValidation("patient_country","req","Country cannot be left blank");
 
 
 
 frmvalidator.EnableOnPageErrorDisplay();
 frmvalidator.EnableMsgsTogether();
 
 
 </script>
 
</body>
</html>