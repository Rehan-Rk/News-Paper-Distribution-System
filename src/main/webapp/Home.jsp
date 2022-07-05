
<%@ page import="java.sql.*"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<%
if (session.getAttribute("name33") == null) {

	response.sendRedirect("FrontPage.jsp");

}
%>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to Home Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<body>

	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * FROM register");
	while (rs.next()) {
	%>
	<nav
		class="navbar navbar-expand-lg navbar-dark  py-0 mt-4 mr-5 ml-5 mb-5"
		style="background-color: white; border-radius: 12px; box-shadow: 10px 15px 10px #c0c0c0;">
		<div class="container-fluid">
			<a class="navbar-brand pl-4" href="#"> <img
				src="https://i.ibb.co/LPC9K97/Logo-1000x1000-px.png" width="90"
				height="60" class="py-0 m-auto">

			</a>
			<h5><%=rs.getString("agency_name")%></h5>
			<%
			}
			st.close();
			con.close();
			%>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">

					<li class="nav-item pl-3 "><a href="MyProfile.jsp"><button
								style="background-color: #E74C3C; border: none; text-align: center; font-size: 15px; color: white; border-radius: 4px; padding: 9px 25px;"
								class="my-2 my-sm-0" type="submit">My Profile</button></a></li>
					<form action="Logout" method="post">
						<li class="nav-item pl-3"
							style="font-family: 'Lato', sans-serif; font-family: 'Roboto', sans-serif;"><button
								style="background-color: #E74C3C; border: none; text-align: center; font-size: 15px; color: white; border-radius: 4px; padding: 9px 35px;"
								class="my-2 my-sm-0 mt-3" type="submit">Logout</button></li>
					</form>

				</ul>
			</div>
		</div>


	</nav>
	<%
	LocalDate dateObj = LocalDate.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	String date = dateObj.format(formatter);
	%>

	<div class="row">
		<h5 class="float-right m-auto">
			Date :
			<%=date%></h5>
	</div>





	<div class="container">
		<div class="row home">
			<div class="col-3">
				<div class="card"
					style="width: 15rem; height: 15rem; border-radius: 15px">
					<img class="pt-2 m-auto"
						src="https://img.icons8.com/ios/50/000000/add--v1.png" />
					<div class="card-body">
						<h5 class="card-title text-center">Add Papers & Area</h5>
						<p class="card-text text-justify text-center">There is your
							papers and Areas.</p>
						<div class="col-md-12 text-center">
							<a href="AddPaperAndArea.jsp">
								<button type="button" class="btn btn-outline-dark">Check
									Details</button>
							</a>

						</div>

					</div>
				</div>
			</div>

			<div class="col-3">
				<div class="card"
					style="width: 15rem; height: 15rem; border-radius: 15px">

					<img class="pt-2 m-auto"
						src="https://img.icons8.com/ios-glyphs/30/000000/search--v1.png" />
					<div class="card-body">
						<h5 class="card-title text-center">Add & Search Customers</h5>
						<p class="card-text text-justify text-center">This is help you
							to add new customers.</p>
						<div class="col-md-12 text-center">
							<a href="Customer.jsp">
								<button type="button" class="btn btn-outline-dark">Check
									Details</button>
							</a>

						</div>

					</div>
				</div>
			</div>

			<div class="col-3">
				<div class="card"
					style="width: 15rem; height: 15rem; border-radius: 15px">
					<img class="pt-2 m-auto"
						src="https://img.icons8.com/ios/50/000000/database.png" />
					<div class="card-body">
						<h5 class="card-title text-center">Total Papers</h5>
						<p class="card-text text-justify text-center">There is
							maintain daily News Papers stocks.</p>
						<div class="col-md-12 text-center">
							<a href="TotalPaper.jsp">
								<button type="button" class="btn btn-outline-dark">Check
									Details</button>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card"
					style="width: 15rem; height: 15rem; border-radius: 15px">
					<img class="pt-2 m-auto"
						src="https://img.icons8.com/ios/50/000000/organization-chart-people.png" />
					<div class="card-body">
						<h5 class="card-title text-center">Area Papers Quantity</h5>
						<p class="card-text text-justify text-center">Stored your all
							area wise newspapers.</p>
						<div class="col-md-12 text-center">
							<a href="AreaPaper.jsp">
								<button type="button" class="btn btn-outline-dark">Check
									Details</button>
							</a>

						</div>

					</div>
				</div>
			</div>

		</div>
	</div>
	<div class="container">
		<div class="row home">
			<div class="col-3">
				<div class="card"
					style="width: 15rem; height: 15rem; border-radius: 15px">
					<img class="pt-2 m-auto"
						src="https://img.icons8.com/ios-filled/50/000000/list.png" />
					<div class="card-body">
						<h5 class="card-title text-center">Customer Lists</h5>
						<p class="card-text text-justify text-center">All area list,
							that customer want which news paper.</p>
						<div class="col-md-12 text-center">
							<a href="CustomerList.jsp">
								<button type="button" class="btn btn-outline-dark">Check
									Details</button>
							</a>

						</div>
					</div>
				</div>
			</div>

			<div class="col-3">
				<div class="card"
					style="width: 15rem; height: 15rem; border-radius: 15px">
					<img class="pt-2 m-auto"
						src="https://img.icons8.com/external-kiranshastry-lineal-kiranshastry/50/000000/external-customers-business-and-management-kiranshastry-lineal-kiranshastry-1.png" />

					<div class="card-body">
						<h5 class="card-title text-center">Employee Details</h5>
						<p class="card-text text-justify text-center">Employee full
							details.</p>
						<div class="col-md-12 text-center">
							<a href="/News_Paper_Distribution_System/Employee.jsp">
								<button type="button" class="btn btn-outline-dark mt-4">Check
									Details</button>
							</a>

						</div>
					</div>
				</div>
			</div>


			<%
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
			st = con.createStatement();
			rs = st.executeQuery("select count(u_id) as number from newconnection");
			while (rs.next()) {
				int count = rs.getInt("number");
			%>
			<div class="col-3">
				<div class="card"
					style="width: 15rem; height: 15rem; border-radius: 15px">
					<img class="pt-2 m-auto"
						src="https://img.icons8.com/material-outlined/48/000000/appointment-reminders--v1.png" />

					<div class="card-body">
						<h5 class="card-title text-center">
							New Request
							<%
						if (count != 0) {
						%>



							<span id="count" class="badge badge-pill badge-danger"><%=count%></span>
							<%
							}
							%>
						</h5>
						<p class="card-text text-justify text-center">Customer Message
							for new connection.</p>
						<div class="col-md-12 text-center">
							<a href="NewRequest.jsp">
								<button type="button" class="btn btn-outline-dark">Check
									Details</button>
							</a>

						</div>
						<%
						}
						st.close();
						con.close();
						%>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card"
					style="width: 15rem; height: 15rem; border-radius: 15px">
					<img class="pt-2 m-auto"
						src="https://img.icons8.com/external-smashingstocks-detailed-outline-smashing-stocks/66/000000/external-billing-shopping-and-commerce-smashingstocks-detailed-outline-smashing-stocks.png" />

					<div class="card-body">
						<h5 class="card-title text-center">Billing</h5>

						<p class="card-text text-justify text-center">Creating bills.</p>
						<div class="col-md-12 text-center">
							<a href="BillingList.jsp">
								<button type="button" class="btn btn-outline-dark mt-2">Check
									Details</button>
							</a>

						</div>
					</div>
				</div>

			</div>

		</div>
	</div>




</body>
</html>