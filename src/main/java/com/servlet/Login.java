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



@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String uemail=request.getParameter("email");
		String pass=request.getParameter("password");
		HttpSession session= request.getSession();
		RequestDispatcher Dispatcher=null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/college","root","Rehan@8605");
			PreparedStatement pst= con.prepareStatement("select * from register where email=? and password=?");
			pst.setString(1,uemail);
			pst.setString(2, pass);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				session.setAttribute("name33",rs.getString("email"));
				Dispatcher = request.getRequestDispatcher("Home.jsp");
			}
			else {
				request.setAttribute("status1", "fail");
				Dispatcher= request.getRequestDispatcher("Login.jsp");
				
				}
			Dispatcher.forward(request, response);
			pst.close();
		    con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
