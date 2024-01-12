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
	<div class="container">
		<form class="form" action="addAttendance.jsp">

			<h1 class=" text-center">Welcome to faculty panel</h1>

			<div class="container">

				<div class="row justify-content-center mt-5">
					<div class="col-md-4">
						<label>Class</label> <Select class="text-center "
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
				</div>


				<div class="row justify-content-center mt-5">
					<div class="col-md-4">
						<!-- Centered Button -->
						<button class="btn btn-outline-success">Add Attendance</button>


					</div>
				</div>
			</div>

		</form>

		<!-- <form class="form" action="editAttendance.jsp">

			<div class="container">

				<div class="row justify-content-center mt-5">
					<div class="col-md-4">
						<label>Class</label> <Select class="text-center "
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
				</div>


				<div class="row justify-content-center mt-5">
					<div class="col-md-4">
						Centered Button
						<button class="btn btn-outline-success">Edit Attendance</button>

					</div>
				</div>
			</div>

		</form> -->
	</div>



</body>
</html>