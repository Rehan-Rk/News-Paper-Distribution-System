<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Employees</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body style="background-color: #eee;">
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<section class="vh-100">
		<div class="container h-100">
			<div class="card text-black m-3 p-5" style="border-radius: 25px;">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-lg-12 col-xl-11">


						<h2 class="text-center mb-4">Employee Details</h2>
					</div>
					<div class="row">
						<div class="col-lg-4">
							<form action="employee1" method="post">
								<!-- Employee Name-->

								<div class="form-outline mb-4 row">
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

								<!-- Emplyoee Address -->
								<div class="form-outline mb-4">
									<input type="text" name="Eaddress"
										class="form-control form-control-lg"
										placeholder="Enter Employee Address" required />

								</div>
								<!--  Mobile Number -->

								<div class="form-outline mb-4">
									<input type="tel" name="mobile"
										class=" form-control form-control-lg" pattern="[0-9]{10}"
										placeholder="Enter Employee Mobile No." required />
								</div>
								<!-- Emplyoee Salary -->
								<div class="form-outline mb-4">
									<input type="text" name="Esalary"
										class="form-control form-control-lg"
										placeholder="Enter Employee Salary" required />

								</div>
								
								
								<div class="form-outline mt-3 mb-1">

									<select name="area" class="form-control form-control-lg"
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

								<!--  gender -->
								<div class="form-check form-check-inline mb-4 pl-2 mt-3">
									<input class="form-check-input" id="m" type="radio"
										name="gender" value="male" required>
									<lable class="form-check-label" for="m">Male</lable>
								</div>
								<div class="form-check form-check-inline mb-4">
									<input class="form-check-input" id="f" type="radio"
										name="gender" value="female" required>
									<lable class="form-check-label" for="f">Female</lable>

								</div>
								
								


								<!-- Submit button -->
								<div class="row">
									<button type="submit" class="lbtn ml-3 mb-4" name="submit"
										style="padding: 10px 135px">Add</button>
								</div>
							</form>
							<div class="align-center">

								<a class="font" href="/News_Paper_Distribution_System/Home.jsp">
									<img
									src="https://img.icons8.com/external-flaticons-flat-flat-icons/30/000000/external-back-web-flaticons-flat-flat-icons.png" />Back
									to Home Page
								</a>
							</div>


						</div>

						<div class="col-lg-8">
						
						
							<div class="container">
						<table class="table table-bordered table-responsive table-hover"
							style="border-radius: 10px">
							<thead class="table-dark">
								<tr>
									<th style="width: 40%">Name</th>
									<th>Address</th>
									<th>Mobile No.</th>
									<th>Salary</th>
									<th>Gender</th>
									<th>Area</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<%
							Class.forName("com.mysql.cj.jdbc.Driver");
							con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
							st = con.createStatement();
						rs = st.executeQuery("select * from employee");
							while (rs.next()) {
								String id = rs.getString("u_id");
							%>
							<tbody>
								<tr>


									<td><%=rs.getString("Fname")+" "+rs.getString("Lname")%></td>
									<td><%=rs.getString("eaddress")%></td>
									<td><%=rs.getString("emobile")%></td>
									<td><%=rs.getString("esalary")%></td>
									<td><%=rs.getString("gender")%></td>
									<td><%=rs.getString("area")%></td>
									<td><div class="row">

											<a href="UpdateEmployee.jsp?u_id=<%=id%>"><button
													type="submit" class="lbtn m-2" style="padding: 7px 25px">Edit</button></a>
										</div></td>
									<td><div class="row">
											<a href="DeleteEmployee.jsp?u_id=<%=id%>"><button
													type="submit" class="lbtn m-2" style="padding: 7px 20px">Delete</button></a>
										</div></td>

								</tr>
								<%
								}
								st.close();
								con.close();
								%>
							</tbody>
						</table>



					</div>
						
						
						
						</div>


					</div>
				
				</div>
			</div>
		</div>

	</section>

	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
	<link rel='stylesheet'
		href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>
	<script type="text/javascript">
		var str = document.getElementById("status").value;
		if (str == "success") {
			swal("Congrats", "Employee Add Successfully", "success")
					.then(
							function() {
								window.location = "/News_Paper_Distribution_System/Employee.jsp";

							});

		}
		if (str == "failed") {
			swal("Sorry", "Please Enter correct details", "error");
		}
	</script>


</body>
</html>