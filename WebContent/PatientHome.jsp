<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="javax.sql.*" %>
 <%@ page import="java.io.*" %>
 <%@ page import="java.text.*" %>
 <%@page import="java.util.Calendar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="PatientHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to ODL</title>


</head>
<body >

<center>
<h1> Hello <%=session.getAttribute("patient_name") %> </h1>
<br/>
<%!
 
public static int countDiffDay(Calendar c1, Calendar c2) {
    int returnInt = 0;
    while (!c1.after(c2)) {
      c1.add(Calendar.DAY_OF_MONTH, 1);
      returnInt++;
    }

    if (returnInt > 0) {
      returnInt = returnInt - 1;
    }

    return (returnInt);
  }
  public static java.util.Date makeDate(String dateString) throws Exception {
    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
    return formatter.parse(dateString);
  }
   public static int diff(java.util.Date date1, java.util.Date date2) {
    Calendar c1 = Calendar.getInstance();
    Calendar c2 = Calendar.getInstance();

    c1.setTime(date1);
    c2.setTime(date2);
    int diffDay = 0;

    if (c1.before(c2)) {
      diffDay = countDiffDay(c1, c2);
    } else {
      diffDay = countDiffDay(c2, c1);
    }

    return diffDay;
  }
  %>
<% Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797"); 
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	int pid1= Integer.parseInt(session.getAttribute("pid").toString());
	int flag = 0;
	ResultSet rs1 = st1.executeQuery("select max(ob_dtr) from observations where pid="+pid1+"");
	rs1.next();
	java.util.Date date = rs1.getDate(1);
	rs1.close();
	int diff =0;
	if(date == null)
	{
		flag = 1;
	}
	else
	{
	
	
	java.util.Date dNow = new java.util.Date();
	SimpleDateFormat formatter=new SimpleDateFormat("MM/dd/YYYY");
	String date_today = formatter.format(dNow); // todays date
	//out.println(date);
	String date_of_obs = formatter.format(date); // most recent observation date
	
	 java.util.Date d1 = makeDate(date_today);
    java.util.Date d2 = makeDate(date_of_obs);
	diff = diff(d1,d2); // No of days between most recent observation and current date
	
   }
    
	if(diff>=7 || flag ==1){
 %>
 <div style="color:#FF0000">You have not made any observation(s) in the last week.</div>
 <% } 
 %>
<h2>
<a href="newobservation.jsp">Enter Observations</a></h2>

<h2>
<a href="NewObservationTypePatient.jsp">Add a new observation type</a></h2>

<h2><a href="View_My_Obs_Period.jsp">View Observations</a></h2>


<h2><a href="ViewAndClearMyAlerts.jsp">View my Alerts</a><br/></h2>



<h2><a href="ManageHealthFriends.jsp">Manage Health Friends</a></h2>
<br/>

<h2><a href="EditProfile.jsp">Edit Your Profile</a></h2>
</center>
<%
	if(session.getAttribute("flag") == null)
	{
	session.setAttribute("flag","ok");
	// Application instantiating messages to health friends if they have not cleared alerts since a week
	// Step-1 : retreive all health friends first 
	java.util.Date dNow1 = new java.util.Date();
	
	SimpleDateFormat formatter1=new SimpleDateFormat("MM/dd/YYYY");
	String date_now = formatter1.format(dNow1);
	java.util.Date d3  = makeDate(date_now);
    java.util.Date d4 ;
	ResultSet rs3,rs4 = null;
	String hf_name = null;
	Statement st5 = con.createStatement();
	Statement st_hf= con.createStatement();
	pid1 = Integer.parseInt(session.getAttribute("pid").toString());
	ResultSet rs2=st_hf.executeQuery("select p.pname,p.pid from patients p where p.pid IN((select DISTINCT h.pid_2 from healthfriends h where h.pid_1="+pid1+")UNION(select DISTINCT h.pid_1 from healthfriends h where h.pid_2="+pid1+"))");
	
	if(rs2.isBeforeFirst() == false)
	{
		// No health friends nothing can be done
	}
	else
	{
	 while(rs2.next())
	 	{
	 	// Iterate over each health friend and check for their outstanding alerts
	 	int alert_flag =0;
	 	hf_name = rs2.getString(1);
	 		rs3 = st2.executeQuery("select o.ob_dtr from observations o,alerts a where o.ob_id=a.ob_id and a.alert_viewed='n' and a.pid="+rs2.getInt(2)+"");
	 		// For each observation date check whether it is in the last one week or no 
	 		while(rs3.next())
	 		{
	 			// iterating over each observation date and checking if it is more than a week or no if yes will set a flag
	 			int diff1=0;
	 			java.util.Date date_of_hf_ob = rs3.getDate(1);
	 			String date_of_hf_obs = formatter1.format(date_of_hf_ob);
	 			d4 = makeDate(date_of_hf_obs);
	 			diff1 = diff(d3,d4);
	 			if(diff1 >= 7)
	 			{
	 				alert_flag = 1;
	 			}
	 		}	
	 		if(alert_flag == 1)
	 		{
	 		// Send message to current user from his health friend about pending alerts
	 		int message_id =0;
	 		rs4 = st1.executeQuery("select max(message_id) from messages");
			if(rs4.isBeforeFirst() == false)
			{   // First entry in messages table
				message_id = 1;
			}
			else
			{ // increment message_id counter
				rs4.next();
				message_id = rs4.getInt(1);
				rs4.close();
				message_id++;
			}
			// Send message now
			int receiver_pid = pid1;
			String message = "Your friend "+hf_name+" has not viewed his alerts since a week.";
			st5.executeUpdate("insert into messages(message_id,receiver_pid,message,message_viewed) values("+message_id+","+receiver_pid+",'"+message+"','n')");
			
	 	}
	 	}
	 	response.sendRedirect("PatientHome.jsp");
	}
}

 %>
</body>
</html>