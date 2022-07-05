<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Area Wise Paper Count</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<section class="vh-100">
		<div class="container h-100">
			<div class="card text-black m-3 p-3" style="border-radius: 25px;">

				<h3 class="text-center mb-5">Area Papers</h3>
				<hr class="card">
				<div
					class="row ">
					<div class="col-lg-4">


						<form action="" method="post">

							<div class="form-outline">

								<select name="areaid"
									class="form-control form-control-lg text-center" required>
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
								st.close();
								con.close();
								%>
								</select>

							</div>


							<div class="form-outline ">
								<button type="submit" class="lbtn mb-4 mt-4" name="Search1"
									style="padding: 10px 143px">Search</button>

							</div>

						</form>
					</div>
					<div class="col-lg-8">
						<table class="table table-bordered text-center table-hover">
							<thead class="table-dark">
								<th>Paper</th>
								<th>Quantity</th>
							</thead>
							<tbody>
								<%
								if (request.getParameter("Search1") != null) {
									String areaId= request.getParameter("areaid");
									Class.forName("com.mysql.cj.jdbc.Driver");
									con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
									st = con.createStatement();
									rs = st.executeQuery("select paper, count(paper) as Quantity from customer where area='"+ areaId + "' group by paper");
									while (rs.next()) {
								%>
								<td><%=rs.getString("paper")%></td>
								<td><%=rs.getString("Quantity")%></td>
							</tbody>

							<%
							}
							st.close();
							con.close();
							}
							%>
						</table>
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
		</div>
	</section>
</body>
</html>




