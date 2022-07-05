
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Paper & Area</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%
	if (request.getParameter("addPaper") != null) {
		String Npaper = request.getParameter("paper");
		String Nprice = request.getParameter("price");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
			PreparedStatement pt = con.prepareStatement("insert into papers(papers,price) values(?,?)");
			pt.setString(1, Npaper);
			pt.setString(2, Nprice);
			pt.executeUpdate();
			response.sendRedirect("AddPaperAndArea.jsp");

		} catch (Exception e) {
	%>
	<div class="alert alert-danger" role="alert">
		<%
		out.print("Error: " + e.getMessage());
		%>
	</div>

	<%
	}
	}
	%>
	<%
	if (request.getParameter("AA") != null) {
		try {
			String id1 = request.getParameter("AA");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
			PreparedStatement pt = con.prepareStatement("delete from areas where area1=? ");
			pt.setString(1, id1);
			int rowCount = pt.executeUpdate();
			pt.close();
			if (rowCount != 0) {
				response.setIntHeader("Refresh", 1);%>
				<div class="alert alert-success" role="alert">
				<%
				out.print("Disable Area Successfull");
				%>
			</div>
			<% 
					}
				} catch (Exception e) {
			%> 
	<div class="alert alert-danger" role="alert">
		<%
		out.print("Error: This area has added to some Customer or Employee, So first delete them!!!" );
	
		%>
	</div>

	<%
	}
	}
	%>


	<%
	if (request.getParameter("addArea") != null) {
		String Narea = request.getParameter("area");
		String Ncharges = request.getParameter("charges");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
			PreparedStatement pt = con.prepareStatement("insert into areas(area1,charges) values(?,?)");
			pt.setString(1, Narea);
			pt.setString(2, Ncharges);
			pt.executeUpdate();
			response.sendRedirect("AddPaperAndArea.jsp");
		} catch (Exception e) {
	%>

	<div class="alert alert-danger" role="alert">
		<%
		out.print("Error: " + e.getMessage());
		%>
	</div>

	<%
	}
	}
	%>
	<%
	if (request.getParameter("pap") != null) {
		try {
			String id = request.getParameter("pap");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
			PreparedStatement pt = con.prepareStatement("delete from papers where papers=? ");
			pt.setString(1, id);
			int rowCount = pt.executeUpdate();

			pt.close();
			if (rowCount != 0) {
		response.setIntHeader("Refresh", 1);%>
		<div class="alert alert-success" role="alert">
		<%
		out.print("Disable Paper Successfull");
		%>
	</div>
	<% 
			}
		} catch (Exception e) {
	%>
	<div class="alert alert-danger" role="alert">
		<%
		out.print("Error:This Papers has added to some Customer, So first delete them!!!");
		%>
	</div>

	<%
	}
	}
	%>





	<section class="vh-100">
		<div class="container h-100">
			<div class="card text-black mt-3 p-3" style="border-radius: 25px;">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-lg-5 m-auto">
						<form method="post">
							<div class="form-outline ">
								<h5 class="ml-1">Add Papers :</h5>
								<div class="row">
									<div class="col-lg-8">
										<input type="text" name="paper"
											class="form-control form-control-lg"
											placeholder="Enter Paper Name" required />
									</div>
									<div class="col-lg-4">
										<input type="text" name="price"
											class="form-control form-control-lg" placeholder="Price"
											required />
									</div>

								</div>
								<div>
									<button class="lbtn mt-2" type="submit" name="addPaper"
										style="padding: 10px 10px">Add Paper</button>

								</div>
							</div>

						</form>


					</div>


					<div class="col-lg-5 m-auto">
						<form method="post">
							<div class="form-outline">
								<h5 class="ml-1">Add Area:</h5>
								<div class="row">
									<div class="col-lg-8">
										<input type="text" name="area"
											class="form-control form-control-lg"
											placeholder="Enter Area Name" required />
									</div>
									<div class="col-lg-4">
										<input type="text" name="charges"
											class="form-control form-control-lg" placeholder="charges"
											required />
									</div>
								</div>
								<div>

									<button class="lbtn mt-2" type="submit" name="addArea"
										style="padding: 10px 10px">Add Area</button>
								</div>
						</form>
					</div>

				</div>

			</div>



			<div class="row h-100 mt-5">


				<div class="col-lg-6 text-center">

					<table class="table table-bordered table-hover ">

						<thead class="table-dark">
							<th>YOUR PAPERS</th>
							<th>PAPER PRICE</th>
							<th>REMOVE PAPERS</th>
						</thead>
						<%
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select papers,price from papers ");
						while (rs.next()) {
							String paper = rs.getString("papers");
						%>
						<tbody>
							<td><%=rs.getString("papers")%></td>
							<td><%=rs.getString("price")%></td>
							<td><a href="AddPaperAndArea.jsp?pap=<%=paper%>"><button
										type="submit" class="lbtn" style="padding: 7px 25px">Disable</button></a></td>

							<%
							}
							%>

						</tbody>
						<%
						st.close();
						con.close();
						%>

					</table>
				</div>


				<div class="col-lg-6 text-center">
					<table class="table table-bordered table-hover" >

						<thead class="table-dark"><TR>
							<th>YOUR AREAS</th>
							<th>CHARGES</th>
							<th>REMOVE AREAS</th></TR>
						</thead>
						<%
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
						st = con.createStatement();
						rs = st.executeQuery("select * from areas ");
						while (rs.next()) {
							String ar = rs.getString("area1");
						%>
						<tbody><tr>
							<td><%=rs.getString("area1")%></td>
							<td><%=rs.getString("charges")%></td>
							<td><a href="AddPaperAndArea.jsp?AA=<%=ar%>"><button
										type="submit" class="lbtn" style="padding: 7px 25px">Disable</button></a></td>

							<%
							}
							%>

</tr>
						</tbody>
						<%
						st.close();
						con.close();
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


	</section>


</body>
</html>