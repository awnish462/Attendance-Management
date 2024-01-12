<%@page import="java.util.List"%>
<%@page import="com.Entity.Attendence"%>
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

	<%
	int userclass = Integer.parseInt(request.getParameter("user_class"));
	Session s = FactoryProvider.getFactory().openSession();
	Transaction tx = s.beginTransaction();
	String hql = "From Attendence where userclass=:user_class AND category=:user_category";
	Query<Attendence> q = s.createQuery(hql, Attendence.class);
	q.setParameter("user_class", userclass);
	q.setParameter("user_category","Student");
	List<Attendence> list = q.list();
	for (Attendence attende : list) {
	%>
	<form action="/attendence_management/UpdateServlet" method="post">
		<div class="container">
			<table class="table">
				<thread>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Present</th>
					<th scope="col">Absent</th>
				</tr>


				</thread>
				<tbody>

					<tr>

						<th scope="row"><%=attende.getId()%></th>
						<td><%=attende.getName()%></td>
						<td><input type="checkbox" name="present"
							value="_<%=attende.getId()%>"></td>
						<td><input type="checkbox" name="absent"
							value="_<%=attende.getId()%>"></td>
					</tr>

				</tbody>
			</table>
		</div>



		<%
		}
		%>
		<div class="row justify-content-center mt-5">
			<div class="col-md-1">

				<button class=" btn btn-outline-success">Submit</button>
			</div>
		</div>

	</form>
	<%
	tx.commit();
	%>



</body>
</html>









