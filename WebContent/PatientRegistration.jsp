<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
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
<title>Patient Signup</title>
<script type="text/javascript" src="gen_validatorv4.js">
	
</script>
</head>

<body>

	<h2> Patient SignUp!</h2><br/>
	
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
	<form id="myform" name="patient_registration" action="pat_reg.jsp" method="post">
	Name : <input type="text" name="patient_name" /><br/>
	Date of birth : <input type="text" name="day" size="3" />
		<select name="month">
		<option value="jan">January</option>
<option value="feb">February</option>
<option value="mar">March</option>
<option value="apr">April</option>
<option value="may">May</option>
<option value="jun">June</option>
<option value="jul">July</option>
<option value="aug">August</option>
<option value="sep">September</option>
<option value="oct">October</option>
<option value="nov">November</option>
<option value="dec">December</option>
		</select>
		<input type="text" name="patient_year" size=4 /><br/>
		Age : <input type=text , name="patient_age"/>
		<BR/>
    Sex: <select name="sex">
    		<option value="m">Male</option>
    		<option value="f">Female</option>
    	</select><br/>
    Friend Status : <select name="public_status">
    	<option value="y">Public</option>
    	<option value="n">Private</option>
    </select><br/>
    Patient ID : <input type="text" name="patient_id" size = 25 /> <div style="color:#FF0000"><%= error %> </div></br>
    <br/>
    Password : <input type="password" name="patient_password" /><br/>
    Confirm Password : <input type="password" name="patient_confirm_password" /><br/>
    <br/>
   <U>Address &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  </U><br/>  <br/>  
    Street : <input type="text" name="patient_street" size =30/><br/>
    City : <input type="text" name="patient_city" /><br/>
    Zipcode : <input type="text" name="patient_zipcode" /><br/>
    State :<input type="text" name="patient_state" /><br/>
    Country : <input type="text" name="patient_country" /><br/>
    <br>
    
    <center><input type="submit" value="Register"/></center>
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