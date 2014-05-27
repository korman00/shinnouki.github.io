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
    				    alert("You have failed in your insertion, please try again.");
    				</script> <%
    			}else if (m.equals("success")){
    				%><script type="text/javascript">
    					alert("You have succeeded in your insertion! Please click on View/Delete Aircraft to double check the information inserted.");
    				</script> <%
    			}	
    		}
    		else {}
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
	 <h2> Insert An Aircraft</h2>
	 <form id="insertAircraft" action="processCreateAircraft.jsp">
      Aircraft Model :  <input type="text" name="aircraftModel" placeholder="Boeing 777-100 etc."> <br/>
      Aircraft No : <input type="text" name="aircraftNo" placeholder="SQ100 etc."> <br/>
      Capacity : <input type="text" name="capacity"> <br/>
      Added By :  <select name="employee"> 
      <%
      
    		String sqlStr="select distinct name from spairline.employee";
    		ResultSet rs = stmt.executeQuery(sqlStr);
    		
    		while(rs.next()){
    			String name=rs.getString("name");
    			out.println("<option value="+name+">"+name+"</option>");
    		}
    		rs.close();
    		%> </select><% 
    	}catch(Exception e){
    		out.println("Error Occured. This is the error obtained : " + e);
    		out.println("<br/>");
    		out.println("Click <a href=\"adminPage.jsp\">here</a> to go back.");
    	}
      %> <br/>
      Image (Filepath + \image.filetype): <input type="text" name="image"> <br/>
      <input type="submit" name="btnSubmit" value="Submit">
	  <input type="reset" name="btnReset" value="Reset">
      </form>
      
   </div>
   </div>
   </div>   
</body>
</html>