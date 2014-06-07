<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a new observation type !</title>

<script type="text/javascript" src="gen_validatorv4.js">
	
</script>
</head>
<body>
<center>
<div style="color:#FF0000" id='nt_form_nt_type_errorloc'></div>
<div style="color:#FF0000" id='nt_form_nt_amt_errorloc' ></div>


<h2>Add a new observation type:</h2>

<form id="f1" name="nt_form" action="" method="post">

New type: <input type="text" name="nt_type"/><br/><br/>

Category:<select name="nt_cat">

<option value="general">General</option>
<option value="1">Behavioral</option>

<option value="2">Physiological</option>
<option value="3">Psychological</option>

</select><br/>
<br/>
Attribute: <input type="text" name="nt_amt"/><br/><br/>

<br/>
<br/>

<input type="submit" value="Submit "/><br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/><br/><br/>

<a href="newobservation.jsp">Back to observation types</a>

</form>

<script type="text/javascript">
 var frmvalidator  = new Validator("nt_form");
 
 frmvalidator.addValidation("nt_type","req","Type cannot be left blank");
 frmvalidator.addValidation("nt_amt","req","Value cannot be left blank");
 
 
 frmvalidator.EnableOnPageErrorDisplay();
 frmvalidator.EnableMsgsTogether();
 
 
 </script>
</center>
</body>
</html>