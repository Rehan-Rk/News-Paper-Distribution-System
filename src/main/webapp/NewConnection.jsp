<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Connection</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>

<body style="background-color: #eee;">
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<section class="vh-100">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-11">
					<div class="card text-black m-3" style="border-radius: 25px;">



						<form class="mx-1 mx-md-4" action="NewConnection" method="post">
							<div class="card-body p-md-10">
								<div class="row justify-content-center">





									<!-- ********************* -->
									
										<div class="col-lg-12 justify-align-center">

											<p class="text-center h3 fw-bold mb-2 mx-1 mx-md-4 mt-5">New
												Connection Request</p>
											<div class=" text-center mb-3">
												<img
													src="https://img.icons8.com/external-flat-berkahicon/100/000000/external-customer-email-marketing-flat-berkahicon-2.png" />
											</div>

										</div>
									</div>
									<!-- ********************* -->




									<!-- ********************* -->
									<!-- User NAME -->
									<div class="row">
										<div class="col-lg-6 mb-3">

											<input type="text" name="Fname"
												class="text-center form-control form-control-lg"
												placeholder="First Name" Required />
										</div>
										<div class="col-lg-6 mb-3">

											<input type="text" name="Lname"
												class="text-center form-control form-control-lg"
												placeholder="Last Name" Required />
										</div>

									</div>
									<!-- ********************* -->



									<!-- ********************* -->
									<!-- ADDRESS -->
									<div class="row">
										<div class="col-lg-12 mr-2 mb-3">

											<input type="text" name="cust_address"
												class=" text-center form-control form-control-lg"
												placeholder="Enter Your Address" Required />
										</div>
									</div>
									<!-- ********************* -->



									<!-- ********************* -->
									<!-- MOBILE NO. -->

									<div class="row">
										<div class="col-lg-12 mr-2 mb-3">

											<input type="tel" name="cust_mobile"
												class=" text-center form-control form-control-lg"
												pattern="[0-9]{10}" placeholder="Mobile No." Required />
										</div>
									</div>
									<!-- ********************* -->

									<div class="row">
										<div class="col-lg-12 mr-2 mb-3 ">
											<div class="form-outline  mb-1">

												<select name="cpaper"
													class="form-control form-control-lg text-center " required>
													<option value="">-- Select Papers --</option>

													<%
													Class.forName("com.mysql.jdbc.Driver");
													Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
													Statement st = con.createStatement();
													ResultSet rs = st.executeQuery("select papers from papers");
													while (rs.next()) {
													%>

													<option value="<%=rs.getString("papers")%>"><%=rs.getString("papers")%></option>
													<%
													}
													st.close();
													con.close();
													%>
												</select>

											</div>
										</div>
									</div>








									<div class="row mt-5 mb-5">

										<div class="col-lg-6">
											<button class="rbtn" type="reset" value="Reset">Reset</button>
										</div>
										<div class="col-lg-6">
											<button class="rbtn" type="submit" value="register">Submit</button>
										</div>

									</div>


									<div class=" col-lg-12 mr-2 mb-3 text-center">
										<a class="font"
											href="/News_Paper_Distribution_System/FrontPage.jsp"><img
											src="https://img.icons8.com/external-flaticons-flat-flat-icons/30/000000/external-back-web-flaticons-flat-flat-icons.png" />Back
											to Home </a>
									</div>
								</div>
						</form>





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
			swal("Congrats", "Account Created Successfully", "success")
					.then(
							function() {
								window.location = "/News_Paper_Distribution_System/FrontPage.jsp";

							});

		}

		if (str == "failed") {
			swal("Sorry", "Already Record Exist", "error").then(function() {
				window.location = "/News_Paper_Distribution_System/Login.jsp";

			});
		}
	</script>

</body>
</html>