<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	String connURL="jdbc:mysql://localhost/spairline?user=root&password=abc12345";
	Connection conn = DriverManager.getConnection(connURL);
	Statement stmt = conn.createStatement();

	String destCountry=request.getParameter("destcountry");
	String destAirport=request.getParameter("destairport");
	String oriCountry=request.getParameter("oricountry");
	String oriAirport=request.getParameter("oriairport");
	String dateFlight=request.getParameter("dateflight");
	String timeFlight=request.getParameter("timeflight");
	String dateArrival=request.getParameter("datearrival");
	String timeArrival=request.getParameter("timearrival");
	String duration=request.getParameter("duration");
	String aircraftID=request.getParameter("aircraft");
	String name=request.getParameter("employee");
	
	
	
	String sqlStr="select userID from spairline.employee where name='"+name+"'";
	ResultSet rs = stmt.executeQuery(sqlStr);
	rs.next();
	String employeeId=rs.getString("userID");
	rs.close();
	
	CallableStatement cs = 
			conn.prepareCall("{Call insertSchedule(?,?,?,?,?,?,?,?,?,?,?)}" );
	cs.setString(1,destCountry);
	cs.setString(2,destAirport);
	cs.setString(3,oriCountry);
	cs.setString(4,oriAirport);
	cs.setString(5,dateFlight);
	cs.setString(6,timeFlight);
	cs.setString(7,dateArrival);
	cs.setString(8,timeArrival);
	cs.setString(9,duration);
	cs.setString(10,aircraftID);
	cs.setString(11,employeeId);
	//cs.execute();
	//ResultSet rs=cs.getResultSet();
	
	//ResultSet rs = stmt.executeQuery(sqlStr);
	
	int rec=cs.executeUpdate();
	if(rec==1){
		cs.close();
		conn.close();
		response.sendRedirect("adminInsertSchedule.jsp?m=success");
	}
	else
		cs.close();
		conn.close();
		response.sendRedirect("adminInsertSchedule.jsp?m=failure");
}catch(Exception e){
	out.println("Error Occured. This is the error obtained : " + e);
	out.println("<br/>");
	out.println("Click <a href=\"adminInsertSchedule.jsp\">here</a> to go back.");
}
%>
</body>
</html>