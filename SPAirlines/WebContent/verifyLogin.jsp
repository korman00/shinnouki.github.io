<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.*, javax.swing.*" %>
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

	String loginid=request.getParameter("userid");
	String password=request.getParameter("password");
	//String sqlStr="select * from lect3db.student where adminNum='"+adminNum+"'";
	
	String sqlStr="select * from spairline.employee where name='"+loginid+"'";
	
	ResultSet rs = stmt.executeQuery(sqlStr);
	while(rs.next()){
		String userID=rs.getString("name");
		String passWord=rs.getString("password");
		if (loginid.equals(userID)){
			if (password.equals(passWord)){
				response.sendRedirect("adminPage.jsp");
			}
		}
		
	}
	response.sendRedirect("signin.html?err=LoginFailed");
}catch(Exception e){
	out.println(e);
}
%>

</body>
</html>