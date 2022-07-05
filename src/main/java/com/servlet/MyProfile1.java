package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/MyProfile1")
public class MyProfile1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("submit") != null) {
			String name = request.getParameter("name1");
			String mobile = request.getParameter("mobile1");
			String aname = request.getParameter("aname");
			String aaddress = request.getParameter("address");

			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
				PreparedStatement pt = con
				.prepareStatement("update register set full_name=?,mobile=?, agency_name=?, agency_address=?");
				pt.setString(1, name);
				pt.setString(2, mobile);
				pt.setString(3, aname);
				pt.setString(4, aaddress);
				int rowCount = pt.executeUpdate();
				
				RequestDispatcher dispatcher=null ;
				if (rowCount > 0) {
					request.setAttribute("status", "success");
					dispatcher = request.getRequestDispatcher("/MyProfile1.jsp");
				} else {
					request.setAttribute("status", "failed");
					dispatcher = request.getRequestDispatcher("/MyProfile1.jsp");
				}
				dispatcher.forward(request, response);
				pt.close();
				con.close();
			} 
			catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			

		}
	}

}
