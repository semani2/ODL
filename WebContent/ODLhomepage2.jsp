<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
String error=request.getParameter("error");
if(error==null || error=="null"){
 error="";
}
%>
   <% if(session.getAttribute("professional_id")!=null) 
        response.sendRedirect("HealthProfessionalCannotLogin.jsp"); 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home page</title>

<script type="text/javascript" src="gen_validatorv4.js">	
</script>

</head>
<body>
<h1 align="center">Welcome Health Professionals </h1>

<div style="color:#FF0000" id='myform_hpid_errorloc' ></div>
    
    <div style="color:#FF0000" id='myform_hp_password_errorloc' ></div>
    <br/>
    <br/>


<form id="myform" name="hp_login" action="hp_login.jsp" method="post">
<h3>Please enter your credentials to login:</h3>
 

	<div><%=error%></div>
    Health Professional ID : <input type="text" name="hpid" size = 25 /> 
    <br/>
    Password : <input type="password" name="hp_password" /><br/>
    <br/>
     <button name="hp_login">Log in</button>
     <br/>
     <br/>
    

</form>

<script type="text/javascript">

 var frmvalidator  = new Validator("myform");
 
 frmvalidator.addValidation("hpid","req","ID cannot be left blank");
 
 
 
 frmvalidator.addValidation("hp_password","minlen=6","Password has to be minimum 6 characters");


 
 frmvalidator.EnableOnPageErrorDisplay();
 frmvalidator.EnableMsgsTogether();
 
 </script>



</body>
</html>