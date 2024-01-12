<%@page import="com.Entity.Attendence"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Students</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
<%@include file="include_file.jsp" %>

	<h1 style="text-align:center">All Students</h1>

	<%
	Session s = FactoryProvider.getFactory().openSession();
	String hql = "From Attendence where category=:student";
	Query q = s.createQuery(hql);
	q.setParameter("student", "Student");
	List<Attendence> student = q.list();

	for (Attendence students : student) {
	%>
	<div class="container">
	
		<div class="table">
			<table>
				<thread>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Email</th>
					<th>class</th>

				</tr>
				<tbody>
					<tr>
						<td><%=students.getId()%></td>
						<td><%=students.getName()%></td>
						<td><%=students.getEmail()%></td>
						<td><%=students.getUserclass()%></td>
					</tr>


				</tbody>


				</thread>



			</table>


			<a href="admin_edit.jsp?user_id=<%=students.getId()%>"><button
					class="btn btn-outline-success">Edit</button></a> <a
				href="/attendence_management/AdminDeleteServlet?user_id=<%=students.getId()%>"><button
					class="btn btn-outline-danger">Delete</button></a>

		</div>

	</div>
	<%
	}
	s.close();
	%>

</body>
</html>