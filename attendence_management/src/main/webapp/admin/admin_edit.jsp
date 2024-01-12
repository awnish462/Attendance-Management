<%@page import="com.Entity.Attendence"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
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
<%@include file="include_file.jsp" %>

	<h1>Admin Edit Panel</h1>
	<%int id =Integer.parseInt(request.getParameter("user_id"));
	Session s=FactoryProvider.getFactory().openSession();
	Attendence attendence=s.get(Attendence.class,id);
	s.close();
	
	%>

	<div class="container">
		<div class="justify-center mt-5 ">
			<div class="col md-4">
			<form action ="/attendence_management/AdminEditServlet" method="post">
			<input name="user_id" value="<%= attendence.getId()%>" type="hidden">
			<label>Name</label>
			<div class="from-group mt-5">
			<input name="user_name" value="<%= attendence.getName()%>">
			</div>
			
			<label>Email</label>
			<div class="from-group mt-5">
			<input name="user_email" value="<%= attendence.getEmail()%>">
			</div>
			
			<label>Class</label>
			<div class="from-group mt-5">
			 <Select class="text-center "
							name="user_class" required>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</Select>

			
			
			</div>
			
			<button class="btn btn-outline-success">Edit</button>
			
			</form>
			
			
			
			</div>
		</div>
	</div>

</body>
</html>