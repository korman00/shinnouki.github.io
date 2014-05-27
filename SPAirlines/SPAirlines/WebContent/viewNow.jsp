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
<h2>View Flight Schedules</h2> 
<form action="viewNow.jsp">
	Would you like a One-Way or a Two-Way Flight:
	<select name=returnflight onchange="location = this.options[this.selectedIndex].value;">
	<option value=""> Select an Option </option>
	<option value="viewNow.jsp?returnflight=1"> One-Way Flight </option>
	<option value="viewNow.jsp?returnflight=0"> Two-Way Flight</option>
	</select>
</form>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	String connURL="jdbc:mysql://localhost/spairline?user=root&password=abc12345";
	Connection conn = DriverManager.getConnection(connURL);
	Statement stmt = conn.createStatement();
	
	String selectedreturnflight=request.getParameter("returnflight");
	if (selectedreturnflight==null){
		selectedreturnflight="0";
	}
	int selectedreturnflight2 = Integer.parseInt(selectedreturnflight);
	boolean selectedreturnflight3 = (selectedreturnflight2==0);
	
	if (selectedreturnflight2==0){
	String sqlStr="select distinct destCountry from spairline.schedule";
	ResultSet rs = stmt.executeQuery(sqlStr);
	String[] destCountry = new String[100];
	int i=0;
	out.println("<form action=\"viewContinue2.jsp\">");
	out.println("Choose a country to fly to:");
	out.println("<select name=\"chooseCountry\">");
	while(rs.next()){
		String country = rs.getString("destCountry");
		destCountry[i]=country;
		out.println("<option value='"+country+"'>"+country+"</option>");
		i++;
	}
	out.println("</select>");
	out.println("<br/>");
	String sqlStr2="select distinct originCountry from spairline.schedule";
	ResultSet rs2 = stmt.executeQuery(sqlStr2);
	String[] originCountry = new String[100];
	int j=0;
	out.println("Where are you flying from? :");
	out.println("<select name=\"chooseOrigin\">");
	while(rs2.next()){
		String country = rs2.getString("originCountry");
		originCountry[j]=country;
		out.println("<option value='"+country+"'>"+country+"</option>");
		j++;
	}
	out.println("</select>");
	out.println("<br/>");
	out.println("When are you flying :");
	out.println("<select name=\"chooseYear\">");
	out.println("<option value=2014> 2014 </option>");
	out.println("<option value=2015> 2015 </option>");
	out.println("</select>");
	out.println("<select name=\"chooseMonth\">");
	out.println("<option value=01> January </option>");
	out.println("<option value=02> February </option>");
	out.println("<option value=03> March </option>");
	out.println("<option value=04> April </option>");
	out.println("<option value=05> May </option>");
	out.println("<option value=06> June </option>");
	out.println("<option value=07> July </option>");
	out.println("<option value=08> August </option>");
	out.println("<option value=09> September </option>");
	out.println("<option value=10> October </option>");
	out.println("<option value=11> November </option>");
	out.println("<option value=12> December </option>");
	out.println("</select>");
	out.println("<select name=\"chooseDay\">");
	out.println("<option value=01> 1 </option>");
	out.println("<option value=02> 2 </option>");
	out.println("<option value=03> 3 </option>");
	out.println("<option value=04> 4 </option>");
	out.println("<option value=05> 5 </option>");
	out.println("<option value=06> 6 </option>");
	out.println("<option value=07> 7 </option>");
	out.println("<option value=08> 8 </option>");
	out.println("<option value=09> 9 </option>");
	out.println("<option value=10> 10 </option>");
	out.println("<option value=11> 11 </option>");
	out.println("<option value=12> 12 </option>");
	out.println("<option value=13> 13 </option>");
	out.println("<option value=14> 14 </option>");
	out.println("<option value=15> 15 </option>");
	out.println("<option value=16> 16 </option>");
	out.println("<option value=17> 17 </option>");
	out.println("<option value=18> 18 </option>");
	out.println("<option value=19> 19 </option>");
	out.println("<option value=20> 20 </option>");
	out.println("<option value=21> 21 </option>");
	out.println("<option value=22> 22 </option>");
	out.println("<option value=23> 23 </option>");
	out.println("<option value=24> 24 </option>");
	out.println("<option value=25> 25 </option>");
	out.println("<option value=26> 26 </option>");
	out.println("<option value=27> 27 </option>");
	out.println("<option value=28> 28 </option>");
	out.println("<option value=29> 29 </option>");
	out.println("<option value=30> 30 </option>");
	out.println("<option value=31> 31 </option>");
	out.println("</select>");
	out.println("<br/>");
	out.println("Return Flight Date:");
	out.println("<select name=\"chooseReturnYear\">");
	out.println("<option value=2014> 2014 </option>");
	out.println("<option value=2015> 2015 </option>");
	out.println("</select>");
	out.println("<select name=\"chooseReturnMonth\">");
	out.println("<option value=01> January </option>");
	out.println("<option value=02> February </option>");
	out.println("<option value=03> March </option>");
	out.println("<option value=04> April </option>");
	out.println("<option value=05> May </option>");
	out.println("<option value=06> June </option>");
	out.println("<option value=07> July </option>");
	out.println("<option value=08> August </option>");
	out.println("<option value=09> September </option>");
	out.println("<option value=10> October </option>");
	out.println("<option value=11> November </option>");
	out.println("<option value=12> December </option>");
	out.println("</select>");
	out.println("<select name=\"chooseReturnDay\">");
	out.println("<option value=01> 1 </option>");
	out.println("<option value=02> 2 </option>");
	out.println("<option value=03> 3 </option>");
	out.println("<option value=04> 4 </option>");
	out.println("<option value=05> 5 </option>");
	out.println("<option value=06> 6 </option>");
	out.println("<option value=07> 7 </option>");
	out.println("<option value=08> 8 </option>");
	out.println("<option value=09> 9 </option>");
	out.println("<option value=10> 10 </option>");
	out.println("<option value=11> 11 </option>");
	out.println("<option value=12> 12 </option>");
	out.println("<option value=13> 13 </option>");
	out.println("<option value=14> 14 </option>");
	out.println("<option value=15> 15 </option>");
	out.println("<option value=16> 16 </option>");
	out.println("<option value=17> 17 </option>");
	out.println("<option value=18> 18 </option>");
	out.println("<option value=19> 19 </option>");
	out.println("<option value=20> 20 </option>");
	out.println("<option value=21> 21 </option>");
	out.println("<option value=22> 22 </option>");
	out.println("<option value=23> 23 </option>");
	out.println("<option value=24> 24 </option>");
	out.println("<option value=25> 25 </option>");
	out.println("<option value=26> 26 </option>");
	out.println("<option value=27> 27 </option>");
	out.println("<option value=28> 28 </option>");
	out.println("<option value=29> 29 </option>");
	out.println("<option value=30> 30 </option>");
	out.println("<option value=31> 31 </option>");
	out.println("</select>");
	out.println("<br/>");
	out.println("<input type=\"hidden\" name=\"hidden\" value="+selectedreturnflight+" />");
	out.println("<input type=\"submit\" name=\"btnSubmit\" value=\"Continue\">");
	out.println("</form>");
	}
	else if (selectedreturnflight2==1){
		String sqlStr="select distinct destCountry from spairline.schedule";
		ResultSet rs = stmt.executeQuery(sqlStr);
		String[] destCountry = new String[100];
		int i=0;
		out.println("<form action=\"viewContinue2.jsp\">");
		out.println("Choose a country to fly to:");
		out.println("<select name=\"chooseCountry\">");
		while(rs.next()){
			String country = rs.getString("destCountry");
			destCountry[i]=country;
			out.println("<option value='"+country+"'>"+country+"</option>");
			i++;
		}
		out.println("</select>");
		out.println("<br/>");
		String sqlStr2="select distinct originCountry from spairline.schedule";
		ResultSet rs2 = stmt.executeQuery(sqlStr2);
		String[] originCountry = new String[100];
		int j=0;
		out.println("Where are you flying from? :");
		out.println("<select name=\"chooseOrigin\">");
		while(rs2.next()){
			String country = rs2.getString("originCountry");
			originCountry[j]=country;
			out.println("<option value='"+country+"'>"+country+"</option>");
			j++;
		}
		out.println("</select>");
		out.println("<br/>");
		out.println("When are you flying :");
		out.println("<select name=\"chooseYear\">");
		out.println("<option value=2014> 2014 </option>");
		out.println("<option value=2015> 2015 </option>");
		out.println("</select>");
		out.println("<select name=\"chooseMonth\">");
		out.println("<option value=01> January </option>");
		out.println("<option value=02> February </option>");
		out.println("<option value=03> March </option>");
		out.println("<option value=04> April </option>");
		out.println("<option value=05> May </option>");
		out.println("<option value=06> June </option>");
		out.println("<option value=07> July </option>");
		out.println("<option value=08> August </option>");
		out.println("<option value=09> September </option>");
		out.println("<option value=10> October </option>");
		out.println("<option value=11> November </option>");
		out.println("<option value=12> December </option>");
		out.println("</select>");
		out.println("<select name=\"chooseDay\">");
		out.println("<option value=01> 1 </option>");
		out.println("<option value=02> 2 </option>");
		out.println("<option value=03> 3 </option>");
		out.println("<option value=04> 4 </option>");
		out.println("<option value=05> 5 </option>");
		out.println("<option value=06> 6 </option>");
		out.println("<option value=07> 7 </option>");
		out.println("<option value=08> 8 </option>");
		out.println("<option value=09> 9 </option>");
		out.println("<option value=10> 10 </option>");
		out.println("<option value=11> 11 </option>");
		out.println("<option value=12> 12 </option>");
		out.println("<option value=13> 13 </option>");
		out.println("<option value=14> 14 </option>");
		out.println("<option value=15> 15 </option>");
		out.println("<option value=16> 16 </option>");
		out.println("<option value=17> 17 </option>");
		out.println("<option value=18> 18 </option>");
		out.println("<option value=19> 19 </option>");
		out.println("<option value=20> 20 </option>");
		out.println("<option value=21> 21 </option>");
		out.println("<option value=22> 22 </option>");
		out.println("<option value=23> 23 </option>");
		out.println("<option value=24> 24 </option>");
		out.println("<option value=25> 25 </option>");
		out.println("<option value=26> 26 </option>");
		out.println("<option value=27> 27 </option>");
		out.println("<option value=28> 28 </option>");
		out.println("<option value=29> 29 </option>");
		out.println("<option value=30> 30 </option>");
		out.println("<option value=31> 31 </option>");
		out.println("</select>");
		out.println("<br/>");
		out.println("<input type=\"hidden\" name=\"hidden\" value="+selectedreturnflight+" />");
		out.println("<input type=\"submit\" name=\"btnSubmit\" value=\"Continue\">");
		out.println("</form>");
	}
}catch(Exception e){
	out.println("Error Occured. This is the error obtained : " + e);
	out.println("<br/>");
	out.println("Click <a href=\"index.html\">here</a> to go back.");
}
%>

</body>
</html>