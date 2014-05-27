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
	//Statement stmt = conn.createStatement();
	String scheduleID=request.getParameter("hidden");
	
	if(scheduleID.length()>0){
	CallableStatement cs = 
			conn.prepareCall("Call deleteSchedule(?)" );
	cs.setString(1,scheduleID);
	
	int rec=cs.executeUpdate();
	if(rec==1){
		cs.close();
		conn.close();
		response.sendRedirect("viewSchedule.jsp?m=success");
	}
	else {
		cs.close();
		conn.close();
		response.sendRedirect("viewSchedule.jsp?m=failure");
	}
}
}catch(Exception e){
	out.println("Error Occured. This is the error obtained : " + e);
	out.println("<br/>");
	out.println("Click <a href=\"viewSchedule.jsp\">here</a> to go back.");
}
%>
</body>
</html>