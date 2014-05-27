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

	String scheduleId=request.getParameter("scheduleID");
	String change=request.getParameter("selectUpdate");
	String updateItem=request.getParameter("updateItem");
	//String sqlStr="select * from lect3db.student where adminNum='"+adminNum+"'";
	
	String sqlStr="select * from spairline.schedule where scheduleID='"+scheduleId+"'";
	ResultSet rs = stmt.executeQuery(sqlStr);
	rs.next();
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


		if (change.equals("destCountry")){
			destCountry=updateItem;
		} else if (change.equals("destAirport")){
			destAirport=updateItem;
		} else if (change.equals("originCountry")){
			originCountry=updateItem;
		} else if (change.equals("originAirport")){
			originAirport=updateItem;
		}else if (change.equals("departDate")){
			departDate=updateItem;
		}else if (change.equals("departTime")){
			departTime=updateItem;
		}else if (change.equals("arriveDate")){
			arriveDate=updateItem;
		}else if (change.equals("arriveTime")){
			arriveTime=updateItem;
		}else if (change.equals("duration")){
			duration=updateItem;
		}else if (change.equals("aircraftID")){
			int updateItemint= Integer.parseInt(updateItem);
			aircraftId=updateItemint;
		}else if (change.equals("employeeID")){
			int updateItemint= Integer.parseInt(updateItem);
			employeeId=updateItemint;
		}
		departTime = departTime.substring(0, 5);
		arriveTime = arriveTime.substring(0, 5);
		CallableStatement cs = 
				conn.prepareCall("{Call updateSchedule(?,?,?,?,?,?,?,?,?,?,?,?)}" );
		cs.setString(1,scheduleId);
		cs.setString(2,destCountry);
		cs.setString(3,destAirport);
		cs.setString(4,originCountry);
		cs.setString(5,originAirport);
		cs.setString(6,departDate);
		cs.setString(7,departTime);
		cs.setString(8,arriveDate);
		cs.setString(9,arriveTime);
		cs.setString(10,duration);
		cs.setInt(11,aircraftId);
		cs.setInt(12,employeeId);
		
		int rec=cs.executeUpdate();
		if(rec==1){
			cs.close();
			conn.close();
			response.sendRedirect("adminUpdateSchedule.jsp?m=success");
		}
		else {
			cs.close();
			conn.close();
			response.sendRedirect("adminUpdateSchedule.jsp?m=failure");
		}
	}catch(Exception e){
		out.println("Error Occured. This is the error obtained : " + e);
		out.println("<br/>");
		out.println("Click <a href=\"adminUpdateSchedule.jsp\">here</a> to go back.");
	}
	%>
</body>
</html>