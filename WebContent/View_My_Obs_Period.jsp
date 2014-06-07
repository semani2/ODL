<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="PatientHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter Time Period</title>
</head>
<body>
<br/>
<h3>Please select the time period :</h3>
<br/>
<form name="form1" action="ViewObservationByDates.jsp" method=post>
Start Date: <input type="text" name="start_day" size="4" />
		<select name="start_month">
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
		<input type="text" name="start_year" size=5 />(DD:MMM:YYYY)<br/><br/>

End Date: <input type="text" name="end_day" size="4" />
		<select name="end_month">
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
		<input type="text" name="end_year" size=5 />(DD:MMM:YYYY)<br/><br/>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
   <input type="submit" value="Go"/>
</form>
<br/><br/><br/>
</body>
</html>