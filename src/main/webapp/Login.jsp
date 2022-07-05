<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body style="background-color: #eee;">
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status1")%>">
	<section class="vh-100">

		<div class="container py-5 h-100">
			<div class="card text-black p-5" style="border-radius: 25px;">
				<div
					class="row d-flex align-items-center justify-content-center h-100">


					<div class="col-md-8 col-lg-7 col-xl-6">
						<img src="https://i.ibb.co/t8JsGt9/newspaper.jpg"
							alt="Phone image">
					</div>
					<div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">

						<form action="login" method="post">
							<!-- Email input -->
							<h3 class="text-center">Login</h3>
							<br>
							<div class="form-outline mb-4">
								<input type="email" name="email"
									class="form-control form-control-lg"
									placeholder="Enter your Email" required />

							</div>

							<!-- Password input -->
							<div class="form-outline mb-4">
								<input type="password" name="password"
									class="form-control form-control-lg" placeholder="Password"
									required />

							</div>

							<div
								class="d-flex justify-content-around align-items-center mb-4">
								<!-- Checkbox -->
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value=""
										id="form1Example3" checked /> <label class="form-check-label"
										for="form1Example3"> Remember me </label>
								</div>
								<a class="font" href="Forgot.jsp">Forgot password?</a>
							</div>

							<!-- Submit button -->
							<button type="submit" class="lbtn">Sign in</button>
							<div class="align-center">

								Not Yet Registered? <a class="font"
									href="/News_Paper_Distribution_System/Registration.jsp">Register</a>
							</div>
						</form>
					</div>
				</div>
				<div class=" col-lg-12 mr-2 mb-3 text-center">
					 <a class="font"
						href="/News_Paper_Distribution_System/FrontPage.jsp"><img src="https://img.icons8.com/external-flaticons-flat-flat-icons/30/000000/external-back-web-flaticons-flat-flat-icons.png"/>Goto Home Page</a>
				</div>
			</div>
		</div>
	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
	<link rel='stylesheet'
		href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
	<script type="text/javascript">
		 var str = document.getElementById("status").value;
		if (str == "fail") {
			
			swal("Opps", "Please enter correct Email and Password!!!", "error")
			.then(function() {
				str=null;
			    window.location = "/News_Paper_Distribution_System/Login.jsp";
			    
			});
		}
	</script>

</body>
</html>