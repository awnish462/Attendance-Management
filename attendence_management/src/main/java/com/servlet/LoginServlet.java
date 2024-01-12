package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.hibernate.Session;
import org.hibernate.query.Query;

import com.Entity.Attendence;
import com.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		String category = request.getParameter("user_category");

		if (authenticate(email, password, category)) {
			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("isLoggedIn", true);
			httpsession.setAttribute("user_email", email);
			Session s = FactoryProvider.getFactory().openSession();
			String hql = "select id From Attendence where email=:user_email";
			Query<Integer> q = s.createQuery(hql, Integer.class);
			q.setParameter("user_email", email);
			Integer id = q.uniqueResult();

			if (category.equals("Admin")) {
				response.sendRedirect("admin/admin_home.jsp");
			} else if (category.equals("Student")) {
				if (id != null) {
					response.sendRedirect("student/student_home.jsp?user_id=" + id + "");
				}

			} else if (category.equals("Faculty")) {
				response.sendRedirect("faculty/faculty_home.jsp");
			}

		} else {
			response.sendRedirect("signup.jsp");
		}

	}

	private boolean authenticate(String email, String password, String category) {
		Session s = FactoryProvider.getFactory().openSession();
		String hql = "FROM Attendence WHERE email = :user_email AND password = :user_password AND category = :user_category";
		Query<Attendence> q = s.createQuery(hql, Attendence.class);
		q.setParameter("user_email", email);
		q.setParameter("user_password", password);
		q.setParameter("user_category", category);
		/* s.close(); */
		return q.uniqueResult() != null;

	}

}
