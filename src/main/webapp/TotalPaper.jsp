<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Total Paper</title>
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

				<h4 class="text-center mb-5">Total Paper Required</h4>
				<hr class="card">
				<div class="row ">
					<div class="col-lg-8 text-center m-auto">
						<table class=" mt-4 table table-bordered table-hover text-center">
							<thead class="table-dark">
								<th>Paper</th>
								
								<th>Quantity</th>

							</thead>
							<tbody>
								<%
								String areaId = request.getParameter("areaid");
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select paper, count(paper) as Quantity from customer group by paper");
								while (rs.next()) {
								%>
								<td><%=rs.getString("paper")%></td>
								
								<td><%=rs.getInt("Quantity")%></td>




							</tbody>
							<%
							String UPaper = rs.getString("paper");
							session.setAttribute("Spaper", UPaper);
							int Qua=rs.getInt("Quantity");
							session.setAttribute("Squa", Qua);
							}
							%>

						</table>
					</div>

					


				</div>
				<div class="text-center">

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