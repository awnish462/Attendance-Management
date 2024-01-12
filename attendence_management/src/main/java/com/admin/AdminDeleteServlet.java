package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.Entity.Attendence;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class AdminDeleteServlet
 */
public class AdminDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user_id=Integer.parseInt(request.getParameter("user_id"));
		Session s=FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		Attendence attendence=s.get(Attendence.class,user_id);
		s.delete(attendence);
		tx.commit();
		s.close();
		
		response.sendRedirect("all_students.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user_id=Integer.parseInt(request.getParameter("user_id"));
		Session s=FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		Attendence attendence=s.get(Attendence.class,user_id);
		s.delete(attendence);
		tx.commit();
		s.close();
		
		response.sendRedirect("all_students.jsp");
	}

}
