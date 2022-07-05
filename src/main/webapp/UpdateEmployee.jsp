<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Employee  Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>
<%
						if (request.getParameter("Esubmit") != null) {
							String id = request.getParameter("u_id");
							String Fname = request.getParameter("Fname");
							String Lname = request.getParameter("Lname");
							String area = request.getParameter("area");
							String address = request.getParameter("Eaddress");
							String mobile = request.getParameter("mobile");
							String salary = request.getParameter("Esalary");
							String gender = request.getParameter("gender");
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
							PreparedStatement pt = con
							.prepareStatement("update employee set Fname=?,eaddress=?, emobile=?, esalary=?, gender=?,Lname=?, area=? where u_id=?" );
							pt.setString(8, id);
							pt.setString(6, Lname);
							pt.setString(7, area);
							pt.setString(1, Fname);
							pt.setString(2, address);
							pt.setString(3, mobile);
							pt.setString(4, salary);
							pt.setString(5, gender);
							int rowCount = pt.executeUpdate();
							response.sendRedirect("Employee.jsp");
							
							pt.close();
							
						}

						%>
	<section class="vh-100">
		<div class="container h-100">
			<div class="card text-black m-3 p-3" style="border-radius: 25px;">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-lg-12 col-xl-11">


						<h3 class="text-center mb-4">Edit Employee Details</h3>
					</div>
				</div>
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-lg-8 ml-3">
						<%
						String id = request.getParameter("u_id");
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select * from employee where u_id='" + id + "'");
						while (rs.next()) {
						%>
						<form action="#" method="post">
							<!-- Employee Name-->

							<div class="form-outline mb-4">
								<input type="text" name="Fname"
									value="<%=rs.getString("Fname")%>"
									class="form-control form-control-lg"
									placeholder="First Name" required />

							</div>
								<div class="form-outline mb-4">
								<input type="text" name="Lname"
									value="<%=rs.getString("Lname")%>"
									class="form-control form-control-lg"
									placeholder="First Name" required />

							</div>

							<!-- Emplyoee Address -->
							<div class="form-outline mb-4">
								<input type="text" name="Eaddress"
									value="<%=rs.getString("eaddress")%>"
									class="form-control form-control-lg"
									placeholder="Enter Employee Address" required />

							</div>
							<!--  Mobile Number -->

							<div class="form-outline mb-4">
								<input type="tel" name="mobile"
									value="<%=rs.getString("emobile")%>"
									class=" form-control form-control-lg" pattern="[0-9]{10}"
									placeholder="Enter Employee Mobile No." required />
							</div>
							<!-- Emplyoee Salary -->
							<div class="form-outline mb-4">
								<input type="text" name="Esalary"
									value="<%=rs.getString("esalary")%>"
									class="form-control form-control-lg"
									placeholder="Enter Employee Salary" required />

							</div>
							
							
							<div class="form-outline mt-3 mb-1">

									<select name="area" class="form-control form-control-lg"
										required>
										<option value="">-- Select Area --</option>

										<%
										Class.forName("com.mysql.cj.jdbc.Driver");
										con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
										 st = con.createStatement();
										 rs = st.executeQuery("select area1 from areas");
										while (rs.next()) {
										%>

										<option value="<%=rs.getString("area1")%>"><%=rs.getString("area1")%></option>
										<%
										}
										%>
									</select>

								</div>

							<!--  gender -->
							<div class="form-check form-check-inline mb-4 pl-2">
								<input class="form-check-input" id="m" type="radio"
									name="gender" value="male" required>
								<lable class="form-check-label" for="m">Male</lable>
							</div>
							<div class="form-check form-check-inline mb-4">
								<input class="form-check-input" id="f" type="radio"
									name="gender" value="female" required>
								<lable class="form-check-label" for="f">Female</lable>

							</div>
							<%
							}
							st.close();
							con.close();
							%>


							<!-- Submit button -->
							<div class="row">
								<button type="submit" class="lbtn ml-3 mb-4" name="Esubmit"
									style="padding: 10px 135px">Add</button>
							</div>
						</form>
						


					</div>




				</div>

			</div>
		</div>


	</section>
</body>
</html>