<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lato:wght@900&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lato:wght@900&family=Roboto:wght@500&display=swap"
	rel="stylesheet">
</head>

<body style="background-color: #EEEEEE">

	<nav
		class="navbar navbar-expand-lg navbar-dark  py-0 mt-4 mr-5 ml-5 mb-5"
		style="background-color: white; border-radius: 12px; box-shadow: 10px 15px 10px #c0c0c0;">
		<div class="container-fluid">
			<a class="navbar-brand pl-4" href="#"> <img
				src="https://i.ibb.co/LPC9K97/Logo-1000x1000-px.png" width="90"
				height="60" class="py-0 m-auto">

			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">

					<li class="nav-item pl-3 "><a class="nav-link "
						href="Login.jsp"
						style="font-family: 'Lato', sans-serif; font-family: 'Roboto', sans-serif;"><button
								style="background-color: #E74C3C; border: none; text-align: center; font-size: 15px; color: white; border-radius: 4px; padding: 9px 25px;"
								class="my-2 my-sm-0" type="submit">Admin Login</button></a></li>
					<li class="nav-item pl-3"
						style="font-family: 'Lato', sans-serif; font-family: 'Roboto', sans-serif;"><a
						class="nav-link" href="NewConnection.jsp"><button
								style="background-color: #E74C3C; border: none; text-align: center; font-size: 15px; color: white; border-radius: 4px; padding: 9px 15px;"
								class="my-2 my-sm-0" type="submit">New Connection</button></a></li>


				</ul>
			</div>
		</div>

	</nav>


	<div class="row">
		<div class="col-5 pl-4 ">
			<img src="https://i.ibb.co/5TGmz3g/142-removebg-preview.png">
		</div>

		<div class="card col-6 p-5 "
			style="background-color: white; border-radius: 12px; box-shadow: 10px 15px 10px #c0c0c0;">
			<h4 class="text-center text py-4"
				style="font-family: 'Lato', sans-serif;">Welcome to News Paper
				Distribution System</h4>
			<p class="text-justify text"
				style="font-family: 'Lato', sans-serif; font-family: 'Roboto', sans-serif;">The
				Newspaper Delivery System is a user friendly computer system
				designed specifically for a newspaper and magazine distributor. Its
				objective will be to manage existing and potential new customers,
				publications, employee details and billing information and summary
				details as required by this type of business in today's market. For
				each delivery person, the system will print the publications to be
				delivered to each customer. A graphical/windows interface will guide
				the users through the functions described by the users to keep the
				newspaper service running smoothly.</p>
		</div>
	</div>

	<div class="row pr-3 pl-3 py-5 mr-5 ml-5 mt-5"
		style="background-color: white; border-radius: 12px; box-shadow: 10px 15px 10px #c0c0c0;">
		<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college?useSSL=false", "root", "Rehan@8605");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * FROM register");
		while (rs.next()) {
		%>

		<div class="col-3">
			<ul style="list-style-type: none">
				<li><img src="https://i.ibb.co/LPC9K97/Logo-1000x1000-px.png"
					width="90" height="90" class="py-0 m-auto">
					<h6 style="font-family: 'Lato', sans-serif;" class=""><%=rs.getString("agency_name")%></h6> <br>
				<li><img
					src="https://img.icons8.com/ios-glyphs/30/000000/marker--v1.png" />
					<%=rs.getString("agency_address")%>
			</ul>
		</div>
		<div class="col-2"></div>
		<div class="col-3">
			<ul style="list-style-type: none">
				<H6 style="font-family: 'Lato', sans-serif;">MAIN FEATURES</H6>
				<br>
				<br>
				<li><a href="RP.jsp">Returns Policy</li>
				</a>
				<br>
				<li><a href="SAD.jsp">Shipping & Delivery</li>
				</a>
				<br>
				<li><a href="TAC.jsp">Term & Conditions</li>
				</a>
				<br>

			</ul>
		</div>
		<div class="col-1"></div>
		<div class="col-3">
			<ul style="list-style-type: none">
				<H6 style="font-family: 'Lato', sans-serif;">GET IN TOUCH</H6>
				<br>
				<br>
				<li><img
					src="https://img.icons8.com/ios-glyphs/30/000000/man-on-phone--v1.png" />
					+91 <%=rs.getString("mobile")%></li>
				<br>
				<li><img
					src="https://img.icons8.com/ios-glyphs/30/000000/new-post.png" />
					<%=rs.getString("email")%></li>
				<br>
				<li><img
					src="https://img.icons8.com/ios-glyphs/30/000000/ringing-phone.png" />
					: 07184-252501</li>
				<br>
				
				<li><a
					href="https://www.facebook.com/profile.php?id=100008672438311"><img
						src="https://img.icons8.com/ios-glyphs/30/000000/facebook-new.png" /></a>||
					<a href="https://www.instagram.com/mihir_limje/"><img
						src="https://img.icons8.com/ios-glyphs/30/000000/instagram-new.png" /></a>
					|| <a href="https://www.linkedin.com/in/mihir-limje-a70382219/"><img
						src="https://img.icons8.com/ios-glyphs/30/000000/linkedin.png" /></a></li>
			</ul>
		</div>
		<%
				}
%>				
	</div>
	<div class="text-center">
		<p class="  py-3 mr-5 ml-5 mt-3">@2022 CREATED BY MCA-1st YEAR
			STUDENTS</p>
	</div>

</body>
</html>