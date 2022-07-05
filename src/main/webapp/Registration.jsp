<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Here</title>
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



						<form class="mx-1 mx-md-4" action="register" method="post">
							<div class="card-body p-md-10">
								<div class="row justify-content-center">
									<div class="col-md-8 col-lg-8 col-xl-7 order-2 order-lg-1">

										<p class="text-center h1 fw-bold mb-4 mx-1 mx-md-4 mt-4">Sign
											up</p>


										<!-- ********************* -->
										<div class="row form-outline mb-2">

											<!-- FULL NAME -->
											<div class="col-lg-1 mr-2">
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
														d="M86,17.2c-19.00027,0 -34.4,15.39973 -34.4,34.4v5.73333c0,19.00027 15.39973,34.4 34.4,34.4c19.00027,0 34.4,-15.39973 34.4,-34.4v-5.73333c0,-19.00027 -15.39973,-34.4 -34.4,-34.4zM85.9888,108.93333c-22.96773,0 -52.43707,12.42324 -60.91667,23.44844c-5.24027,6.81693 -0.25182,16.68489 8.34245,16.68489h105.15964c8.59427,0 13.58271,-9.86796 8.34245,-16.68489c-8.4796,-11.01947 -37.96013,-23.44844 -60.92786,-23.44844z"></path></g></g></svg>
											</div>
											<div class="col-lg-10">
												<input type="text" name="full_name"
													class="form-control form-control-lg"
													placeholder="Full Name" Required />
											</div>
										</div>
										<!-- ********************* -->



										<!-- ********************* -->
										<!-- EMAIL -->
										<div class="row form-outline mb-2">
											<div class="col-lg-1 mr-2">
												<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
													width="50" height="40" viewBox="0 0 172 172"
													style="fill: #000000;">
													<g fill="#e74c3c" fill-rule="nonzero" stroke="none"
														stroke-width="1" stroke-linecap="butt"
														stroke-linejoin="miter" stroke-miterlimit="10"
														stroke-dasharray="" stroke-dashoffset="0"
														font-family="none" font-weight="none" font-size="none"
														text-anchor="none" style="mix-blend-mode: normal">
													<g transform="scale(7.16667,7.16667)">
													<path
														d="M4,4c-0.666,0 -1.25323,0.32708 -1.61523,0.83008c-0.244,0.338 -0.1362,0.81711 0.2168,1.03711l8.78125,5.47266c0.378,0.236 0.85637,0.236 1.23438,0l8.74414,-5.51953c0.367,-0.232 0.4585,-0.73622 0.1875,-1.07422c-0.365,-0.454 -0.92183,-0.74609 -1.54883,-0.74609zM21.51563,8.08594c-0.08363,0.00092 -0.16855,0.02397 -0.24805,0.07422l-8.65039,5.45508c-0.378,0.235 -0.85638,0.23405 -1.23438,-0.00195l-8.65234,-5.39062c-0.318,-0.198 -0.73047,0.03125 -0.73047,0.40625v9.37109c0,1.105 0.895,2 2,2h16c1.105,0 2,-0.895 2,-2v-9.43555c0,-0.282 -0.2335,-0.48128 -0.48437,-0.47852z"></path></g></g></svg>
											</div>
											<div class="col-lg-10">
												<input type="email" name="email"
													class="form-control form-control-lg" placeholder="E-mail"
													Required />
											</div>
										</div>
										<!-- ********************* -->




										<!-- ********************* -->
										<!-- PASSWORD -->
										<div class="row form-outline mb-2">
											<div class="col-lg-1 mr-2 ">
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
														d="M86,11.46667c-22.09818,0 -40.13333,18.03515 -40.13333,40.13333v11.46667h-11.46667c-6.33533,0 -11.46667,5.13133 -11.46667,11.46667v68.8c0,6.33533 5.13133,11.46667 11.46667,11.46667h103.2c6.33533,0 11.46667,-5.13133 11.46667,-11.46667v-68.8c0,-6.33533 -5.13133,-11.46667 -11.46667,-11.46667h-11.46667v-11.46667c0,-21.37626 -16.99027,-38.59356 -38.09531,-39.71901c-0.64841,-0.26118 -1.33911,-0.4016 -2.03802,-0.41432zM86,22.93333c15.90235,0 28.66667,12.76431 28.66667,28.66667v11.46667h-57.33333v-11.46667c0,-15.90235 12.76431,-28.66667 28.66667,-28.66667z"></path></g></g></svg>
											</div>
											<div class="col-lg-10">
												<input type="password" name="password"
													class="form-control form-control-lg"
													placeholder="Enter Password" Required />
											</div>
										</div>
										<!-- ********************* -->



										<!-- ********************* -->
										<!-- CONFIRM PASSWORD -->
										<div class="row form-outline mb-2">
											<div class="col-lg-1 mr-2 ">
												<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
													width="50" height="38" viewBox="0 0 172 172"
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
														d="M49.88,0c-27.50656,0 -49.88,22.37344 -49.88,49.88c0,27.50656 22.37344,49.88 49.88,49.88c27.50656,0 49.88,-22.37344 49.88,-49.88c0,-27.50656 -22.37344,-49.88 -49.88,-49.88zM39.56,24.08c3.07719,0 6.16781,1.16906 8.50594,3.52063c4.70313,4.70312 4.70313,12.33562 0,17.02531c-4.68969,4.70313 -12.32219,4.70313 -17.02531,0c-4.70313,-4.68969 -4.70313,-12.32219 0,-17.02531c2.35156,-2.35156 5.44219,-3.52063 8.51937,-3.52063zM102.75656,70.35875c-6.10063,15.66813 -18.90656,27.95 -34.91063,33.325l16.72969,16.71625h15.18437v17.2h17.2v17.2h17.2v17.2h25.50438l7.17562,-7.17562l-65.06437,-65.06438l4.86437,-4.86437l64.99719,64.99719l0.36281,-0.43v-1.42438l-7.25625,-25.6925z"></path></g></g></svg>
											</div>
											<div class="col-lg-10">
												<input type="password" name="confirm_pass"
													class="form-control form-control-lg"
													placeholder="Confirm Password" Required />
											</div>
										</div>
										<!-- ********************* -->



										<!-- ********************* -->
										<!-- SELECT QUESTION  -->
										<div class="row form-outline mb-2">
											<div class="col-lg-1 mr-2">
												<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
													width="50" height="40" viewBox="0 0 172 172"
													style="fill: #000000;">
													<g fill="#e74c3c" fill-rule="nonzero" stroke="none"
														stroke-width="1" stroke-linecap="butt"
														stroke-linejoin="miter" stroke-miterlimit="10"
														stroke-dasharray="" stroke-dashoffset="0"
														font-family="none" font-weight="none" font-size="none"
														text-anchor="none" style="mix-blend-mode: normal">
													<g transform="scale(2.6875,2.6875)">
													<path
														d="M32,6c-14.359,0 -26,11.641 -26,26c0,14.359 11.641,26 26,26c14.359,0 26,-11.641 26,-26c0,-14.359 -11.641,-26 -26,-26zM29,42l-11,-11l2,-3l9,6l13.957,-12l3.043,3z"></path></g></g></svg>
											</div>


											<!-- ANSWER OF QUESTION -->
											<div class="col-lg-10">
												<select Required name="que"
													class="select form-control form-control-lg">

													<option value="">Select a question</option>
													<option value="Favorite teacher in school">Favorite
														teacher in school</option>
													<option value="Favorite place">Favorite place</option>
													<option value="First school friend">First school
														friend</option>
													<option value="Favorite movie">Favorite movie</option>
												</select>

											</div>
										</div>
										<!-- ********************* -->



										<!-- ********************* -->
										<div class="row form-outline mb-2">
											<div class="col-lg-1 mr-2">
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

											<div class="col-lg-10">
												<input type="text" name="answer"
													class="form-control form-control-lg"
													placeholder="Enter your answer" Required />

											</div>
										</div>
										<!-- ********************* -->
									</div>



									<!-- ********************* -->
									<div
										class="col-md-4col-lg-4 col-xl-4 d-flex align-items-center order-1 order-lg-2">
										<img src="https://i.ibb.co/r5KDhcg/registration.jpg"
											class="img-fluid" alt="Sample image">
									</div>
									<!-- ********************* -->




								</div>




								<!-- ********************* -->
								<div class="row">
									<div class="col-lg-12 justify-align-center">

										<p class="text-center h3 fw-bold mb-2 mx-1 mx-md-4 mt-5">Business
											Details</p>
										<div class=" text-center mb-3">
											<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
												width="80" height="80" viewBox="0 0 172 172"
												style="fill: #000000;">
											<g transform="">
											<g fill="none" fill-rule="nonzero" stroke="none"
													stroke-width="1" stroke-linecap="butt"
													stroke-linejoin="miter" stroke-miterlimit="10"
													stroke-dasharray="" stroke-dashoffset="0"
													font-family="none" font-weight="none" font-size="none"
													text-anchor="none" style="mix-blend-mode: normal">
											<path d="M0,172v-172h172v172z" fill="none"></path>
											<path
													d="M86,172c-47.49649,0 -86,-38.50351 -86,-86v0c0,-47.49649 38.50351,-86 86,-86h0c47.49649,0 86,38.50351 86,86v0c0,47.49649 -38.50351,86 -86,86z"
													fill="#ecf0f1"></path>
											<g>
											<path
													d="M125.99,107.10583h-6.665v-6.665c0,-0.61318 -0.49765,-1.11083 -1.11083,-1.11083h-11.10833c-0.61318,0 -1.11083,0.49765 -1.11083,1.11083v6.665h-6.665v-6.665c0,-4.28782 3.48802,-7.77583 7.77583,-7.77583h11.10833c4.28782,0 7.77583,3.48802 7.77583,7.77583z"
													fill="#e74c3c"></path>
											<path
													d="M112.66,126.34991l-26.66,-12.6946v-2.10614c0,-4.28782 3.48802,-7.77583 7.77583,-7.77583h37.76833c4.28782,0 7.77583,3.48802 7.77583,7.77583v2.10614z"
													fill="#cccccc"></path>
											<path
													d="M131.54417,139.32h-37.76833c-4.28782,0 -7.77583,-3.48802 -7.77583,-7.77583v-18.88417l26.66,8.88667l26.66,-8.88667v18.88417c0,4.28782 -3.48802,7.77583 -7.77583,7.77583z"
													fill="#e74c3c"></path>
											<path
													d="M72.67,77.11333c-12.25027,0 -22.21667,-9.9664 -22.21667,-22.21667c0,-12.25027 9.9664,-22.21667 22.21667,-22.21667c12.25027,0 22.21667,9.9664 22.21667,22.21667c0,12.25027 -9.9664,22.21667 -22.21667,22.21667z"
													fill="#e74c3c"></path>
											<path
													d="M91.55417,86h-37.76833c-11.64153,0 -21.10583,9.4643 -21.10583,21.10583v15.55167c0,1.82177 1.51073,3.3325 3.3325,3.3325h41.10083v-14.44083c0,-8.35347 6.22067,-15.24063 14.2631,-16.44033c1.15527,-3.37693 3.3325,-6.22067 6.1318,-8.2646c-1.8662,-0.5332 -3.8657,-0.84423 -5.95407,-0.84423z"
													fill="#e74c3c"></path></g>
											<path d="" fill="none"></path></g></g></svg>
										</div>

									</div>
								</div>
								<!-- ********************* -->




								<!-- ********************* -->
								<!-- AGENCY NAME -->
								<div class="col-lg-12 mr-2 mb-3 ">

									<input type="text" name="agency_name"
										class="text-center form-control form-control-lg"
										placeholder="Agency Name" Required />
								</div>
								<!-- ********************* -->



								<!-- ********************* -->
								<!-- ADDRESS -->
								<div class="col-lg-12 mr-2 mb-3">

									<input type="text" name="agency_address"
										class=" text-center form-control form-control-lg"
										placeholder="Agency Address" Required />
								</div>
								<!-- ********************* -->



								<!-- ********************* -->
								<!-- MOBILE NO. -->


								<div class="col-lg-12 mr-2 mb-3">

									<input type="tel" name="mobile"
										class=" text-center form-control form-control-lg"
										pattern="[0-9]{10}" placeholder="Mobile No." Required />
								</div>
								<!-- ********************* -->


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
										href="/News_Paper_Distribution_System/Login.jsp"><img src="https://img.icons8.com/external-flaticons-flat-flat-icons/30/000000/external-back-web-flaticons-flat-flat-icons.png"/> Already Registered? Login</a>
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
			swal("Congrats", "Account Created Successfully", "success").then(function() {
			    window.location = "/News_Paper_Distribution_System/Login.jsp";
			    
			});
		
		}
		if (str == "InvalidConfirmPassword") {
			swal("Sorry", "Please Enter Same Password", "error");
		}
		if (str == "one") {
			swal("Sorry", "Already Record Exist", "error");
		}
		
	</script>
</body>
</html>