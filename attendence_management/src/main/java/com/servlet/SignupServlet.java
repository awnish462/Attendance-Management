package com.servlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.Entity.Attendence;
import com.helper.FactoryProvider;

public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
   



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("user_name");
		String email=request.getParameter("user_email");
		String password=request.getParameter("user_password");
		String category=request.getParameter("user_category");
		Integer userclass=Integer.parseInt(request.getParameter("user_class"));
		if(category.equals("Faculty")) {
			userclass=0;
		}
		if(category.equals("Admin")) {
			PrintWriter out=response.getWriter();
			 out.println("<script type=\"text/javascript\">");
		        out.println("alert('You Can Not SignUp As Admin or Account Already Exists!');");
		        out.println("window.location.href = 'login.jsp';");
		        out.println("</script>");
		        
		        return;
		}
		Attendence attendence=new Attendence(name,email,password,category,userclass);
		Session s=FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		
		
		
		if(authenticate(email,password)) {
			PrintWriter out=response.getWriter();
			 out.println("<script type=\"text/javascript\">");
		        out.println("alert('Duplicate Data or Account Already Exists!');");
		        out.println("window.location.href = 'login.jsp';");
		        out.println("</script>");
		}else {
		
		s.save(attendence);	
		
		tx.commit();
		
		s.close();
		
		response.sendRedirect("login.jsp");
		}
	}
	
	private boolean authenticate(String email, String password) {
		Session s = FactoryProvider.getFactory().openSession();
		String hql = "FROM Attendence WHERE email = :user_email OR password = :user_password";
		Query<Attendence> q = s.createQuery(hql, Attendence.class);
		q.setParameter("user_email", email);
		q.setParameter("user_password", password);
		/* s.close(); */
		
		return q.uniqueResult() != null;

	}

}
