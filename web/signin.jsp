<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #1e3c72, #2a5298);
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
            text-align: center;
            width: 350px;
        }

        .container h1 {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .container p {
            font-size: 16px;
            margin-bottom: 30px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            background-color: rgba(255, 255, 255, 0.9);
            color: #333;
        }

        .btn-login {
            background-color: #ffffff;
            color: #1e3c72;
        }

        .btn-signup {
            background-color: #f5a623;
            color: #ffffff;
        }

        .btn {
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            transition: 0.3s;
            margin-top: 10px;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .link {
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Login</h1>
    <%
        String success = request.getParameter("success");
        if ("true".equals(success)) {
    %>
    <div class="message" style="color: navajowhite;">Successfully signed up! Please login.</div>
    <%
        }
    %>
    <p>Welcome to the Complaint Management System</p>
    <form action="signin" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit" class="btn btn-login">Login</button>
    </form>

    <!-- Sign Up button goes outside the form to avoid double submit -->
    <form action="signup.jsp" method="get">
        <button type="submit" class="btn btn-signup">Sign Up</button>
    </form>
</div>
</body>
</html>
