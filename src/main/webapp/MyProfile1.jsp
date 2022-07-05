<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

		<div class="container py-5 h-100">
			<div class="text-center">
				<h3>Admin Details</h3>
			</div>

			<div class="card text-black p-3 " style="border-radius: 25px;">
				<div
					class="row d-flex align-items-center justify-content-center h-100">
					<%
					String uname = (String) session.getAttribute("name33");
					%>
					<%
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select * FROM register where email='" + uname + "'");
						while (rs.next()) {
					%>
					<div class="col-4 text-center">

						<img class="rounded-circle text-center"
							src="https://bootdey.com/img/Content/avatar/avatar7.png"
							width="200px" height="200px">


						<h3 class=" mt-3"><%=rs.getString("full_name")%></h3>

					</div>
				</div>


				<div
					class="row d-flex align-items-center justify-content-center h-100">
					<div class="col-md-11 col-lg-11 card p-5 mb-1 mt-3"
						style="border-radius: 15px">
						<form method="post" action="MyProfile1">
							<div class="form-outline mb-4">
								<table class="table">
									<tr>
										<th>Full Name :</th>
										<td><input type="text" name="name1"
											value="<%=rs.getString("full_name")%>"
											class="form-control form-control-lg" Required /></td>
									</tr>

									<tr>
										<th>Email / User Name :</th>
										
										<td><input type="text" name=""
											value="<%=rs.getString("email")%>"
											class="form-control form-control-lg" readonly /></td>
										
									</tr>

									<tr>
										<th>Mobile No. :</th>
										<td><input type="text" name="mobile1"
											value="<%=rs.getString("mobile")%>" pattern="[0-9]{10}"
											class="form-control form-control-lg" Required /></td>


									</tr>
									<tr>
										<th>Agency Name :</th>
										<td><input type="text" name="aname"
											value="<%=rs.getString("agency_name")%>"
											class="form-control form-control-lg" Required /></td>

									</tr>
									<tr>
										<th>Agency Address :</th>
										<td><input type="text" name="address"
											value="<%=rs.getString("agency_address")%>"
											class="form-control form-control-lg" Required /></td>

									</tr>
								</table>
								<div class="d-flex justify-content-center">


									<a href="#"><button type="submit" class="px-5 py-2"
											value="submit" name="submit" style="border-radius: 5px">Save</button></a>
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





						</form>
					</div>


				</div>
				<div class=" col-lg-12 mr-2 mb-2 mt-4 text-center">
					<a class="font" href="Home.jsp"><img
						src="https://img.icons8.com/external-flaticons-flat-flat-icons/30/000000/external-back-web-flaticons-flat-flat-icons.png" />Goto
						Home Page</a>
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
			swal("Congrats", "Update Details Successfully", "success").then(function() {
			    window.location = "/News_Paper_Distribution_System/MyProfile.jsp";
			    
			});
		}
	</script>


</body>



</html>