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

	String aircraftModel=request.getParameter("aircraftModel");
	String aircraftNo=request.getParameter("aircraftNo");
	String capacity=request.getParameter("capacity");
	String name=request.getParameter("employee");
	String image=request.getParameter("image");
	if (image==null){
		image="";
	}
	//String sqlStr="select * from lect3db.student where adminNum='"+adminNum+"'";
	
	CallableStatement cs = 
			conn.prepareCall("{Call insertAircraft(?,?,?,?,?)}" );
	cs.setString(1,aircraftModel);
	cs.setString(2,aircraftNo);
	cs.setString(3,capacity);
	cs.setString(4,name);
	cs.setString(5,image);
	//ResultSet rs = cs.executeQuery();
	//rs.close();
	//cs.close();
	//cs.execute();
	//ResultSet rs=cs.getResultSet();
	
	//ResultSet rs = stmt.executeQuery(sqlStr);
	
	int rec=cs.executeUpdate();
	if(rec==1){
		cs.close();
		conn.close();
		response.sendRedirect("adminInsertAircraft.jsp?m=success");
	}
	else
		cs.close();
		conn.close();
		response.sendRedirect("adminInsertAircraft.jsp?m=failure");
	}catch(Exception e){
		out.println("Error Occured. This is the error obtained : " + e);
		out.println("<br/>");
		out.println("Click <a href=\"adminInsertAircraft.jsp\">here</a> to go back.");
	}
%>
</body>
</html>