package com.servlet;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Forgot2
 */
@WebServlet("/Forgot2")
public class Forgot2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String NewPass = request.getParameter("Npass");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String email = (String) session.getAttribute("dname");
		out.print(NewPass);
		out.print(email);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
			Statement st = con.createStatement();

			st.execute("update register set password='"+NewPass+"' where email='"+email+"'");
			
			request.setAttribute("status2", "success");
			RequestDispatcher Dispatcher = request.getRequestDispatcher("Forgot2.jsp");
	
			Dispatcher.forward(request, response);
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
