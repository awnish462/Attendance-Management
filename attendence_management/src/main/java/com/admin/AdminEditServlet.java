package com.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Entity.Attendence;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class AdminEditServlet
 */
public class AdminEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
       
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 int user_id=Integer.parseInt(request.getParameter("user_id"));
	 String name=request.getParameter("user_name");
	 String email=request.getParameter("user_email");
	 int user_class=Integer.parseInt(request.getParameter("user_class"));
	 
	 
	 Session s=FactoryProvider.getFactory().openSession();
	 Transaction tx=s.beginTransaction();
	 Attendence attendence=s.get(Attendence.class, user_id);
	 attendence.setName(name);
	 attendence.setEmail(email);
	 attendence.setUserclass(user_class);
	 
	 s.update(attendence);
	 tx.commit();
	 s.close();
	 response.sendRedirect("admin/all_students.jsp");
	}

}
