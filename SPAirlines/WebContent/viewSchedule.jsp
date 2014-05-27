<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css" type="text/css" media="all">
<title>SP Airlines</title>
</head>
<body id="page1">
<%
      try{
    		Class.forName("com.mysql.jdbc.Driver");
    		String connURL="jdbc:mysql://localhost/spairline?user=root&password=abc12345";
    		Connection conn = DriverManager.getConnection(connURL);
    		Statement stmt = conn.createStatement();
    		String m = request.getParameter("m");
    		if (m!=null){
    			if (m.equals("failure")){
    				%><script type="text/javascript">
    				    alert("You have failed in deleting, please try again.");
    				</script> <%
    			}else if (m.equals("success")){
    				%><script type="text/javascript">
    					alert("You have succeeded in deleting!");
    				</script> <%	}
    		}
    		else {}
      }
	  catch(Exception e){
			out.println("Error Occured. This is the error obtained : " + e);
			out.println("<br/>");
			out.println("Click <a href=\"adminPage.jsp\">here</a> to go back.");
		}
    		%>
<div class="body1">
  <div class="main">
    <header>
      <div class="wrapper">
       <h1><a href="index.html">SP Airlines</a><span id="slogan">Travel to Places You've Never Imagined</span></h1>
        <div class="right">
            <ul id="menu">
              <li><a href="signin.html">Sign In</a></li>
              <li><a href="countries.html">Countries</a></li>
              <li><a href="viewNow.jsp">Flight Schedules</a></li>
              <li><a href="help.html">Help Desk</a></li>
            </ul>
        </div>
      </div>
    </header>
  </div>
</div>
<div class="main">
  <div id="banner">
    </div>
</div>
<div class="main">
  <div id="content">
    <div class="col">
	  <h2>Welcome Admin! What do you want to do today?</h2>
 <ul>
  	 <li><a href='viewCost.jsp'>View/Delete Cost of Flights</a></li>
	 <li><a href='viewSchedule.jsp'>View/Delete Schedule</a></li>
	 <li><a href='viewAircraft.jsp'>View/Delete Aircraft</a></li>
	 <li><a href='viewLayover.jsp'>View/Delete Layover</a></li>
	 <li><a href='adminInsertCost.jsp'>Insert Cost of Flights</a></li>
	 <li><a href='adminInsertAircraft.jsp'>Insert Aircraft</a></li>
	 <li><a href='adminInsertSchedule.jsp'>Insert Schedule</a></li>
	 <li><a href='adminInsertLayover.jsp'>Insert Layover</a></li>
	 <li><a href='adminUpdateCost.jsp'>Update Cost of Flights</a></li>
	 <li><a href='adminUpdateSchedule.jsp'>Update Schedule</a></li>
	 <li><a href='adminUpdateAircraft.jsp'>Update Aircraft</a></li>
	 <li><a href='adminUpdateLayover.jsp'>Update Layover</a></li>
	 </ul>  
	 </div>
	 
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	String connURL="jdbc:mysql://localhost/spairline?user=root&password=abc12345";
	Connection conn = DriverManager.getConnection(connURL);
	Statement stmt = conn.createStatement();
	String sqlStr="select * from spairline.schedule";
	ResultSet rs = stmt.executeQuery(sqlStr);
	
	out.println("<table>");
	out.println("<tr>");
	out.println("<td>"+ "Schedule ID" + "</td>");
	out.println("<td>"+ "Destination Country" + "</td>");
	out.println("<td>"+ "Destination Airport" + "</td>");
	out.println("<td>"+ "Origin Country" + "</td>");
	out.println("<td>"+ "Origin Airport" + "</td>");
	out.println("<td>"+ "Departure Date" + "</td>");
	out.println("<td>"+ "Departure Time" + "</td>");
	out.println("<td>"+ "Arrival Date" + "</td>");
	out.println("<td>"+ "Arrival Time" + "</td>");
	out.println("<td>"+ "Duration" + "</td>");
	out.println("<td>"+ "Aircraft ID" + "</td>");
	out.println("<td>"+ "Employee ID" + "</td>");
	out.println("<td>"+ "Delete?" + "</td>");
	out.println("</tr>");
	
	while(rs.next()){
		String scheduleID=rs.getString("scheduleID");
		String destCountry=rs.getString("destCountry");
		String destAirport=rs.getString("destAirport");
		String originCountry=rs.getString("originCountry");
		String originAirport=rs.getString("originAirport");
		String departDate=rs.getString("departDate");
		String departTime=rs.getString("departTime");
		String arriveDate=rs.getString("arriveDate");
		String arriveTime=rs.getString("arriveTime");
		String duration=rs.getString("duration");
		int aircraftId=rs.getInt("aircraftID");
		int employeeId=rs.getInt("employeeID");
		out.println("<tr>");
		out.println("<td>"+ scheduleID + "</td>");
		out.println("<td>"+ destCountry + "</td>");
		out.println("<td>"+ destAirport + "</td>");
		out.println("<td>"+ originCountry + "</td>");
		out.println("<td>"+ originAirport + "</td>");
		out.println("<td>"+ departDate + "</td>");
		out.println("<td>"+ departTime + "</td>");
		out.println("<td>"+ arriveDate + "</td>");
		out.println("<td>"+ arriveTime + "</td>");
		out.println("<td>"+ duration + "</td>");
		out.println("<td>"+ aircraftId + "</td>");
		out.println("<td>"+ employeeId + "</td>");
		out.println("<form action=\"processDeleteSchedule.jsp\">");
		out.println("<input type=\"hidden\" name=\"hidden\" value="+scheduleID+" />");
		out.println("<td>"+ "<input type=\"submit\" name=\"btnSubmit\" value=\"Delete\">" + "</td>");
		out.println("</form>");
		out.println("</tr>");
	}
}catch(Exception e){
	out.println("Error Occured. This is the error obtained : " + e);
	out.println("<br/>");
	out.println("Click <a href=\"adminPage.jsp\">here</a> to go back.");
}
	%>
</div>
</div>	
	
</body>
</html>