<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost/spairline?user=root&password=abc12345";
			Connection conn = DriverManager.getConnection(connURL);
			//Statement stmt = conn.createStatement();

			String destCountry = request.getParameter("destCountry");
			String originCountry = request.getParameter("originCountry");
			String economyCost = request.getParameter("economyCost");
			String businessCost = request.getParameter("businessCost");
			String firstCost = request.getParameter("firstCost");

			//String sqlStr="select * from lect3db.student where adminNum='"+adminNum+"'";

			CallableStatement cs = conn
					.prepareCall("{Call insertCost(?,?,?,?,?)}");
			cs.setString(1, destCountry);
			cs.setString(2, originCountry);
			cs.setString(3, economyCost);
			cs.setString(4, businessCost);
			cs.setString(5, firstCost);

			//ResultSet rs = cs.executeQuery();
			//rs.close();
			//cs.close();
			//cs.execute();
			//ResultSet rs=cs.getResultSet();

			//ResultSet rs = stmt.executeQuery(sqlStr);

			int rec = cs.executeUpdate();
			if (rec == 1) {
				cs.close();
				conn.close();
				response.sendRedirect("adminInsertCost.jsp?m=success");
			} else
				cs.close();
				conn.close();
				response.sendRedirect("adminInsertCost.jsp?m=failure");
		} catch(Exception e){
			out.println("Error Occured. This is the error obtained : " + e);
			out.println("<br/>");
			out.println("Click <a href=\"adminInsertCost.jsp\">here</a> to go back.");
		}
	%>
</body>
</html>