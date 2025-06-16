<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(45deg, #ff6b6b, #4ecdc4, #45b7d1, #96ceb4, #feca57, #a8e6cf);
            background-size: 400% 400%;
            animation: gradientShift 10s ease infinite;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            position: relative;
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
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="25" cy="25" r="2" fill="rgba(255,255,255,0.1)"/><circle cx="75" cy="35" r="1.5" fill="rgba(255,255,255,0.15)"/><circle cx="45" cy="75" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="85" cy="85" r="1.2" fill="rgba(255,255,255,0.2)"/><circle cx="15" cy="65" r="0.8" fill="rgba(255,255,255,0.1)"/><circle cx="60" cy="20" r="1.3" fill="rgba(255,255,255,0.12)"/></svg>');
            animation: floatParticles 25s linear infinite;
            z-index: -1;
        }

        @keyframes floatParticles {
            0% { transform: translateY(100vh) rotate(0deg); }
            100% { transform: translateY(-100vh) rotate(360deg); }
        }

        .container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(25px);
            padding: 40px 30px;
            border-radius: 25px;
            box-shadow:
                    0 25px 50px rgba(0,0,0,0.2),
                    0 0 0 1px rgba(255, 255, 255, 0.3),
                    inset 0 1px 0 rgba(255, 255, 255, 0.4);
            text-align: center;
            width: 370px;
            position: relative;
            animation: containerFloat 8s ease-in-out infinite;
            border: 2px solid rgba(255, 255, 255, 0.2);
        }

        @keyframes containerFloat {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            33% { transform: translateY(-15px) rotate(0.8deg); }
            66% { transform: translateY(-8px) rotate(-0.5deg); }
        }

        .container::before {
            content: '';
            position: absolute;
            top: -3px;
            left: -3px;
            right: -3px;
            bottom: -3px;
            background: linear-gradient(45deg, #ff6b6b, #4ecdc4, #45b7d1, #96ceb4, #feca57, #a8e6cf);
            border-radius: 28px;
            z-index: -1;
            animation: borderGlow 4s linear infinite;
            opacity: 0.7;
        }

        @keyframes borderGlow {
            0%, 100% { opacity: 0.7; }
            50% { opacity: 1; }
        }

        .container h1 {
            font-size: 32px;
            margin-bottom: 10px;
            font-weight: 700;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.3);
            animation: titlePulse 5s ease-in-out infinite;
            background: linear-gradient(45deg, #fff, #f0f8ff, #fff);
            background-size: 200% 200%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        @keyframes titlePulse {
            0%, 100% { transform: scale(1); background-position: 0% 50%; }
            50% { transform: scale(1.05); background-position: 100% 50%; }
        }

        .container p {
            font-size: 16px;
            margin-bottom: 25px;
            font-weight: 500;
            opacity: 0.9;
            animation: subtitleFade 3s ease-in-out infinite alternate;
        }

        @keyframes subtitleFade {
            0% { opacity: 0.8; }
            100% { opacity: 1; }
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 15px;
            font-size: 15px;
            background: rgba(255, 255, 255, 0.2);
            color: #2d3748;
            font-weight: 500;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            animation: inputSlideIn 0.6s ease-out;
        }

        @keyframes inputSlideIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        input[type="text"]:nth-of-type(1) { animation-delay: 0.1s; }
        input[type="text"]:nth-of-type(2) { animation-delay: 0.2s; }
        input[type="password"]:nth-of-type(1) { animation-delay: 0.3s; }
        input[type="password"]:nth-of-type(2) { animation-delay: 0.4s; }
        select { animation-delay: 0.5s; }

        input[type="text"]::placeholder,
        input[type="password"]::placeholder {
            color: rgba(45, 55, 72, 0.6);
            font-weight: 500;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        select:focus {
            outline: none;
            border-color: rgba(255, 255, 255, 0.8);
            background: rgba(255, 255, 255, 0.4);
            box-shadow:
                    0 0 0 4px rgba(255, 255, 255, 0.2),
                    0 8px 25px rgba(0, 0, 0, 0.15);
            transform: translateY(-3px) scale(1.02);
        }

        input[type="text"]:hover,
        input[type="password"]:hover,
        select:hover {
            border-color: rgba(255, 255, 255, 0.5);
            transform: translateY(-2px);
        }

        select {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg xmlns='http://www.w3.org/2000/svg' width='14' height='10' viewBox='0 0 14 10'%3E%3Cpath fill='%23333' d='M7 10L0 0h14z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 12px;
            cursor: pointer;
        }

        .btn {
            background: linear-gradient(135deg, #ffffff, #f8f9fa, #e9ecef);
            color: #2d3748;
            padding: 16px;
            border: none;
            border-radius: 15px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            width: 100%;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow:
                    0 8px 25px rgba(0, 0, 0, 0.15),
                    0 0 0 1px rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
            animation: buttonFloat 6s ease-in-out infinite;
        }

        @keyframes buttonFloat {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-3px); }
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.6), transparent);
            transition: left 0.6s;
        }

        .btn:hover {
            background: linear-gradient(135deg, #f8f9fa, #ffffff, #f1f3f4);
            transform: translateY(-4px) scale(1.02);
            box-shadow:
                    0 15px 35px rgba(0, 0, 0, 0.25),
                    0 0 0 1px rgba(255, 255, 255, 0.3);
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:active {
            transform: translateY(-2px) scale(1.01);
        }

        .message {
            text-align: center;
            margin-bottom: 20px;
            font-size: 15px;
            font-weight: 600;
            padding: 15px 20px;
            border-radius: 15px;
            position: relative;
            overflow: hidden;
        }

        .message[style*="color: #00ff8c"] {
            background: linear-gradient(135deg, #48bb78, #38a169, #2f855a);
            color: white !important;
            box-shadow:
                    0 8px 25px rgba(72, 187, 120, 0.4),
                    0 0 0 1px rgba(255, 255, 255, 0.2);
            animation: successBounce 0.8s ease-out, successGlow 2.5s ease-in-out infinite alternate;
        }

        .message[style*="color: #ff6464"] {
            background: linear-gradient(135deg, #f56565, #e53e3e, #c53030);
            color: white !important;
            box-shadow:
                    0 8px 25px rgba(245, 101, 101, 0.4),
                    0 0 0 1px rgba(255, 255, 255, 0.2);
            animation: errorShake 0.8s ease-out, errorGlow 2.5s ease-in-out infinite alternate;
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

        .message::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            animation: shimmer 3s infinite;
        }

        @keyframes shimmer {
            0% { left: -100%; }
            100% { left: 100%; }
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
    <div class="message" style="color: #00ff8c;">✓ User registered successfully!</div>
    <%
    } else if ("true".equals(error)) {
    %>
    <div class="message" style="color: #ff6464;">✗ Error registering user.</div>
    <%
        }
    %>

    <h1>Create Account</h1>
    <p>Please fill in the details to sign up</p>

    <form action="${pageContext.request.contextPath}/signup" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="text" name="fullname" placeholder="Fullname" required>
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

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const inputs = document.querySelectorAll('input, select');
        const container = document.querySelector('.container');
        const button = document.querySelector('.btn');

        // Enhanced input interactions
        inputs.forEach((input, index) => {
            input.addEventListener('focus', function() {
                // Add ripple effect
                const ripple = document.createElement('div');
                ripple.style.cssText = `
                    position: absolute;
                    border-radius: 50%;
                    background: rgba(255,255,255,0.4);
                    transform: scale(0);
                    animation: ripple 0.8s linear;
                    pointer-events: none;
                    left: 50%;
                    top: 50%;
                    width: 30px;
                    height: 30px;
                    margin-left: -15px;
                    margin-top: -15px;
                    z-index: 1;
                `;
                this.parentElement.style.position = 'relative';
                this.parentElement.appendChild(ripple);
                setTimeout(() => ripple.remove(), 800);
            });

            // Typing animation effect
            input.addEventListener('input', function() {
                this.style.animation = 'inputPulse 0.4s ease-out';
                setTimeout(() => {
                    this.style.animation = `inputSlideIn 0.6s ease-out`;
                    this.style.animationDelay = `${index * 0.1}s`;
                }, 400);
            });
        });

        // Mouse parallax effect
        document.addEventListener('mousemove', function(e) {
            const x = (e.clientX / window.innerWidth) * 100;
            const y = (e.clientY / window.innerHeight) * 100;

            container.style.transform = `
                translateY(-10px)
                rotateX(${(y - 50) * 0.15}deg)
                rotateY(${(x - 50) * 0.15}deg)
            `;
        });

        // Floating particles system
        function createFloatingParticle() {
            const particle = document.createElement('div');
            const size = Math.random() * 6 + 2;
            const duration = Math.random() * 8 + 6;

            particle.style.cssText = `
                position: fixed;
                width: ${size}px;
                height: ${size}px;
                background: rgba(255,255,255,${Math.random() * 0.6 + 0.2});
                border-radius: 50%;
                pointer-events: none;
                z-index: -1;
                left: ${Math.random() * 100}vw;
                top: 100vh;
                animation: floatUp ${duration}s linear forwards;
            `;
            document.body.appendChild(particle);

            setTimeout(() => particle.remove(), duration * 1000);
        }

        // Create particles periodically
        setInterval(createFloatingParticle, 200);

        // Form submission animation
        button.addEventListener('click', function(e) {
            this.style.animation = 'buttonSubmit 0.6s ease-out';
            setTimeout(() => {
                this.style.animation = 'buttonFloat 6s ease-in-out infinite';
            }, 600);
        });

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
                50% { transform: scale(1.03); }
                100% { transform: scale(1); }
            }

            @keyframes floatUp {
                to {
                    transform: translateY(-100vh) rotate(720deg);
                    opacity: 0;
                }
            }

            @keyframes buttonSubmit {
                0% { transform: scale(1); }
                50% { transform: scale(0.95); }
                100% { transform: scale(1); }
            }
        `;
        document.head.appendChild(style);
    });
</script>

</body>
</html>