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
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select * FROM register where email='" + uname + "'");
						while (rs.next()) {
					%>
					<div class="col-3 text-center">

						<img class="rounded-circle text-center"
							src="https://bootdey.com/img/Content/avatar/avatar7.png"
							width="200px" height="200px">


						<h3 class=" mt-3"><%=rs.getString("full_name")%></h3>

					</div>
				</div>


				<div class=" row d-flex align-items-center justify-content-center">
					<div class="card p-5 mb-1 mt-3 mr-4 " style="border-radius: 15px">
						<form method="post" action="MyProfile1.jsp">
							<div class="form-outline mb-4">
								<table class="table ">
									<tr>
										<th class="table-dark">Full Name :</th>
										<td class="table-active"> <%=rs.getString("full_name")%></td>
									</tr>

									<tr>
										<th class="table-dark">Email / User Name :</th>
										<td  class="table-active"><%=rs.getString("email")%></td>
									</tr>

									<tr>
										<th class="table-dark">Mobile No. :</th>
										<td  class="table-active"><%=rs.getString("mobile")%></td>
									</tr>
									<tr>
										<th class="table-dark">Agency Name :</th>
										<td  class="table-active"><%=rs.getString("agency_name")%></td>
									</tr>
									<tr>
										<th class="table-dark">Agency Address :</th>
										<td  class="table-active"><%=rs.getString("agency_address")%></td>
									</tr>
								</table>
								<div style="float: right">


									<button type="submit" class="px-5 py-2"
										style="border-radius: 5px">Edit</button>
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
</body>



</html>