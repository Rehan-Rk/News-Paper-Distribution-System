<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Customer</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>

	<%
	if (request.getParameter("u_id") != null) {

		String id1 = request.getParameter("u_id");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
		PreparedStatement pt = con.prepareStatement("delete from PCtable where c_id=? ");
		pt.setString(1, id1);
		pt.executeUpdate();
		PreparedStatement pt2 = con.prepareStatement("delete from customer where u_id=? ");
		pt2.setString(1, id1);
		int rowCount = pt2.executeUpdate();
		pt.close();

		if (rowCount != 0) {
			response.setIntHeader("Refresh", 1);
	%>
	<div class="alert alert-success" role="alert">
		<%
		out.print("Delete Successfull!!!");
		%>
	</div>

	<%
	}
	}
	%>




	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<section class="vh-100">
		<div class="container h-100">
			<div class="card text-black mt-3 p-3" style="border-radius: 25px;">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-lg-6 m-3">
						<h4 class="text-center mb-5">Add Customer</h4>
						<form action="customer" method="post">
							<div class="form-outline mt-1 mb-1 ">
								<div class="form-outline mt-3 mb-1 row ">

								
									<div class="col-6">
										<input type="text" name="Fname" 
											class="form-control form-control-lg" placeholder="First Name"
											required />
									</div>
									<div class="col-6">
										<input type="text" name="Lname"
											class="form-control form-control-lg" placeholder="Last Name"
											required />
									</div>
								</div>

								<div class="form-outline mt-3 mb-1">

									<input type="text" name="caddress" 
										class="form-control form-control-lg"
										placeholder="Enter Customer Address" required />
								</div>
								<div class="form-outline mt-3 mb-1">
									<input type="tel" name="mobile" 
										class=" form-control form-control-lg" pattern="[0-9]{10}"
										placeholder="Mobile No." Required />
								</div>

								<div class="form-outline mt-3 mb-1">
									<input type="tel" name="Amobile"
										class=" form-control form-control-lg" pattern="[0-9]{10}"
										placeholder="Alternate Mobile No.    (Optional)" />
								</div>


								
								<div class="form-outline mt-3 mb-1">

									<select name="carea" class="form-control form-control-lg"
										required>
										<option value="">-- Select Area --</option>

										<%
										Class.forName("com.mysql.cj.jdbc.Driver");
										Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("select area1 from areas");
										while (rs.next()) {
										%>

										<option value="<%=rs.getString("area1")%>"><%=rs.getString("area1")%></option>
										<%
										}
										%>
									</select>

								</div>




								<div class="form-outline mt-3 mb-1">

									<select name="cpaper" class="form-control form-control-lg"
										required>
										<option value="">-- Select Papers --</option>

										<%
										rs = st.executeQuery("select papers from papers");
										while (rs.next()) {
											String papers = rs.getString("papers");
										%>

										<option value="<%=papers%>"><%=papers%></option>
										<%
										}
										%>
									</select>

								</div>




								<div>
									<button class="lbtn mt-2" type="submit" value="customer"
										style="padding: 10px 10px">Add Customer</button>


								</div>
							</div>
						</form>


					</div>
					<div class="col-lg-4">

						<img alt=""
							src="https://cdn2.iconfinder.com/data/icons/flat-seo-web-ikooni/128/flat_seo-32-512.png"
							style="width: 400px; height: 400px">

					</div>

				</div>
				<div class="align-center m-auto">

					<a class="font" href="/News_Paper_Distribution_System/Home.jsp">
						<img
						src="https://img.icons8.com/external-flaticons-flat-flat-icons/30/000000/external-back-web-flaticons-flat-flat-icons.png" />Back
						to Home Page
					</a>
				</div>
			</div>


			<div class="row text-center mb-3">
				<div class="col-lg-12 mt-5">


					<h3 class="text-center m-auto">Search Customer</h3>
				</div>
			</div>
			<div class="container">
				<form action="" method="get">
					<div class="row m-auto text-center">
						<div class="col-lg-3"></div>
						<div class="col-lg-5">
							<input type="text" name="Sname"
								class="form-control form-control-lg"
								placeholder="Search Name, area, paper, mobile...." />
						</div>
						<div class="col-lg-1">
							<a href="#demo12"><button type="submit" class="lbtn "
									name="Asearch" Style="padding: 12px 20px">Search</button></a>
						</div>
						<div class="col-lg-3">
							<a><button onclick="TestsFunction()" type="submit"
									class="lbtn " name="" Style="padding: 12px 20px">Refresh</button></a>
						</div>

					</div>
				</form>
			</div>

			<%
			if (request.getParameter("Asearch") != null) {
			%>
			<div class="container pb-5">

				<h5 class="ml-3 mt-5">Search Result......</h5>
				<table
					class="bg-light text-dark table ml-3 mr-3 table-bordered table-hover ">
					<thead class="table-dark text-center">
						<th>Full Name</th>

						<th>Address</th>
						<th>Area</th>
						<th>Mobile</th>
						<th>Alternate Mobile</th>
						<th>Paper</th>
						<th>Edit</th>
						<th>Delete</th>
					</thead>
					<%
					String search = request.getParameter("Sname");
					rs = st.executeQuery("select * from customer where Fname like '%" + search + "%' or paper like '%" + search
							+ "%' or address like '%" + search + "%'  or area like '%" + search + "%' or mobile like '%" + search
							+ "%' or Amobile like '%" + search + "%' or Lname like '%" + search + "%'  ");
					while (rs.next()) {
						String id3 = rs.getString("u_id");
					%>
					<tbody>
						<tr>
							<td><%=rs.getString("Fname") + rs.getString("Lname")%></td>
							<td><%=rs.getString("address")%></td>
							<td><%=rs.getString("area")%></td>
							<td><%=rs.getString("mobile")%></td>
							<td><%=rs.getString("Amobile")%></td>
							<td><%=rs.getString("paper")%></td>
							<td><div class="row">

									<a href="UpdateCustomer.jsp?u_id=<%=id3%>"><button
											type="submit" class="lbtn text-center mr-3 ml-3"
											style="padding: 7px 20px">Edit</button></a>
								</div></td>
							<td><div class="row">
									<a href="Customer.jsp?u_id=<%=id3%>"><button type="submit"
											class="lbtn text-center mr-3 ml-3" style="padding: 7px 10px">Delete</button></a>
								</div></td>
						</tr>

					</tbody>
					<%
					}
					%>
				</table>
			</div>
			<%
			} else {
			%>

			<h4 class="text-center mt-5">All Added Customers</h4>
			<div id="demo12" class="container pb-5">
				<table id="demo12"
					class="bg-light text-dark table mt-5 ml-3 mr-3 table-bordered table-hover text-center">
					<thead class="table-dark text-center">
						<th width="15%">Full Name</th>
						<th>Address</th>
						<th>Area</th>
						<th>Mobile</th>
						<th>Alternate Mobile</th>
						<th>Paper</th>

						<th>Edit</th>
						<th>Delete</th>
					</thead>
					<%
					rs = st.executeQuery("select * from customer");
					while (rs.next()) {
						String id2 = rs.getString("u_id");
					%>
					<tbody>
						<tr>
							<td><%=rs.getString("Fname") + " " + rs.getString("Lname")%></td>
							<td><%=rs.getString("address")%></td>
							<td><%=rs.getString("area")%></td>
							<td><%=rs.getString("mobile")%></td>
							<td><%=rs.getString("Amobile")%></td>
							<td><%=rs.getString("paper")%></td>
							<td><div class="row">

									<a href="UpdateCustomer.jsp?u_id=<%=id2%>"><button
											type="submit" class="lbtn text-center ml-3 mr-3"
											style="padding: 7px 20px">Edit</button></a>
								</div></td>
							<td><div class="row">
									<a href="Customer.jsp?u_id=<%=id2%>"><button type="submit"
											class="lbtn text-center ml-3 mr-3" style="padding: 7px 10px">Delete</button></a>
								</div></td>
						</tr>

					</tbody>
					<%
					}
					}
					st.close();
					con.close();
					%>
				</table>
			</div>
		</div>

	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
	<link rel='stylesheet'
		href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
	<script type="text/javascript">
		var str = document.getElementById("status").value;
		if (str == "success") {
			swal("Congrats", "Customer Added Successfully", "success")
					.then(
							function() {
								window.location = "/News_Paper_Distribution_System/Customer.jsp";

							});

		}

		if (str == "error") {
			swal("Error", "Mobile No. is already exist!!", "error")
					.then(
							function() {
								window.location = "/News_Paper_Distribution_System/Customer.jsp";

							});

		}

		function TestsFunction() {
			var T = document.getElementById("TestsDiv");
			T.style.display = "none";
		}
	</script>

</body>
</html>