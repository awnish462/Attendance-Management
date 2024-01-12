<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Signup</title>
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
      input[type="text"],
      input[type="password"],
      input[type="email"],
      select {
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
      <h1>SignUp</h1>
      <form id="signupForm" action="SignupServlet" method="post">
        <input type="text" id="user_name" name="user_name" placeholder="Username" required />
        <input type="password" id="user_password" name="user_password" placeholder="Password" required />
        <input type="email" id="user_email" name="user_email" placeholder="Email Address" required />
        <select id="user_class" name="user_class">
          <option value="1">1 Class</option>
          <option value="2">2 Class</option>
          <option value="3">3 Class</option>
          <option value="4">4 Class</option>
          <option value="5">5 Class</option>
          <option value="6">6 Class</option>
          <option value="7">7 Class</option>
          <option value="8">8 Class</option>
          <option value="9">9 Class</option>
          <option value="10">10 Class</option>
        </select>
        <select id="user_category" name="user_category">
          <option >Student</option>
          <option>Admin</option>
          <option>Faculty</option>
        </select>
        <button type="submit">SignUp</button>
       <!-- <a href="login.jsp"><button type="submit">LOGIN</button></a>  -->
      </form>
      
    </div>
  </body>
</html>
