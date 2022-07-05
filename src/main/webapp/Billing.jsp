<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Billing</title>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="billing.css">
</head>
<body>
<input type="hidden" id="status"
		value="<%=request.getAttribute("status1")%>">
<script type="text/javascript">
function goBack() {
    window.history.back()

	
  }

</script>


    <button onclick="goBack()">	<img
						src="https://img.icons8.com/external-flaticons-flat-flat-icons/30/000000/external-back-web-flaticons-flat-flat-icons.png" /> Go Back</button>

	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
	Statement st = con.createStatement();
	%>
	<section class="vh-100">

		<div class="container py-5 h-100">
			<div class="text-center">
				<h2>Billing</h2>
				
			</div>

			<div class="card text-black p-3 " style="border-radius: 25px;">
				<div class="row d-flex justify-content-center h-100">


					<div class="col-lg-4 mr-5 mt-4">


						<form action="" method="post">

							<div class="form-outline"></div>

							<input type="text" name="Ddays"
								class="form-control form-control-lg text-center "
								placeholder="Missing days" Required />



							<div class="form-outline ">
								<button type="submit" class="lbtn mb-4 mt-3" name="update"
									style="padding: 10px 145px">Update</button>

							</div>

						</form>
						<%
						if (request.getParameter("update") != null) {
							int paperPrice = (Integer) session.getAttribute("PaperPrice");
							int TotalDays = (Integer) session.getAttribute("Tdays");
							int decreseDays = Integer.parseInt(request.getParameter("Ddays"));
							Integer Pcharges = (Integer) session.getAttribute("Ncharges");
							int Totalpaper1 = 0;
							int finalDay = TotalDays - decreseDays;
							Totalpaper1 = finalDay * paperPrice;
							session.setAttribute("TotolPaper", Totalpaper1);
							if(1>0){
							request.setAttribute("status1", "success1");
							}
							//int FTotal = Totalpaper1 + Pcharges;
							//session.setAttribute("STotal", FTotal);

						}
						%>

					</div>
					<!-- billing start-->
					<div class="col-lg-6">
						<span class="pull-right hidden-print"> <a
							href="javascript:;" onclick="printPageArea('printableArea')"
							class="btn btn-sm btn-white m-b-10 p-l-5"><i
								class="fa fa-print t-plus-1 fa-fw fa-lg"></i> Print</a>
						</span>
						<div id="printableArea" class="invoice">
							<!-- begin invoice-company -->
							<%
							ResultSet rs1 = st.executeQuery("select * FROM register");
							while (rs1.next()) {
							%>
							<div class="invoice-company text-inverse f-w-600">
								<h5><%=rs1.getString("agency_name")%></h5>
							</div>
							<!-- end invoice-company -->

							<!-- begin invoice-header -->
							<div class="invoice-header">
								<div class="invoice-from">
									<small>from</small>
									<address class="m-t-5 m-b-5">
										<b class="text-inverse"><%=rs1.getString("agency_name")%></b><br>
										<strong>Mr.<%=rs1.getString("full_name")%></strong><br>
										<%=rs1.getString("agency_address")%><br> <strong>Phone:</strong>
										<%=rs1.getString("Mobile")%><br> <strong>Email :
										</strong><%=rs1.getString("email")%>

									</address>
									<%
									}
									%>
								</div>


								<div class="invoice-to">
									<%
									String Cid = (String) request.getParameter("u_id");
									String Narea = request.getParameter("Sarea");
									ResultSet rs2 = st.executeQuery("select * from customer where u_id='" + Cid + "'");
									if (rs2.next()) {
									%>


									<small>to</small>
									<address class="m-t-5 m-b-5">
										<strong class="text-inverse"><%=rs2.getString("Fname")+" "+rs2.getString("Lname")%></strong><br>

										<%=rs2.getString("address")%><br> City, Zip Code<br>
										Phone:
										<%=rs2.getString("mobile")%><br> NewsPaper:
										<%=rs2.getString("paper")%>

										<%
										String Npaper1 = (String) rs2.getString("paper");
										String Nnote = (String) rs2.getString("note");
										session.setAttribute("Npaper", Npaper1);
										session.setAttribute("Snote", Nnote);
										%>

										<%
										}
										%>

									</address>


								</div>
								<div class="form-outline mb-4">
									<lable class="label">Note for this Customer: </lable>
									<%
									String note = (String) session.getAttribute("Snote");
									%>
									<textarea class="form-control form-control-lg" height="50px"
										readonly><%=note%></textarea>

								</div>

								<div class="invoice-date">
									<%
									LocalDate dateObj = LocalDate.now();
									DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
									String date = dateObj.format(formatter);
									%>
									<small>CurrentDate : <%=date%></small>
									<%
									String month = (String)session.getAttribute("Smonth");
									%>

									<div class="date text-inverse m-t-5"><%=month%>
										Month Bill
									</div>

								</div>
							</div>

							<!-- end invoice-header -->
							<!-- begin invoice-content -->
							<div class="invoice-content">
								<!-- begin table-responsive -->
								<div class="table-responsive">
									<table class="table table-invoice">
										<thead>
											<tr>
												<th width="80%">Paper</th>
												<th width="20%">RATE</th>


											</tr>
										</thead>
										<tbody>

											<tr>
												<%
												String SNpaper = (String) session.getAttribute("Npaper");
												%>
												<td><span class="text-inverse"><%=SNpaper%></span></td>
												<%
												ResultSet rs3 = st.executeQuery("select price from papers where papers = '" + SNpaper + "'");
												while (rs3.next()) {
													Integer Pprice = rs3.getInt("price");
													session.setAttribute("PaperPrice", Pprice);
												%>
												<td><%=Pprice%></td>


												<%
												}
												%>

											</tr>


										</tbody>

									</table>
									<br> <br> <br> <br>

								</div>
								<hr>
								<!-- end table-responsive -->
								<!-- begin invoice-price -->
								<div class="invoice-price">

									<div class="invoice-price-left">
										<div class="invoice-price-row">
											<%
											String Barea = (String) session.getAttribute("Sarea");
											ResultSet rs4 = st.executeQuery("select charges from areas where area1='" + Barea + "'");
											while (rs4.next()) {
												int charges = rs4.getInt("charges");
												session.setAttribute("Ncharges", charges);
											%>
											<div class="sub-price">

												<small>Service Charge</small> <span class="text-inverse">Rs.
													<%=charges%></span>
											</div>
											<%
											}
											%>
											<div class="sub-price">
												<i class="fa fa-plus text-muted"></i>
											</div>
											<div class="sub-price">
												<%
												if(request.getParameter("Ddays")!=null){
												Integer TpaperValue = 0;
												TpaperValue = (Integer) session.getAttribute("TotolPaper");
												%>
												<small>Monthly Paper </small> <span class="text-inverse">Rs.<%=TpaperValue%></span>
											</div>
										</div>
									</div>
									<div class="invoice-price-right">
										<%
										
										Integer Pcharges = (Integer) session.getAttribute("Ncharges");
										%>
										<small>TOTAL</small> <span class="f-w-600"><%=TpaperValue+Pcharges%></span>
										<%} %>
									</div>
								</div>
								<%
								st.close();
								con.close();
								%>
								<!-- end invoice-price -->
							</div>
							<!-- end invoice-content -->
							<!-- begin invoice-note -->
							<div class="invoice-note">
								<br> * If you have any
								questions concerning this invoice, contact us.
							</div>
							<!-- end invoice-note -->
							<!-- begin invoice-footer -->
							<div class="invoice-footer">
								<p class="text-center m-b-5 f-w-600">THANK YOU </p>
								
							</div>
							<!-- end invoice-footer -->
						</div>




					</div>
				</div>
			</div>
		</div>

	</section>
	<script>
		function getDetails() {
			rs.next();
		}

		function printPageArea(areaID) {
			var printContent = document.getElementById(areaID);
			var WinPrint = window.open('', '', 'width=900,height=650');
			WinPrint.document
					.write('<html><head><title>Print it!</title><link rel="stylesheet" href="billing.css"></head><body>');
			WinPrint.document.write(printContent.innerHTML);
			WinPrint.document.close();
			WinPrint.focus();
			WinPrint.print();
			WinPrint.close();
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
	<link rel='stylesheet'
		href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>
	<script type="text/javascript">
		var str = document.getElementById("status1").value;
		if (str == "success1") {
			swal("Congrats", "Account Created Successfully", "success");
		
		}
		
		
	</script>
</body>
</html>