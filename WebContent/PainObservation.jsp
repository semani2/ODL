<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter your pain scale here !</title>

<script type="text/javascript" src="gen_validatorv4.js">
	
</script>
</head>
<body>
<center>
<h2>Enter your Pain Amount details</h2><br/>
<div style="color:#FF0000" id='p_form_p_amt_errorloc'></div>
<div style="color:#FF0000" id='p_form_obv_day_errorloc' ></div>
<div style="color:#FF0000" id='p_form_obv_month_errorloc' ></div>
<div style="color:#FF0000" id='p_form_obv_year_errorloc' ></div>
<div style="color:#FF0000" id='p_form_obv_hr_errorloc' ></div>
<div style="color:#FF0000" id='p_form_obv_min_errorloc' ></div>
<div style="color:#FF0000" id='p_form_obv_sec_errorloc' ></div>
<div style="color:#FF0000" id='p_form_obv_ampm_errorloc' ></div>




<form id="f2" name="p_form" action="AddPainObservation.jsp" method="post">

Pain Scale:  <select name="p_amt">

            <option value="000">Select one</option>
    		<option value="1">1</option>
    		<option value="2">2</option>
    		<option value="3">3</option>
    		<option value="4">4</option>
    		<option value="5">5</option>
    		<option value="6">6</option>
    		<option value="7">7</option>
    		<option value="8">8</option>
    		<option value="9">9</option>
    		<option value="10">10</option>
    		
    	</select><br/><br/><br/>
    	Date of observation: <input type="text" name="obv_day" size="4" />
		<select name="obv_month">
				<option value="000">Select one</option>
		
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
		<input type="text" name="obv_year" size=5 />(DD:MM:YYYY)<br/><br/>

Time of observation:<input type="text" name="obv_hr" size="4" />
                    <input type="text" name="obv_min" size="4" />
                    <input type="text" name="obv_sec" size="4" /><select name="obv_ampm">
				<option value="000">Select one</option>
				<option value="AM">AM</option>
				<option value="PM">PM</option>
		</select>(HH:MM:SS)

<br/><br/><br/>


<input type="submit" value="Submit observation"/><br/>
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
<br/>
<br/><br/><br/>

<a href="newobservation.jsp">Back to observation types</a>


</form>
<script type="text/javascript">
 var frmvalidator  = new Validator("p_form");
 
 frmvalidator.addValidation("p_amt","dontselect=000","Select a value"); 
 
 frmvalidator.addValidation("obv_day","req","Observation day cannot be left blank"); frmvalidator.addValidation("obv_year","num","Observation year has to be numeric");
 frmvalidator.addValidation("obv_day","num","Observation day has to be numeric");
 
 frmvalidator.addValidation("obv_day","gt=0","");
 frmvalidator.addValidation("obv_day","lt=32","Day value cannot exceed 31");
 
 
 frmvalidator.addValidation("obv_month","req","Observation month cannot be left blank");
 frmvalidator.addValidation("obv_month","dontselect=000","Please select a month");
 
 frmvalidator.addValidation("obv_year","req","Observation year cannot be left blank");
 frmvalidator.addValidation("obv_year","num","Observation year has to be numeric");
 frmvalidator.addValidation("obv_year","minlen=4","");
 frmvalidator.addValidation("obv_year","maxlen=4","");
 
 frmvalidator.addValidation("obv_hr","req","Hour of observation cannot be left blank");
 frmvalidator.addValidation("obv_hr","num","Hour of observation has to be a number");
 frmvalidator.addValidation("obv_hr","gt=0","Hour has to be minimum 1");
 frmvalidator.addValidation("obv_hr","lt=13","Hour can have a value 1-12");
 
 frmvalidator.addValidation("obv_min","req","Minutes of observation cannot be left blank");
 frmvalidator.addValidation("obv_min","num","Minutes of observation has to be a number");
 frmvalidator.addValidation("obv_min","lt=61","Minutes can have a value 1-60");
 
 
 frmvalidator.addValidation("obv_sec","req","Seconds of observation cannot be left blank");
 frmvalidator.addValidation("obv_sec","num","Seconds of observation has to be a number");
 frmvalidator.addValidation("obv_sec","lt=61","Seconds can have a value 1-60");
 
 frmvalidator.addValidation("obv_ampm","dontselect=000","Please select AM or PM");
 
 
 
 frmvalidator.EnableOnPageErrorDisplay();
 frmvalidator.EnableMsgsTogether();
 </script>

</center>
</body>
</html>