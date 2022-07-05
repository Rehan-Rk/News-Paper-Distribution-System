 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Employee</title>
</head>
<body>

	<%
	String id = request.getParameter("u_id");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
	PreparedStatement pt = con.prepareStatement("delete from employee where u_id=? ");
	pt.setString(1, id);
	pt.executeUpdate();
	response.sendRedirect("Employee.jsp");
	pt.close();
	%>
</body>
</html>