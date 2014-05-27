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
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	String connURL="jdbc:mysql://localhost/spairline?user=root&password=abc12345";
	Connection conn = DriverManager.getConnection(connURL);
	Statement stmt = conn.createStatement();
	
	String destCountrys=request.getParameter("chooseCountry");
	String originCountry=request.getParameter("chooseOrigin");
	String departYear=request.getParameter("chooseYear");
	String departMonth=request.getParameter("chooseMonth");
	String departDay=request.getParameter("chooseDay");
	String returnFlight=request.getParameter("hidden");
	int returnFlightInt= Integer.parseInt(returnFlight);
	String departDate=departYear+"-"+departMonth+"-"+departDay;
	String returnYear, returnMonth, returnDay, returnDate = "";
	out.println("This is the returned result.");
	if (returnFlightInt==0){
		returnYear=request.getParameter("chooseReturnYear");
		returnMonth=request.getParameter("chooseReturnMonth");
		returnDay=request.getParameter("chooseReturnDay");
		returnDate=returnYear+"-"+returnMonth+"-"+returnDay;
	}
	
	String[] layoverCountries = new String[100];
	String sqlStr2="select destCountry from spairline.layover";
	ResultSet rs4 = stmt.executeQuery(sqlStr2);
	int z = 0;
	while (rs4.next()){
		String destCountrylayover = rs4.getString("destCountry");
		layoverCountries[z]=destCountrylayover;
		z++;
	}
	
	String[] layoverDurationArray = new String[100];
	boolean layoverDurationTrue = false;
	String layoverDuration="";
	
	int m=0;
	do{
	if (destCountrys.equals(layoverCountries[m])){
		String sqlStr="select layoverDuration from spairline.layover where destCountry='"+destCountrys+"'";
		ResultSet rs1 = stmt.executeQuery(sqlStr);
		rs1.next();
		layoverDuration=rs1.getString("layoverDuration");
		layoverDurationArray[m]=layoverDuration;
		layoverDurationTrue = (layoverDuration != null);
		rs1.close();
		m++;
	}
	else { m++;
	}
	}while(m<layoverCountries.length);
	
	//String sqlStr="select * from lect3db.student where adminNum='"+adminNum+"'";
	CallableStatement cs = 
				conn.prepareCall("{Call selectDepartureFlight3(?,?,?,?,?)}" );
	cs.setString(1,destCountrys);
	cs.setString(2,originCountry);
	cs.setString(3,departDate);
	//out.println(cs.getString(5));
	//cs.getInt(4);
	int i=0;
	int j=0;

	cs.execute();
	ResultSet rs = cs.getResultSet();
	if (cs.getInt(4)==1){
	while(rs.next()){
		String destCountry=rs.getString("destCountry");
		String destAirport=rs.getString("destAirport");
		String originCountrys=rs.getString("originCountry");
		String originAirport=rs.getString("originAirport");
		String departDates=rs.getString("departDate");
		String departTime=rs.getString("departTime");
		String arriveDate=rs.getString("arriveDate");
		String arriveTime=rs.getString("arriveTime");
		String duration=rs.getString("duration");
		
		if (i==0){
			out.println("<table>");
			out.println("<tr>");
			out.println("<td>"+ "Destination Country" + "</td>");
			out.println("<td>"+ "Destination Airport" + "</td>");
			out.println("<td>"+ "Origin Country" + "</td>");
			out.println("<td>"+ "Origin Airport" + "</td>");
			out.println("<td>"+ "Departure Date" + "</td>");
			out.println("<td>"+ "Departure Time" + "</td>");
			out.println("<td>"+ "Arrival Date" + "</td>");
			out.println("<td>"+ "Arrival Time" + "</td>");
			out.println("<td>"+ "Duration" + "</td>");
			if (layoverDurationTrue){
				out.println("<td>"+ "Layover Duration" + "</td>");
			}
			out.println("</tr>");
		}
		out.println("<tr>");
		out.println("<td>"+ destCountry + "</td>");
		out.println("<td>"+ destAirport + "</td>");
		out.println("<td>"+ originCountrys + "</td>");
		out.println("<td>"+ originAirport + "</td>");
		out.println("<td>"+ departDates + "</td>");
		out.println("<td>"+ departTime + "</td>");
		out.println("<td>"+ arriveDate + "</td>");
		out.println("<td>"+ arriveTime + "</td>");
		out.println("<td>"+ duration + "</td>");
		if (layoverDurationTrue){
			boolean sonottrue = (destCountry.equals(destCountrys));
			if(!sonottrue){
			out.println("<td>"+ layoverDuration + "</td>");
		} else {
			out.println("<td>"+ " " + "</td>");
		}
		}
		out.println("</tr>");
		i++;
	}
	}
	if (returnFlightInt==0){
		do{
			int a=0;
			if (destCountrys.equals(layoverCountries[a])){
				String sqlStr="select layoverDuration from spairline.layover where originCountry='"+originCountry+"'";
				ResultSet rs1 = stmt.executeQuery(sqlStr);
				rs1.next();
				layoverDuration=rs1.getString("layoverDuration");
				layoverDurationTrue = (layoverDuration != null);
				rs1.close();
				a++;
			}
			else { a++;
			}
			}while(m<layoverCountries.length);
			
			//String sqlStr="select * from lect3db.student where adminNum='"+adminNum+"'";
			CallableStatement cs1 = 
						conn.prepareCall("{Call selectReturnFlight(?,?,?,?,?)}" );
			cs1.setString(1,destCountrys);
			cs1.setString(2,originCountry);
			cs1.setString(3,returnDate);
			//out.println(cs.getString(5));
			//cs.getInt(4);
			int k=0;
			int l=0;

			cs1.execute();
			ResultSet rs2 = cs1.getResultSet();

			if (cs1.getInt(4)==1){
			while(rs2.next()){
				
				String destCountry=rs2.getString("destCountry");
				String destAirport=rs2.getString("destAirport");
				String originCountrys=rs2.getString("originCountry");
				String originAirport=rs2.getString("originAirport");
				String departDates=rs2.getString("departDate");
				String departTime=rs2.getString("departTime");
				String arriveDate=rs2.getString("arriveDate");
				String arriveTime=rs2.getString("arriveTime");
				String duration=rs2.getString("duration");
				
				if (k==0){
					out.println("<table>");
					out.println("<tr>");
					out.println("<td>"+ "Destination Country" + "</td>");
					out.println("<td>"+ "Destination Airport" + "</td>");
					out.println("<td>"+ "Origin Country" + "</td>");
					out.println("<td>"+ "Origin Airport" + "</td>");
					out.println("<td>"+ "Departure Date" + "</td>");
					out.println("<td>"+ "Departure Time" + "</td>");
					out.println("<td>"+ "Arrival Date" + "</td>");
					out.println("<td>"+ "Arrival Time" + "</td>");
					out.println("<td>"+ "Duration" + "</td>");
					if (layoverDurationTrue){
						out.println("<td>"+ "Layover Duration" + "</td>");
					}
					out.println("</tr>");
				}
				out.println("<tr>");
				out.println("<td>"+ destCountry + "</td>");
				out.println("<td>"+ destAirport + "</td>");
				out.println("<td>"+ originCountrys + "</td>");
				out.println("<td>"+ originAirport + "</td>");
				out.println("<td>"+ departDates + "</td>");
				out.println("<td>"+ departTime + "</td>");
				out.println("<td>"+ arriveDate + "</td>");
				out.println("<td>"+ arriveTime + "</td>");
				out.println("<td>"+ duration + "</td>");
				if (layoverDurationTrue){
					boolean sonottrue = (destCountry.equals(destCountrys));
					if(!sonottrue){
					out.println("<td>"+ layoverDuration + "</td>");
				} else {
					out.println("<td>"+ " " + "</td>");
				}
				}
				out.println("</tr>");
				k++;
			}
			}
	}
}catch(Exception e){
	out.println("Error Occured. This is the error obtained : " + e);
	out.println("<br/>");
	out.println("Click <a href=\"index.html\">here</a> to go back.");
}
%>
</body>
</html>