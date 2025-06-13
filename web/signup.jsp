<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
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
            width: 370px;
        }

        .container h1 {
            font-size: 28px;
            margin-bottom: 10px;
        }

        .container p {
            font-size: 15px;
            margin-bottom: 25px;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            background-color: rgba(255, 255, 255, 0.9);
            color: #333;
        }

        select {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg xmlns='http://www.w3.org/2000/svg' width='14' height='10' viewBox='0 0 14 10'%3E%3Cpath fill='%23333' d='M7 10L0 0h14z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 10px;
        }

        .btn {
            background-color: #ffffff;
            color: #1e3c72;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #e0e0e0;
        }

        .message {
            text-align: center;
            margin-bottom: 15px;
            font-size: 14px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <%
        String success = request.getParameter("success");
        String error = request.getParameter("error");
        if ("true".equals(success)) {
    %>
    <div class="message" style="color: #00ff8c;">User registered successfully!</div>
    <%
    } else if ("true".equals(error)) {
    %>
    <div class="message" style="color: #ff6464;">Error registering user.</div>
    <%
        }
    %>

    <h1>Create Account</h1>
    <p>Please fill in the details to sign up</p>

    <form action="signup" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="password" name="confirmPassword" placeholder="Confirm Password" required>

        <select name="role" required>
            <option value="" disabled selected>Select Role</option>
            <option value="Employee">Employee</option>
            <option value="Admin">Admin</option>
        </select>

        <button type="submit" class="btn">Sign Up</button>
    </form>
</div>
</body>
</html>
