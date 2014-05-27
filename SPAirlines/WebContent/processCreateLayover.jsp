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
	String noOfLayover = request.getParameter("hidden");
	String destCountry=request.getParameter("destCountry");
	String oriCountry=request.getParameter("originCountry");
	String layoverCountry=request.getParameter("layoverCountry");
	String layoverDuration=request.getParameter("layoverDuration");
	String layoverCountry2="";
	if (noOfLayover.equals("3")){
		layoverCountry2=request.getParameter("layoverCountry2");
	}
	CallableStatement cs = 
			conn.prepareCall("{Call insertLayover(?,?,?,?,?)}" );
	cs.setString(1,destCountry);
	cs.setString(2,oriCountry);
	cs.setString(3,layoverCountry);
	cs.setString(4,layoverDuration);
	cs.setString(5,layoverCountry2);
	//cs.execute();
	//ResultSet rs=cs.getResultSet();
	
	//ResultSet rs = stmt.executeQuery(sqlStr);
	
	int rec=cs.executeUpdate();
	if(rec==1){
		cs.close();
		conn.close();
		response.sendRedirect("adminInsertLayover.jsp?m=success");
	}
	else
		cs.close();
		conn.close();
		response.sendRedirect("adminInsertLayover.jsp?m=failure");
}catch(Exception e){
	out.println("Error Occured. This is the error obtained : " + e);
	out.println("<br/>");
	out.println("Click <a href=\"adminInsertLayover.jsp\">here</a> to go back.");
}
%>
</body>
</html>