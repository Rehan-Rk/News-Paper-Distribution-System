package com.servlet;

import java.sql.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/employee1")
public class Employee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String Fname = request.getParameter("Fname");
		String Lname = request.getParameter("Lname");
		String area = request.getParameter("area");
		String eaddress = request.getParameter("Eaddress");
		String mobile = request.getParameter("mobile");
		String salary = request.getParameter("Esalary");
		String gender = request.getParameter("gender");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
			PreparedStatement pt = con
					.prepareStatement("insert into employee(Fname,eaddress,emobile,esalary,gender,Lname,area) values(?,?,?,?,?,?,?)");
			pt.setString(1, Fname);
			pt.setString(2, eaddress);
			pt.setString(3, mobile);
			pt.setString(4, salary);
			pt.setString(5, gender);
			pt.setString(6, Lname);
			pt.setString(7, area);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Employee.jsp");
			int rowCount = pt.executeUpdate();
			if (rowCount > 0) {
				request.setAttribute("status", "success");

			} else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
			pt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
