package com.servlet;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Forgot1
 */
@WebServlet("/Forgot1")
public class Forgot1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session= request.getSession();
String Answer = request.getParameter("ans");
String email=(String)session.getAttribute("dname");
PrintWriter out= response.getWriter();
//out.print(Answer);
//out.print(email);
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Rehan@8605");
	PreparedStatement pt= con.prepareStatement("select answer from register where email=?");
	pt.setString(1, email);
	//Statement st= con.createStatement();
	
	//ResultSet rs =st.executeQuery("select answer from register where email='" + email+ "'");
	ResultSet rs= pt.executeQuery();
	rs.next();
	String ans=rs.getString("answer");
	if(ans.equals(Answer))
	{
		response.sendRedirect("/News_Paper_Distribution_System/Forgot2.jsp");  
		
	}else
	{
		request.setAttribute("status1", "failed");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Forgot1.jsp");
		dispatcher.forward(request, response);
	
	}
	rs.close();
	con.close();
	
	
}
catch(Exception e)
{
	e.printStackTrace();
}


	}

}
