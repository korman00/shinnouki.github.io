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

	String aircraftID=request.getParameter("aircraftID");
	String change=request.getParameter("selectUpdate");
	String updateItem=request.getParameter("updateItem");
	//String sqlStr="select * from lect3db.student where adminNum='"+adminNum+"'";
	
	String sqlStr="select * from spairline.aircraft where aircraftID='"+aircraftID+"'";
	ResultSet rs = stmt.executeQuery(sqlStr);
	rs.next();
	int aircraftId=rs.getInt("aircraftID");
	String aircraftModel=rs.getString("aircraftModel");
	String aircraftNo=rs.getString("aircraftNo");
	String capacity=rs.getString("capacity");
	String name=rs.getString("name");
	String image=rs.getString("image");


		if (change.equals("aircraftModel")){
			aircraftModel=updateItem;
		} else if (change.equals("aircraftNo")){
			aircraftNo=updateItem;
		} else if (change.equals("capacity")){
			capacity=updateItem;
		}else if (change.equals("name")){
			name=updateItem;
		}else if (change.equals("image")){
			image=updateItem;
		}

		CallableStatement cs = 
				conn.prepareCall("{Call updateAircraft(?,?,?,?,?,?)}" );
		cs.setString(1,aircraftID);
		cs.setString(2,aircraftModel);
		cs.setString(3,aircraftNo);
		cs.setString(4,capacity);
		cs.setString(5,name);
		cs.setString(6,image);
		
		int rec=cs.executeUpdate();
		if(rec==1){
			cs.close();
			conn.close();
			response.sendRedirect("adminUpdateAircraft.jsp?m=success");
		}
		else {
			cs.close();
			conn.close();
			response.sendRedirect("adminUpdateAircraft.jsp?m=failure");
		}
	}catch(Exception e){
		out.println("Error Occured. This is the error obtained : " + e);
		out.println("<br/>");
		out.println("Click <a href=\"adminUpdateAircraft.jsp\">here</a> to go back.");
	}
	%>
</body>
</html>