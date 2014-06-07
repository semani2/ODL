<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Query List</title>
</head>
<body>
<h3>Retreival Queries</h3>
<B>
1. Find patients with the lowest weight amongst HIV patients.&nbsp; <button><a href="QueryResults.jsp?query_no=1">Get Result</a></button><br/>
2. Of all Obesity and High Risk Patients, find patients with the highest blood pressure.&nbsp; <button><a href="QueryResults.jsp?query_no=2">Get Result</a></button><br/>
3. Find patients who have healthfriends with no outstanding alerts.&nbsp; <button><a href="QueryResults.jsp?query_no=3">Get Result</a></button><br/>
4. Find patients who live in same city as healthfriend.&nbsp; 

<button><a href="QueryInput4.jsp">Get Result</a></button><br/>
5. For PatientX, list their healthfriends, ordered by date in which friendships were initiated. &nbsp; <button><a href="QueryInput5.jsp">Get Result</a></button><br/>
</B>
<br/>
<br/>
<h3>Reporting Queries</h3>
<b>
1. For each patient, find the number of healthfriends made in the last month.&nbsp; <button><a href="QueryResults.jsp?query_no=6">Get Result</a></button><br/>
2. For each patient and each type of observation, show the number of such observations recorded by the patients.&nbsp; <button><a href="QueryResults.jsp?query_no=7">Get Result</a></button><br/>
3. For each patient, and each of their healthfriends, list the number of lingering alerts of the healthfriend.&nbsp; <button><a href="QueryResults.jsp?query_no=8">Get Result</a></button><br/>

</b>
</body>
</html>