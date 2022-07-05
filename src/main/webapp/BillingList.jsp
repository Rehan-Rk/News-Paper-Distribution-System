<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Billing List</title>
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

				<h3 class="text-center mb-5">Billing List</h3>
				<div class="row">
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
							<div class="form-outline mb-3">

								<select name="month"
									class="form-control form-control-lg text-center mt-3" required>
									<option value="">-- Select Month --</option>
									<option value="January">January</option>
									<option value="February">February</option>
									<option value="March">March</option>
									<option value="April">April</option>
									<option value="May">May</option>
									<option value="June">June</option>
									<option value="July">July</option>
									<option value="August">August</option>
									<option value="September">September</option>
									<option value="October">October</option>
									<option value="November">November</option>
									<option value="December">December</option>

								</select>



							</div>


							<div class="form-outline ">
								<button type="submit" class="lbtn mb-4 mt-2" name="Search1"
									style="padding: 10px 143px">Search</button>

							</div>

						</form>
					</div>

					<table class="table table-bordered table-hover m-3">
						<thead class="table-dark">
							<th>Name</th>
							<th>Paper</th>
							<th>Note</th>
						
							<th>View Bill</th>

						</thead>
						<tbody>
							<%
							if (request.getParameter("Search1") != null) {
								String Nmonth = request.getParameter("month");
								session.setAttribute("Smonth", Nmonth);
								int Nmon = 0;
								if (Nmonth.equals("January") || Nmonth.equals("March") || Nmonth.equals("May") || Nmonth.equals("July")
								|| Nmonth.equals("August") || Nmonth.equals("October") || Nmonth.equals("December")) {
									Nmon = 31;
									session.setAttribute("Tdays", Nmon);
								} else if (Nmonth.equals("February")) {
									Nmon = 28;
									session.setAttribute("Tdays", Nmon);
								} else {
									Nmon = 30;
									session.setAttribute("Tdays", Nmon);
								}

								String areaId = request.getParameter("areaid");
								session.setAttribute("Sarea", areaId);
								Class.forName("com.mysql.cj.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
								st = con.createStatement();
								rs = st.executeQuery("select * from customer where area='" + areaId + "'");
								while (rs.next()) {
									String id = rs.getString("u_id");
							%>
							<tr>
								<td><%=rs.getString("Fname")+" "+ rs.getString("Lname")%></td>
								<td><%=rs.getString("paper")%></td>
								<td><%=rs.getString("note")%></td>
								
								<td><a href="Billing.jsp?u_id=<%=id%>"><button type="submit">View</button></a></td>
							    
								
							</tr>

						</tbody>

						<%
						}
						st.close();
						con.close();
						}
						%>
					</table>
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
	<script type="text/javascript">
		function incrementValue() {
			var value = parseInt(document.getElementById('number').value, 10);
			value = isNaN(value) ? 0 : value;
			if (value < 31) {
				value++;
				document.getElementById('number').value = value;
			}
		}
		function decrementValue() {
			var value = parseInt(document.getElementById('number').value, 10);
			value = isNaN(value) ? 0 : value;
			if (value > 1) {
				value--;
				document.getElementById('number').value = value;
			}

		}
	</script>
</body>
</html>