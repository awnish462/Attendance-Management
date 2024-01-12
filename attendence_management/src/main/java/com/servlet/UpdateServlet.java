package com.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Entity.DateAttendance;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class EditSetvlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] presentId = request.getParameterValues("present");
		String[] absentId = request.getParameterValues("absent");

		updateAttendance(absentId, false, true);
		updateAttendance(presentId, true, false);

		response.sendRedirect("faculty/faculty_home.jsp");
	}

	private void updateAttendance(String[] studentIds, boolean isPresent,boolean isAbsent) {
		if (studentIds != null) {
			Session session = null;
			try {
				session = FactoryProvider.getFactory().openSession();
				Transaction tx = session.beginTransaction();
				for (String studentId : studentIds) {
					int id = Integer.parseInt(studentId.substring(1));
					System.out.println(id);

					DateAttendance da = new DateAttendance(id, isPresent, isAbsent, LocalDate.now()) ;

					session.save(da);

				}
				tx.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (session != null && session.isOpen()) {
					session.close();
				}
			}
		}

		}
	}

