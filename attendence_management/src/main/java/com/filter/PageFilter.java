package com.filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.Entity.Attendence;
import com.helper.FactoryProvider;

/**
 * Servlet Filter implementation class PageFilter
 */
public class PageFilter extends HttpFilter implements Filter {

	@Override
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest hsr = (HttpServletRequest) req;
		HttpSession s = hsr.getSession();
		String email = (String) (s.getAttribute("user_email"));
		Boolean logged = (Boolean) s.getAttribute("isLoggedIn");
		System.out.println(logged);
		System.out.println(email);
		
		if (email != null && logged != null && logged) {

			String requestedURI = hsr.getRequestURI();
			System.out.println("Logged In: " + logged);
			System.out.println("Requested URI: " + requestedURI);
			
			if (requestedURI.startsWith("/attendence_management/admin/") && isAdmin(email)) {
				// Allow access for admin pages
				chain.doFilter(req, res);
			} else if (requestedURI.startsWith("/attendence_management/faculty/") && isFaculty(email)) {
				// Allow access for faculty pages
				chain.doFilter(req, res);
			} else if (requestedURI.startsWith("/attendence_management/student/") && isStudent(email)) {
				// Allow access for student pages
				chain.doFilter(req, res);
			}      
			 else {
					// Redirect to an unauthorized page
					res.getWriter().println("You are not authorized to access this page.");
				}
		} else {
			// Redirect to an unauthorized page
			res.getWriter().println("You are not authorized to access this page.");
		}
	}

	private boolean isStudent(String email) {
		Session s = FactoryProvider.getFactory().openSession();
		String hql = "select category From Attendence where email=:user_email";
		Query<String> q = s.createQuery(hql, String.class);
		q.setParameter("user_email", email);
		String category = q.uniqueResult();
		s.close();
		return category.equals("Student");
	}

	private boolean isFaculty(String email) {
		Session s = FactoryProvider.getFactory().openSession();
		String hql = "select category From Attendence where email=:user_email";
		Query<String> q = s.createQuery(hql, String.class);
		q.setParameter("user_email", email);
		String category = q.uniqueResult();
		

		s.close();
		return category.equals("Faculty");
	}

	private boolean isAdmin(String email) {
		Session s = FactoryProvider.getFactory().openSession();
		String hql = "select category From Attendence where email=:user_email";
		Query<String> q = s.createQuery(hql, String.class);
		q.setParameter("user_email", email);
		String category = q.uniqueResult();
		s.close();
		return category.equals("Admin");
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
	}
}
