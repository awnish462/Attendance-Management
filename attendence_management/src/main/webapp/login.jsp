<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login</title>
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	width: 100vw;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container {
	padding: 15px;
	margin: auto;
	min-height: 60%;
	max-height: 90%;
	text-align: left;
	border-radius: 12px;
	background-color: #1100ff60;
	box-shadow: 2px 2px 10px rgba(255, 255, 255, 0.3);
}

h1 {
	color: #fff;
	text-align: center;
	font-size: 60px;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 15px;
	border-radius: 10px;
}

input[type="email"], input[type="password"] {
	appearance: none;
	outline: none;
	border: 1px solid #fff;
	padding: 15px;
	width: 250px;
	font-size: 14px;
	color: #4c4b4b;
	font-weight: 600;
	margin-bottom: 15px;
	border-radius: 5px;
}

::placeholder {
	color: #191919;
	opacity: 1;
}

[type="submit"] {
	font-weight: bold;
	letter-spacing: 1 pixel;
	cursor: pointer;
	background: transparent;
	border: none;
	background: #262626;
	color: #fff;
	padding: 12px;
	margin-top: 15px;
	font-size: 18px;
	border-radius: 15px;
	transition: all 0.5s ease;
}

[type="submit"]:hover {
	transform: scale(1.1);
	background: 5667e8ff;
}
</style>
</head>
<body>
	<div class="container">
		<h1>LogIn</h1>
		<form action="LoginServlet" method="post">
			<input type="email" id="user_email" name="user_email"
				placeholder="Email" required /> <input type="password"
				id="user_password" name="user_password" placeholder="Password"
				required /> <label for="type">You are:</label> <select
				class="form-control text-center" id="type" name="user_category">
				<option>Admin</option>
				<option>Student</option>
				<option>Faculty</option>
			</select>
			<button type="submit">Login</button>
		</form>
	</div>

</body>
</html> 



