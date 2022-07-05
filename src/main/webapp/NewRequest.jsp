<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Request</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<section class="vh-100">
		<div class="container h-100">
			<div class="card text-black mt-3 p-3" style="border-radius: 25px;">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-lg-12 m-3">
						<h3 class=" text-center mb-5">Customers Request</h3>
						<div class="text-center m-auto justify-align-center">
							<img
								src="https://cdn5.vectorstock.com/i/thumb-large/83/69/request-callback-flat-circle-icon-vector-3398369.jpg" />
						</div>
						<table class=" table mt-5 table-bordered table-hover text-center">
							<thead class="table-dark">
								<th>Sr. No.</th>
								<th>Date</th>
								<th>Name</th>
								<th>Address</th>
								<th>Mobile</th>
								<th>Paper</th>
								<th>Add</th>
								<th>Remove</th>
							</thead>
							<%
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery(
									"select row_number() over (order by u_id)as number, u_id, Fname,Lname, address, mob, paper, date from newconnection");
							while (rs.next()) {
								String id = rs.getString("u_id");
							%>
							<tbody>

								<th><%=rs.getString("number")%></th>
								<th><%=rs.getString("date")%></th>
								<td><%=rs.getString("Fname")+ " "+rs.getString("Lname")%></td>
								<td><%=rs.getString("address")%></td>
								<td><%=rs.getString("mob")%></td>
								<td><%=rs.getString("paper")%></td>
								<td><a href="AddCustomerRequest.jsp?a_id=<%=id%>"><button
											type="submit" class="lbtn text-center"
											style="padding: 7px 20px">Add</button></a></td>
								<td><a href="NewRequest.jsp?u_id=<%=id%>"><button
											type="submit" class="lbtn text-center"
											style="padding: 7px 20px">Remove</button></a></td>

							</tbody>
							<%
							}
							st.close();
							con.close();
							%>
						</table>
						<%
						String id1 = request.getParameter("u_id");
						Class.forName("com.mysql.cj.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
						PreparedStatement pt = con.prepareStatement("delete from newconnection where u_id=? ");
						pt.setString(1, id1);
						int rowCount = pt.executeUpdate();

						pt.close();
						if (rowCount != 0) {
							response.setIntHeader("Refresh", 0);
						}
						%>
					</div>
					<div class="align-center">

						<a class="font" href="/News_Paper_Distribution_System/Home.jsp">
							<img
							src="https://img.icons8.com/external-flaticons-flat-flat-icons/30/000000/external-back-web-flaticons-flat-flat-icons.png" />Back
							to Home Page
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>



</body>
</html>