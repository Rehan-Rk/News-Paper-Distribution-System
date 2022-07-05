package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/register")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// PrintWriter out = response.getWriter();
		String ufull_name = request.getParameter("full_name");
		String uemail = request.getParameter("email");
		String upassword = request.getParameter("password");
		String uconfirm_pass = request.getParameter("confirm_pass");
		String uque = request.getParameter("que");
		String uanswer = request.getParameter("answer");
		String uagency_name = request.getParameter("agency_name");
		String uagency_address = request.getParameter("agency_address");
		String umobile = request.getParameter("mobile");

		
			RequestDispatcher dispatcher = null;
			if (!upassword.equals(uconfirm_pass)) {
				request.setAttribute("status", "InvalidConfirmPassword");
				dispatcher = request.getRequestDispatcher("/Registration.jsp");
				dispatcher.forward(request, response);

			} else {

				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root",
							"Rehan@8605");
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select * from register");
					if (rs.next()) {
						request.setAttribute("status", "one");
						dispatcher = request.getRequestDispatcher("/Registration.jsp");
						dispatcher.forward(request, response);

					} else {

						PreparedStatement pst = con.prepareStatement(
								"insert into register(full_name,email,password,que,answer,agency_name,agency_address,mobile) values(?,?,?,?,?,?,?,?)");

						pst.setString(1, ufull_name);
						pst.setString(2, uemail);
						pst.setString(3, upassword);
						pst.setString(4, uque);
						pst.setString(5, uanswer);
						pst.setString(6, uagency_name);
						pst.setString(7, uagency_address);
						pst.setString(8, umobile);

						int rowCount = pst.executeUpdate();
					
						dispatcher = request.getRequestDispatcher("Registration.jsp");
						if (rowCount > 0) {
							request.setAttribute("status", "success");
						} else {
							request.setAttribute("status", "failed");
						}
						dispatcher.forward(request, response);
						pst.close();
						con.close();
					}

				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e);

				}

			}
		
		}

	}

