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

	String destCountry1=request.getParameter("destCountry");
	String change=request.getParameter("selectUpdate");
	String updateItem=request.getParameter("updateItem");
	//String sqlStr="select * from lect3db.student where adminNum='"+adminNum+"'";
	
	String sqlStr="select * from spairline.layover where destCountry='"+destCountry1+"'";
	ResultSet rs = stmt.executeQuery(sqlStr);
	rs.next();
	String destCountry=rs.getString("destCountry");
	String originCountry=rs.getString("originCountry");
	String layoverCountry=rs.getString("layoverCountry");
	String layoverCountry2=rs.getString("layoverCountry2");
	String layoverDuration=rs.getString("layoverDuration");


		if (change.equals("destCountry")){
			destCountry=updateItem;
		} else if (change.equals("originCountry")){
			originCountry=updateItem;
		} else if (change.equals("layoverCountry")){
			layoverCountry=updateItem;
		}else if (change.equals("layoverCountry2")){
			layoverCountry2=updateItem;
		}else if(change.equals("layoverDuration")){
			layoverDuration=updateItem;
		}

		CallableStatement cs = 
				conn.prepareCall("{Call updateLayover(?,?,?,?,?)}" );
		cs.setString(1,destCountry);
		cs.setString(2,originCountry);
		cs.setString(3,layoverCountry);
		cs.setString(4,layoverDuration);
		cs.setString(5,layoverCountry2);
		
		int rec=cs.executeUpdate();
		if(rec==1){
			cs.close();
			conn.close();
			response.sendRedirect("adminUpdateLayover.jsp?m=success");
		}
		else {
			cs.close();
			conn.close();
			response.sendRedirect("adminUpdateLayover.jsp?m=failure");
		}
	}catch(Exception e){
		out.println("Error Occured. This is the error obtained : " + e);
		out.println("<br/>");
		out.println("Click <a href=\"adminUpdateLayover.jsp\">here</a> to go back.");
	}
	%>
</body>
</html>