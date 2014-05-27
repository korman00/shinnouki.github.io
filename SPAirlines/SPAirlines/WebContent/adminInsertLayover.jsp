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
    					alert("You have succeeded in your insertion! Please click on View/Delete Layover to double check the information inserted.");
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

	 <h2> Insert A Layover </h2>
	 Number of Layover Countries : 
	 <select name="nooflayover" onchange="location = this.options[this.selectedIndex].value;">
	 <option value=""> Select a Number </option>
	 <option value="adminInsertLayover.jsp?nooflayover=2">2</option>
	 <option value="adminInsertLayover.jsp?nooflayover=3">3</option>
	 </select>
	 	<%
     	 	String noOfLayover = request.getParameter("nooflayover");
     	 	if (noOfLayover==null){
     	 		noOfLayover="2";
     	 	}
			if (noOfLayover.equals("3")){
    	  		out.println("<form action=\"processCreateLayover.jsp\">");
    	  		out.println("<br/>");
				out.println(" Final Destination : <input type=\"text\" name=\"destCountry\">");
				out.println("<br/>");
				out.println(" Origin Country : <input type=\"text\" name=\"originCountry\">");
				out.println("<br/>");
				out.println(" First Layover Country : <input type=\"text\" name=\"layoverCountry\">");
				out.println("<br/>");
				out.println(" Second Layover Country : <input type=\"text\" name=\"layoverCountry2\">");
    	  		out.println("<br/>");
    	  		out.println(" Layover Duration : <input type=\"text\" name=\"layoverDuration\">");
    	  		out.println("<br/>");
    	  		out.println("<input type=\"hidden\" name=\"hidden\" value=\"3\" />");
    	  		out.println("<input type=\"submit\" name=\"btnSubmit\" value=\"Submit\">");
    	  		out.println("<input type=\"reset\" name=\"btnReset\" value=\"Reset\">");
    	  		out.println("</form>");
			}
    	  		else if (noOfLayover.equals("2")){
    	  			out.println("<form action=\"processCreateLayover.jsp\">");
        	  		out.println("<br/>");
    				out.println(" Final Destination : <input type=\"text\" name=\"destCountry\">");
    				out.println("<br/>");
    				out.println(" Origin Country : <input type=\"text\" name=\"originCountry\">");
    				out.println("<br/>");
    				out.println(" Layover Country : <input type=\"text\" name=\"layoverCountry\">");
    				out.println("<br/>");
    				out.println(" Layover Duration : <input type=\"text\" name=\"layoverDuration\">");
        	  		out.println("<br/>");
    				out.println("<input type=\"hidden\" name=\"hidden\" value=\"2\" />");
        	  		out.println("<input type=\"submit\" name=\"btnSubmit\" value=\"Submit\">");
        	  		out.println("<input type=\"reset\" name=\"btnReset\" value=\"Reset\">");
        	  		out.println("</form>");
    	  		}
    	  		else {
    	  		
    	  		}

      }catch(Exception e){
    		out.println("Error Occured. This is the error obtained : " + e);
    		out.println("<br/>");
    		out.println("Click <a href=\"adminPage.jsp\">here</a> to go back.");
    	}
      %>
   </div>
   </div>
   </div>   
</body>
</html>