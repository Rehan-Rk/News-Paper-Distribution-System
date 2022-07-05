package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NewConnection")
public class NewConnection extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Fname = request.getParameter("Fname");
		String Lname =request.getParameter("Lname");
		String address = request.getParameter("cust_address");
		String mob = request.getParameter("cust_mobile");
		String paper = request.getParameter("cpaper");
		LocalDate dateObj = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String date = dateObj.format(formatter);

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
			PreparedStatement pst = con
					.prepareStatement("insert into NewConnection(Fname,address,mob,paper,date,Lname) values(?,?,?,?,?,?)");

			pst.setString(1, Fname);
			pst.setString(2, address);
			pst.setString(3, mob);
			pst.setString(4, paper);
			pst.setString(5, date);
			pst.setString(6, Lname);
			int rowCount = pst.executeUpdate();
			RequestDispatcher dispatcher = request.getRequestDispatcher("NewConnection.jsp");
			if (rowCount > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
			pst.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}

	}

}