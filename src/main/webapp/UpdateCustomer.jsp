<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Customer Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%
	if (request.getParameter("Csubmit") != null) {
		String id = request.getParameter("u_id");
		String Fname = request.getParameter("Fname");
		String Lname = request.getParameter("Lname");
		String address = request.getParameter("address");
		String area = request.getParameter("area");
		String mobile = request.getParameter("mobile");
		String paper = request.getParameter("paper");
		String Nnote= request.getParameter("note");
		if(paper.equals(""))
		{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
		PreparedStatement pt = con
		.prepareStatement("update customer set Fname=?,address=?,area=?,mobile=?,note=?,Lname=? where u_id=?");
		pt.setString(7, id);
		pt.setString(6, Lname);
		pt.setString(1, Fname);
		pt.setString(2, address);
		pt.setString(3, area);
		pt.setString(4, mobile);
		pt.setString(5,Nnote);
		//pt.setString(5, paper);
		int rowCount = pt.executeUpdate();
		response.sendRedirect("Customer.jsp");

		pt.close();

	}else
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
		PreparedStatement pt = con
		.prepareStatement("update customer set Fname=?,address=?,area=?,mobile=?,paper=?,note=?,Lname=? where u_id=?");
		
		pt.setString(1, Fname);
		pt.setString(2, address);
		pt.setString(3, area);
		pt.setString(4, mobile);
		pt.setString(5, paper);
		pt.setString(6, Nnote);
		pt.setString(7, Lname);
		pt.setString(8, id);
		int rowCount = pt.executeUpdate();
		response.sendRedirect("Customer.jsp");

		pt.close();
	}
		}
	%>
	<section class="vh-100">
		<div class="container h-100">
			<div class="card text-black m-3 p-3" style="border-radius: 25px;">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-lg-12 col-xl-11">


						<h3 class="text-center mb-4">Edit Customer Details</h3>
					</div>
				</div>
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-lg-8 ml-3">
						<%
						String id1 = request.getParameter("u_id");

						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select * from customer where u_id='" + id1 + "'");
						while (rs.next()) {
						%>
						<form action="#" method="post">


							<div class="form-outline mb-4">
							<label class="label">First Name :</label>
								<input type="text" name="Fname" value="<%=rs.getString("Fname")%>"
									class="form-control form-control-lg" required />

							</div>
							<div class="form-outline mb-4">
							<label class="label">Last Name :</label>
								<input type="text" name="Lname" value="<%=rs.getString("Lname")%>"
									class="form-control form-control-lg" required />

							</div>


							<div class="form-outline mb-4">
							<label class="label">Address :</label>
								<input type="text" name="address"
									value="<%=rs.getString("address")%>"
									class="form-control form-control-lg" required />

							</div>


							<div class="form-outline mb-4">
							<label class="label">Area :</label>
								<input type="text" name="area" value="<%=rs.getString("area")%>"
									class=" form-control form-control-lg " readonly />
							</div>
							<!-- customer mobile -->
							<div class="form-outline mb-4">
							<label class="label">Mobile No. :</label>
								<input type="tel" name="mobile"
									value="<%=rs.getString("mobile")%>"
									class="form-control form-control-lg "
									pattern="[0-9]{10}" required />

							</div>
							<!-- note -->
							
							<div class="form-outline mb-4">
							<label class="label">Note :</label>
								<textarea style="width:100%; height:200px;" type="textbox" name="note" 
									class=" form-control form-control-lg "><%=rs.getString("note")%></textarea>
									</div>
							
							<!-- paper -->
							<div class="form-outline mb-4">
							<label class="label">Paper :</label>
								<input type="tel" name="" value="<%=rs.getString("paper")%>"
									class="form-control form-control-lg " readonly />

							</div>

							<%
							}
							st.close();
							con.close();
							%>

							<div class="form-outline  mb-1">

								<select name="paper"
									class="form-control form-control-lg  " >

									<option value="">Change Paper Otherwise Skip</option>
									<%
									Class.forName("com.mysql.cj.jdbc.Driver");
									con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
									st = con.createStatement();
									rs = st.executeQuery("select papers from papers");

									while (rs.next()) {
									%>


									<option value="<%=rs.getString("papers")%>"><%=rs.getString("papers")%></option>
									<%
									}
									%>
								</select>
							</div>
							






							<!-- Submit button -->
							<div class="row p-3">

								<button type="submit" class="lbtn m-auto  text-center "
									name="Csubmit" style="padding: 10px 320px">Update</button>

							</div>
							<div class="align-center text-center m-auto p-4">

								<a class="font mt-4"
									href="/News_Paper_Distribution_System/Home.jsp"> <img
									src="https://img.icons8.com/external-flaticons-flat-flat-icons/30/000000/external-back-web-flaticons-flat-flat-icons.png" />Back
									to Home Page
								</a>
							</div>
						</form>



					</div>




				</div>

			</div>
		</div>


	</section>
</body>
</html>