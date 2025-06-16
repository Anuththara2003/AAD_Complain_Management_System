<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Complaint Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(45deg, #ff6b6b, #4ecdc4, #45b7d1, #96ceb4, #feca57);
            background-size: 400% 400%;
            animation: gradientShift 8s ease infinite;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="20" cy="20" r="2" fill="rgba(255,255,255,0.1)"/><circle cx="80" cy="40" r="1" fill="rgba(255,255,255,0.15)"/><circle cx="40" cy="80" r="1.5" fill="rgba(255,255,255,0.1)"/><circle cx="90" cy="80" r="1" fill="rgba(255,255,255,0.2)"/><circle cx="10" cy="60" r="1" fill="rgba(255,255,255,0.1)"/></svg>');
            animation: float 20s linear infinite;
            z-index: -1;
        }

        @keyframes float {
            0% { transform: translateY(100vh) rotate(0deg); }
            100% { transform: translateY(-100vh) rotate(360deg); }
        }

        .login-container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(20px);
            border-radius: 25px;
            box-shadow:
                    0 25px 50px rgba(0, 0, 0, 0.15),
                    0 0 0 1px rgba(255, 255, 255, 0.2),
                    inset 0 1px 0 rgba(255, 255, 255, 0.3);
            padding: 40px;
            width: 100%;
            max-width: 400px;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.3);
            position: relative;
            animation: containerFloat 6s ease-in-out infinite;
        }

        @keyframes containerFloat {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-10px) rotate(0.5deg); }
        }

        .login-container::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: linear-gradient(45deg, #ff6b6b, #4ecdc4, #45b7d1, #96ceb4, #feca57);
            border-radius: 27px;
            z-index: -1;
            animation: borderGlow 3s linear infinite;
            opacity: 0.6;
        }

        @keyframes borderGlow {
            0%, 100% { opacity: 0.6; }
            50% { opacity: 1; }
        }

        .logo {
            margin-bottom: 30px;
        }

        .logo h1 {
            color: #2d3748;
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 8px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            animation: titlePulse 4s ease-in-out infinite;
        }

        @keyframes titlePulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .logo p {
            color: #4a5568;
            font-size: 14px;
            font-weight: 500;
            animation: subtitleFade 2s ease-in-out infinite alternate;
        }

        @keyframes subtitleFade {
            0% { opacity: 0.7; }
            100% { opacity: 1; }
        }

        .success-message {
            background: linear-gradient(135deg, #48bb78, #38a169, #2f855a);
            color: white;
            padding: 15px 25px;
            border-radius: 15px;
            margin-bottom: 25px;
            font-size: 14px;
            font-weight: 600;
            box-shadow:
                    0 8px 25px rgba(72, 187, 120, 0.4),
                    0 0 0 1px rgba(255, 255, 255, 0.2);
            animation: successBounce 0.8s ease-out, successGlow 2s ease-in-out infinite alternate;
            position: relative;
            overflow: hidden;
        }

        .success-message::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            animation: shimmer 2s infinite;
        }

        @keyframes successBounce {
            0% { opacity: 0; transform: translateY(-20px) scale(0.8); }
            60% { transform: translateY(5px) scale(1.05); }
            100% { opacity: 1; transform: translateY(0) scale(1); }
        }

        @keyframes successGlow {
            0% { box-shadow: 0 8px 25px rgba(72, 187, 120, 0.4), 0 0 0 1px rgba(255, 255, 255, 0.2); }
            100% { box-shadow: 0 12px 35px rgba(72, 187, 120, 0.6), 0 0 0 1px rgba(255, 255, 255, 0.3); }
        }

        @keyframes shimmer {
            0% { left: -100%; }
            100% { left: 100%; }
        }

        .form-group {
            margin-bottom: 25px;
            text-align: left;
            position: relative;
            animation: formSlideIn 0.6s ease-out;
        }

        @keyframes formSlideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }

        .form-group label {
            display: block;
            color: #2d3748;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .form-group input {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 15px;
            font-size: 16px;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            background: rgba(255, 255, 255, 0.2);
            color: #2d3748;
            font-weight: 500;
        }

        .form-group input::placeholder {
            color: rgba(45, 55, 72, 0.6);
        }

        .form-group input:focus {
            outline: none;
            border-color: rgba(255, 255, 255, 0.8);
            box-shadow:
                    0 0 0 4px rgba(255, 255, 255, 0.2),
                    0 8px 25px rgba(0, 0, 0, 0.1);
            background: rgba(255, 255, 255, 0.4);
            transform: translateY(-2px);
        }

        .form-group input:hover {
            border-color: rgba(255, 255, 255, 0.5);
            transform: translateY(-1px);
        }

        .login-btn {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4, #45b7d1);
            background-size: 200% 200%;
            color: white;
            border: none;
            border-radius: 15px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            margin-bottom: 25px;
            box-shadow:
                    0 8px 25px rgba(0, 0, 0, 0.2),
                    0 0 0 1px rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
            animation: buttonPulse 3s ease-in-out infinite;
        }

        .login-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent);
            transition: left 0.5s;
        }

        .login-btn:hover {
            transform: translateY(-3px) scale(1.02);
            box-shadow:
                    0 15px 35px rgba(0, 0, 0, 0.3),
                    0 0 0 1px rgba(255, 255, 255, 0.3);
            background-position: 100% 0;
        }

        .login-btn:hover::before {
            left: 100%;
        }

        .login-btn:active {
            transform: translateY(-1px) scale(1.01);
        }

        @keyframes buttonPulse {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }

        .signup-link {
            color: #2d3748;
            text-decoration: none;
            font-weight: 600;
            font-size: 15px;
            transition: all 0.3s ease;
            padding: 8px 16px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.2);
            border: 2px solid rgba(255, 255, 255, 0.3);
            display: inline-block;
            animation: linkFloat 4s ease-in-out infinite;
        }

        .signup-link:hover {
            color: white;
            text-decoration: none;
            background: rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.6);
            transform: translateY(-2px) scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        @keyframes linkFloat {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-3px); }
        }

        .divider {
            margin: 25px 0;
            color: #4a5568;
            font-size: 14px;
            font-weight: 500;
            animation: dividerFade 3s ease-in-out infinite alternate;
        }

        @keyframes dividerFade {
            0% { opacity: 0.6; }
            100% { opacity: 1; }
        }

        .error-message {
            background: linear-gradient(135deg, #f56565, #e53e3e, #c53030);
            color: white;
            padding: 15px 25px;
            border-radius: 15px;
            margin-bottom: 25px;
            font-size: 14px;
            font-weight: 600;
            box-shadow:
                    0 8px 25px rgba(245, 101, 101, 0.4),
                    0 0 0 1px rgba(255, 255, 255, 0.2);
            animation: errorShake 0.8s ease-out, errorGlow 2s ease-in-out infinite alternate;
            position: relative;
            overflow: hidden;
        }

        .error-message::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            animation: shimmer 2s infinite;
        }

        @keyframes errorShake {
            0% { opacity: 0; transform: translateX(-20px); }
            25% { transform: translateX(10px); }
            50% { transform: translateX(-5px); }
            75% { transform: translateX(3px); }
            100% { opacity: 1; transform: translateX(0); }
        }

        @keyframes errorGlow {
            0% { box-shadow: 0 8px 25px rgba(245, 101, 101, 0.4), 0 0 0 1px rgba(255, 255, 255, 0.2); }
            100% { box-shadow: 0 12px 35px rgba(245, 101, 101, 0.6), 0 0 0 1px rgba(255, 255, 255, 0.3); }
        }


    </style>
</head>
<body>
<div class="login-container">
    <div class="logo">
        <h1>Complaint Management System</h1>
        <p>Secure Login Portal</p>
    </div>

    <%
        String success = request.getParameter("success");
        String error = request.getParameter("error");

        if ("true".equals(success)) {
    %>
    <div class="success-message">
        ✓ Successfully signed up! Please login with your credentials.
    </div>
    <%
        }

        if ("true".equals(error)) {
    %>
    <div class="error-message">
        ✗ Invalid username or password. Please try again.
    </div>
    <%
        }
    %>

    <form action="signin" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required
                   placeholder="Enter your username">
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required
                   placeholder="Enter your password">
        </div>

        <button type="submit" class="login-btn">Login</button>
    </form>

    <div class="divider">Don't have an account?</div>

    <a href="View/signup.jsp" class="signup-link">Sign Up Here</a>
</div>

<script>
    // Enhanced interactive effects with more animations
    document.addEventListener('DOMContentLoaded', function() {
        const inputs = document.querySelectorAll('input');
        const container = document.querySelector('.login-container');
        const formGroups = document.querySelectorAll('.form-group');

        // Animated input effects
        inputs.forEach((input, index) => {
            input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'translateY(-5px) scale(1.02)';
                this.parentElement.style.transition = 'all 0.4s cubic-bezier(0.4, 0, 0.2, 1)';

                // Add ripple effect
                const ripple = document.createElement('div');
                ripple.style.cssText = `
                        position: absolute;
                        border-radius: 50%;
                        background: rgba(255,255,255,0.3);
                        transform: scale(0);
                        animation: ripple 0.6s linear;
                        pointer-events: none;
                        left: 50%;
                        top: 50%;
                        width: 20px;
                        height: 20px;
                        margin-left: -10px;
                        margin-top: -10px;
                    `;
                this.parentElement.appendChild(ripple);
                setTimeout(() => ripple.remove(), 600);
            });

            input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'translateY(0) scale(1)';
            });

            // Typing animation effect
            input.addEventListener('input', function() {
                this.style.animation = 'inputPulse 0.3s ease-out';
                setTimeout(() => this.style.animation = '', 300);
            });
        });

        // Form groups staggered animation
        formGroups.forEach((group, index) => {
            group.style.animationDelay = `${index * 0.1}s`;
        });

        // Container parallax effect on mouse move
        document.addEventListener('mousemove', function(e) {
            const x = (e.clientX / window.innerWidth) * 100;
            const y = (e.clientY / window.innerHeight) * 100;

            container.style.transform = `
                    translateY(-10px)
                    rotateX(${(y - 50) * 0.1}deg)
                    rotateY(${(x - 50) * 0.1}deg)
                `;
        });

        // Add floating particles
        function createParticle() {
            const particle = document.createElement('div');
            particle.style.cssText = `
                    position: fixed;
                    width: 4px;
                    height: 4px;
                    background: rgba(255,255,255,0.6);
                    border-radius: 50%;
                    pointer-events: none;
                    z-index: -1;
                    left: ${Math.random() * 100}vw;
                    top: 100vh;
                    animation: floatUp ${5 + Math.random() * 5}s linear forwards;
                `;
            document.body.appendChild(particle);

            setTimeout(() => particle.remove(), 10000);
        }

        // Create particles periodically
        setInterval(createParticle, 300);

        // Add CSS for new animations
        const style = document.createElement('style');
        style.textContent = `
                @keyframes ripple {
                    to {
                        transform: scale(4);
                        opacity: 0;
                    }
                }

                @keyframes inputPulse {
                    0% { transform: scale(1); }
                    50% { transform: scale(1.02); }
                    100% { transform: scale(1); }
                }

                @keyframes floatUp {
                    to {
                        transform: translateY(-100vh) rotate(360deg);
                        opacity: 0;
                    }
                }
            `;
        document.head.appendChild(style);
    });
</script>
</body>
</html>