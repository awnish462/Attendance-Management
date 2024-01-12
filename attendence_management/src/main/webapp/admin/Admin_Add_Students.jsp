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
	<div class="container m-5" style="background-color: #80BCBD">
		<form action="SignupServlet" method="post">

			<div class="form-group text-center">
				<label for="name">Name</label> <input type="text" name="user_name"
					placeholder="Enter Your Name" required>
			</div>
			<div class="form-group mt-3 text-center">
				<label for="Email Address">Email</label> <input name="user_email"
					type="email" placeholder="Enter Your Email" required>
			</div>

			<div class="form-group text-center">
				<label for="Password">Password</label> <input name="user_password"
					type="password" placeholder="Enter Your Password" required>
			</div>
			<div class="form-group text-center">
				<label for="Class">Class</label>
				<div class="row justify-content-center mt-5">
					<div class="col-md-4">
						<Select class="text-center " name="user_class" required>
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
				</div>
			</div>

			<div class="form-group text-center">
				<label for="type">You are:</label> <select
					class="form-control text-center" id="type" name="user_category">
					<option>Admin</option>
					<option>Student</option>
					<option>Faculty</option>
				</select>
			</div>

			<div class="form-group text-center">
				<button type="submit" class="btn btn-outline-success">Add</button>
			</div>

		</form>
	</div>
</body>
</html>