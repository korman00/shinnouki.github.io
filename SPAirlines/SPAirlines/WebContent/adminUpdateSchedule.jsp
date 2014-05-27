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
    				    alert("You have failed in your update, please try again.");
    				</script> <%
    			}else if (m.equals("success")){
    				%><script type="text/javascript">
    					alert("You have succeeded in your update! Please click on View/Delete Schedule to double check the information inserted.");
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
      <div>
      Enter a schedule ID to update. <br/>
      <form action="processUpdateSchedule.jsp">
      Schedule ID : <select name="scheduleID"><%
      try{
    		Class.forName("com.mysql.jdbc.Driver");
    		String connURL="jdbc:mysql://localhost/spairline?user=root&password=abc12345";
    		Connection conn = DriverManager.getConnection(connURL);
    		Statement stmt = conn.createStatement();
    		String sqlStr="select distinct scheduleID from spairline.schedule";
    		ResultSet rs = stmt.executeQuery(sqlStr);
    		
    		while(rs.next()){
    			String scheduleID=rs.getString("scheduleID");
    			out.println("<option value='"+scheduleID+"'>"+scheduleID+"</option>");
    		}
    		rs.close();
    	}catch(Exception e){
    		out.println("Error Occured. This is the error obtained : " + e);
    		out.println("<br/>");
    		out.println("Click <a href=\"adminPage.jsp\">here</a> to go back.");
    	}
      %> </select><br/>
      What do you want to update?
      <select name="selectUpdate">
	  <option value="destCountry">Destination Country</option>
	  <option value="destAirport">Destination Airport</option>
	  <option value="originCountry">Origin Country</option>
	  <option value="originAirport">Origin Airport</option>
	  <option value="departDate">Departure Date (YYYY-MM-DD )</option>
	  <option value="departTime">Departure Time (HH:MM)</option>
	  <option value="arriveDate">Arrival Date (YYYY-MM-DD )</option>
	  <option value="arriveTime">Arrival Time (HH:MM)</option>
	  <option value="duration">Duration</option>
	  <option value="aircraftID">Aircraft ID</option>
	  <option value="employeeID">Employee ID</option>
	  </select> <br />
	  Input value to update : <input type="text" name="updateItem">  <br />
      <input type="submit" name="btnSubmit" value="Submit">
      
      </form>
      </div>
    </div>
  </div>
<div class="body2">
  <div class="main">
    <footer>
      <div class="footerlink">
        <p class="lf"></p>
        <p class="rf"></p>
      </div>
    </footer>
  </div>
</div>
</body>
</html>