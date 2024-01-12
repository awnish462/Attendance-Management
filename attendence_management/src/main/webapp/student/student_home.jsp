<%@page import="com.Entity.DateAttendance"%>
<%@page import="com.Entity.Attendence"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<h1 style="text-align: center">Student Panel</h1>

	<%
	int id = Integer.parseInt(request.getParameter("user_id").trim());
	int present=0;
	Session s = FactoryProvider.getFactory().openSession();
	Transaction tx = s.beginTransaction();
	//here it will return object because we are retrieving specific object ,so for this we need to use object[] 
	/* Query q = s.createQuery("select id,name,email,present,absent From Attendence"); */

			Attendence attendence=s.get(Attendence.class,id);
			String hql = "SELECT COUNT(DISTINCT attendanceDate) FROM DateAttendance WHERE user_id = :studentId AND present = true";
			Query<Long> q = s.createQuery(hql, Long.class);
			q.setParameter("studentId", id); // Assuming studentId is the id of the student
			Long daysPresent = q.uniqueResult();
			String hqll = "SELECT COUNT(DISTINCT attendanceDate) FROM DateAttendance WHERE user_id = :studentId AND absent = true";
			Query<Long> q1 = s.createQuery(hqll, Long.class);
			q1.setParameter("studentId", id); // Assuming studentId is the id of the student
			Long daysAbsent = q1.uniqueResult();

			// Now 'daysPresent' contains the count of distinct days the student is present

	/* Query q = s.createQuery("From Attendence where id=: user_email");
	/* List<Object[]> list = q.list(); */
	/* q.setParameter("user_email", email); 
	List<Attendence> list = q.list();  */

	/* for (Attendence attendence : list) { */
		/* for (Object[] attendence : list) { */
	%>

	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row"><%=attendence.getId()%></th>
					<td><%=attendence.getName()%></td>
					<td><%=attendence.getEmail()%></td>
				</tr>

				<%-- <tr>
					<th scope="row"><%=attendence[0]%></th>
					<td><%=attendence[1]%></td>
					<td><%=attendence[2]%></td>
					<td><%=attendence[3]%></td>
					<td><%=attendence[4]%></td>
				</tr> --%>
				
			</tbody>
		</table>

	</div>
	
	<div class="container">
	
	<h1>Present Days : <%=daysPresent %></h1>
	<h1>Absent Days : <%= daysAbsent %></h1>
	
	</div>


	<%
	/* } */

	tx.commit();
	s.close();
	%>





</body>
</html>