package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Forget
 */
@WebServlet("/Forgot")
public class Forgot extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user = null;
		String uname = request.getParameter("userName");
		// PrintWriter out= response.getWriter();
//		out.print(uname);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from register where email='" + uname + "'");

			if (rs.next()){
				HttpSession session = request.getSession();
				session.setAttribute("dname", uname);
				response.sendRedirect("/News_Paper_Distribution_System/Forgot1.jsp");
			} else {

					request.setAttribute("status1", "failed");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/Forgot.jsp");
					dispatcher.forward(request, response);

			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
