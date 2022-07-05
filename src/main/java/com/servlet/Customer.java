package com.servlet;

import java.sql.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.PrintWriter;

/**
 * Servlet implementation class Customer
 */
@WebServlet("/customer")
public class Customer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//HttpSession session= request.getSession();
		//RequestDispatcher Dispatcher=null;
		PrintWriter out= response.getWriter();
		String Fname = request.getParameter("Fname");
		String Lname = request.getParameter("Lname");
		String address = request.getParameter("caddress");
		String mobile = request.getParameter("mobile");
		String AlternateMobile = request.getParameter("Amobile");
		String area = request.getParameter("carea");
		String paper = request.getParameter("cpaper");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
			PreparedStatement pst = con.prepareStatement(
					"insert into customer(Fname,address,area,mobile,paper,Lname,Amobile) values(?,?,?,?,?,?,?)");
			pst.setString(1, Fname);
			pst.setString(2, address);
			pst.setString(3, area);
			pst.setString(4, mobile);
			pst.setString(5, paper);
			pst.setString(6, Lname);
			pst.setString(7, AlternateMobile);
			pst.executeUpdate();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("Select u_id from customer where Fname='" + Fname + "'and mobile='" + mobile + "'");
			rs.next();
			String c_id = rs.getString("u_id");
			

			PreparedStatement pst3 = con.prepareStatement("insert into PCtable(papers,c_id) values (?,?)");
			pst3.setString(1, paper);
			pst3.setString(2, c_id);
			//pst3.executeUpdate();

			int rowCount = pst3.executeUpdate();
			RequestDispatcher dispatcher = request.getRequestDispatcher("Customer.jsp");
			if (rowCount > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
			pst.close();
			con.close();
		} catch (Exception e) {
			System.out.print(e);
			out.print(e);
			e.printStackTrace();
			//session.setAttribute("status",e);
			//Dispatcher = request.getRequestDispatcher("Customer.jsp");
			//Dispatcher.forward(request, response);
			
		}
	}

}
