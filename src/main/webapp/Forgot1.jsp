<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body style="background-color: #eee;">
	<input type="hidden" id="status1"
		value="<%=request.getAttribute("status1")%>">
	<section class="vh-100">
		<section class="vh-100">
			<div class="container h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-lg-12 col-xl-11">

						<div class="card text-black"
							style="border-radius: 25px; padding: 80px 30px">
							<form class="mx-1 mx-md-4" action="Forgot1" method="post">
								<div class="row justify-content-center">
									<div class="col-md-8 col-lg-8 col-xl-7 order-2 order-lg-1">
										<p class="text-center h2 fw-bold mb-5 mx-1 mx-md-4 mt-2">Forgot
											Password</p>
										<%
										String uname = (String) session.getAttribute("dname");
										%>
										<%
										try {
											Class.forName("com.mysql.cj.jdbc.Driver");
											Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery("select * FROM register where email='" + uname + "'");
											while (rs.next()) {
										%>
										<br>
										<div class="row form-outline mb-2">
											<div class="col-lg-1 mr-4 mb-3">
												<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
													width="50" height="40" viewBox="0 0 172 172"
													style="fill: #000000;">
														<g fill="none" fill-rule="nonzero" stroke="none"
														stroke-width="1" stroke-linecap="butt"
														stroke-linejoin="miter" stroke-miterlimit="10"
														stroke-dasharray="" stroke-dashoffset="0"
														font-family="none" font-weight="none" font-size="none"
														text-anchor="none" style="mix-blend-mode: normal">
														<path d="M0,172v-172h172v172z" fill="none"></path>
														<g fill="#e74c3c">
														<path
														d="M136.83854,14.33333c-4.67513,0 -21.05208,1.6237 -21.05208,21.5h15.00521c0,-6.55078 3.55534,-8.95833 6.04688,-8.95833c3.80729,0 5.82292,3.05143 5.82292,8.95833c0,12.3737 -14.27734,11.19792 -13.4375,32.92188h13.21354c-0.75586,-16.71289 15.22917,-16.01302 15.22917,-33.59375c0,-4.67513 -0.75586,-20.82812 -20.82812,-20.82812zM71.66667,43c-15.84505,0 -28.66667,12.82162 -28.66667,28.66667c0,15.84506 12.82162,28.66667 28.66667,28.66667c15.84506,0 28.66667,-12.82161 28.66667,-28.66667c0,-15.84505 -12.82161,-28.66667 -28.66667,-28.66667zM136.16667,76.81771c-6.83073,0 -8.28646,5.85091 -8.28646,8.28646c0,2.43555 1.14778,8.0625 8.28646,8.0625c7.13867,0 8.0625,-5.79492 8.0625,-8.0625c0,-2.26758 -1.23177,-8.28646 -8.0625,-8.28646zM71.66667,114.66667c-43.5599,0 -57.33333,28.66667 -57.33333,28.66667v14.33333h114.66667v-14.33333c0,0 -13.77344,-28.66667 -57.33333,-28.66667z"></path></g></g></svg>
											</div>
											<h4><%=rs.getString("que")%></h4>
											<div class="col-lg-10">
												<input type="text" class="form-control form-control-lg"
													name="ans" placeholder="Enter Your Retrive Answer" />
											</div>

											<div class="col-lg-3 mt-3 ml-0 p-0 ">
												<button class="fbtn" type="submit" value="Submit">Reset_Password</button>
											</div>
										</div>

										<%
										}
										st.close();
										con.close();
										} catch (Exception e) {
										System.out.println("Exception :" + e.getMessage());
										e.printStackTrace();
										}
										%>




									</div>




									<!-- *** -->
									<div
										class="col-md-4col-lg-4 col-xl-4 d-flex align-items-center order-1 order-lg-2">
										<img src="https://i.ibb.co/BL5VhrM/reset.jpg"
											class="img-fluid" alt="Sample image">

									</div>
								</div>
								<!-- *** -->
							</form>

						</div>

					</div>
					<div class=" col-lg-12 mr-2 mb-4 mt-0 text-center">
						 <a class="font"
										href="/News_Paper_Distribution_System/Login.jsp"><img src="https://img.icons8.com/external-flaticons-flat-flat-icons/30/000000/external-back-web-flaticons-flat-flat-icons.png"/> Already Registered? Login</a>
					</div>
				</div>

			</div>

		
		</section>
		<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
	<link rel='stylesheet'
		href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>
	<script type="text/javascript">
		var str = document.getElementById("status1").value;
		if (str == "failed") {
			swal("Sorry", "Please Enter Correct Password", "error");
			    }
		
	</script>
</body>
</html>