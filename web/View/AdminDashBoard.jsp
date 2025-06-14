<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Complaints Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            min-height: 100vh;
            overflow-x: hidden;
            position: relative;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
            radial-gradient(circle at 80% 20%, rgba(255, 255, 255, 0.15) 0%, transparent 50%),
            radial-gradient(circle at 40% 40%, rgba(120, 119, 198, 0.15) 0%, transparent 50%);
            pointer-events: none;
            z-index: 1;
        }

        .floating-elements {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
        }

        .floating-shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
            animation: float 8s ease-in-out infinite;
        }

        .floating-shape:nth-child(1) {
            width: 100px;
            height: 100px;
            top: 10%;
            left: 10%;
            animation-delay: 0s;
        }

        .floating-shape:nth-child(2) {
            width: 150px;
            height: 150px;
            top: 60%;
            right: 10%;
            animation-delay: 3s;
        }

        .floating-shape:nth-child(3) {
            width: 80px;
            height: 80px;
            top: 30%;
            left: 70%;
            animation-delay: 6s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); opacity: 0.7; }
            50% { transform: translateY(-30px) rotate(180deg); opacity: 1; }
        }

        .container {
            max-width: 1400px;
            margin: 40px auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 25px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            animation: slideInUp 1s ease-out;
            position: relative;
            z-index: 2;
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(80px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
            flex-wrap: wrap;
        }

        h1 {
            background: linear-gradient(45deg, #1e3c72, #2a5298);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-size: 3rem;
            font-weight: 700;
            position: relative;
            animation: titleGlow 3s ease-in-out infinite alternate;
        }

        @keyframes titleGlow {
            from { filter: drop-shadow(0 0 15px rgba(30, 60, 114, 0.3)); }
            to { filter: drop-shadow(0 0 30px rgba(42, 82, 152, 0.6)); }
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(45deg, #1e3c72, #2a5298);
            border-radius: 2px;
            animation: lineExpand 1.5s ease-out 0.5s both;
        }

        @keyframes lineExpand {
            from { width: 0; }
            to { width: 100%; }
        }

        .admin-badge {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
            padding: 12px 24px;
            border-radius: 50px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 8px 20px rgba(231, 76, 60, 0.3);
            animation: badgePulse 2s ease-in-out infinite;
        }

        @keyframes badgePulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        .stat-card {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.7));
            padding: 20px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            animation: cardSlideIn 0.8s ease-out;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }

        @keyframes cardSlideIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #1e3c72;
            margin-bottom: 5px;
        }

        .stat-label {
            color: #666;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.9rem;
        }

        .table-container {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            animation: tableSlideIn 1.2s ease-out 0.3s both;
            overflow: hidden;
        }

        @keyframes tableSlideIn {
            from {
                opacity: 0;
                transform: translateX(-80px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        th {
            background: linear-gradient(45deg, #1e3c72, #2a5298);
            color: white;
            padding: 20px 15px;
            text-align: center;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            font-size: 14px;
        }

        th::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(45deg, #e74c3c, #c0392b);
        }

        td {
            padding: 18px 15px;
            text-align: center;
            background: white;
            transition: all 0.3s ease;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            position: relative;
        }

        tr {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        tr:hover {
            background: linear-gradient(45deg, rgba(30, 60, 114, 0.05), rgba(42, 82, 152, 0.05));
            transform: scale(1.02);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        tr:hover td {
            background: transparent;
        }

        select, textarea {
            width: 100%;
            padding: 10px 12px;
            border: 2px solid transparent;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.9);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            font-family: inherit;
            font-size: 14px;
        }

        select:focus, textarea:focus {
            outline: none;
            border-color: #1e3c72;
            background: white;
            box-shadow: 0 0 15px rgba(30, 60, 114, 0.2);
            transform: scale(1.02);
        }

        textarea {
            resize: vertical;
            min-height: 60px;
            max-height: 120px;
        }

        .status-select {
            font-weight: 600;
            text-transform: uppercase;
        }

        .status-select option[value="PENDING"] {
            background-color: #fff3cd;
            color: #856404;
        }

        .status-select option[value="IN_PROGRESS"] {
            background-color: #cce5ff;
            color: #004085;
        }

        .status-select option[value="RESOLVED"] {
            background-color: #d4edda;
            color: #155724;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn {
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            font-size: 12px;
            min-width: 80px;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn-update {
            background: linear-gradient(45deg, #28a745, #20c997);
            color: white;
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.3);
        }

        .btn-update:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(40, 167, 69, 0.4);
        }

        .btn-delete {
            background: linear-gradient(45deg, #dc3545, #c82333);
            color: white;
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.3);
        }

        .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(220, 53, 69, 0.4);
        }

        .btn:active {
            transform: translateY(0);
        }

        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .status-pending {
            background: linear-gradient(45deg, #ffc107, #ffca2c);
            color: #856404;
        }

        .status-progress {
            background: linear-gradient(45deg, #007bff, #0056b3);
            color: white;
        }

        .status-resolved {
            background: linear-gradient(45deg, #28a745, #20c997);
            color: white;
        }

        .loading-spinner {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 2px solid rgba(30, 60, 114, 0.3);
            border-radius: 50%;
            border-top-color: #1e3c72;
            animation: spin 1s ease-in-out infinite;
            margin-right: 10px;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            table {
                font-size: 12px;
            }

            th, td {
                padding: 12px 8px;
            }
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }

            .header-section {
                flex-direction: column;
                gap: 20px;
                text-align: center;
            }

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            table {
                font-size: 11px;
            }

            th, td {
                padding: 8px 4px;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn {
                font-size: 10px;
                padding: 8px 16px;
            }
        }

        /* Custom scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb {
            background: linear-gradient(45deg, #1e3c72, #2a5298);
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(45deg, #2a5298, #1e3c72);
        }
    </style>
</head>
<body>
<div class="floating-elements">
    <div class="floating-shape"></div>
    <div class="floating-shape"></div>
    <div class="floating-shape"></div>
</div>

<div class="container">
    <div class="header-section">
        <h1>🛡️ Admin Dashboard</h1>
        <div class="admin-badge">
            👨‍💼 Administrator
        </div>
    </div>

    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-number">24</div>
            <div class="stat-label">📋 Total Complaints</div>
        </div>
        <div class="stat-card">
            <div class="stat-number">8</div>
            <div class="stat-label">⏳ Pending</div>
        </div>
        <div class="stat-card">
            <div class="stat-number">12</div>
            <div class="stat-label">🔄 In Progress</div>
        </div>
        <div class="stat-card">
            <div class="stat-number">4</div>
            <div class="stat-label">✅ Resolved</div>
        </div>
    </div>

    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>🆔 ID</th>
                <th>👤 User</th>
                <th>📝 Title</th>
                <th>📄 Description</th>
                <th>🏷️ Status</th>
                <th>📅 Created</th>
                <th>🔄 Updated</th>
                <th>💬 Remarks</th>
                <th>⚡ Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><strong>001</strong></td>
                <td>
                    <div style="font-weight: 600; color: #1e3c72;">kamal123</div>
                </td>
                <td>
                    <div style="font-weight: 500;">🔐 Login Issue</div>
                </td>
                <td>User cannot log into the system due to authentication errors.</td>
                <td>
                    <select class="status-select">
                        <option value="PENDING" selected>⏳ Pending</option>
                        <option value="IN_PROGRESS">🔄 In Progress</option>
                        <option value="RESOLVED">✅ Resolved</option>
                    </select>
                </td>
                <td>2025-06-10</td>
                <td>2025-06-12</td>
                <td>
                    <textarea placeholder="Add your remarks here...">Checking user credentials and database connectivity...</textarea>
                </td>
                <td>
                    <div class="action-buttons">
                        <button class="btn btn-update" onclick="updateComplaint(1)">
                            ✏️ Update
                        </button>
                        <button class="btn btn-delete" onclick="deleteComplaint(1)">
                            🗑️ Delete
                        </button>
                    </div>
                </td>
            </tr>

            <tr>
                <td><strong>002</strong></td>
                <td>
                    <div style="font-weight: 600; color: #1e3c72;">sachini89</div>
                </td>
                <td>
                    <div style="font-weight: 500;">💥 System Crash</div>
                </td>
                <td>Application crashes when submitting forms with large attachments.</td>
                <td>
                    <select class="status-select">
                        <option value="PENDING">⏳ Pending</option>
                        <option value="IN_PROGRESS" selected>🔄 In Progress</option>
                        <option value="RESOLVED">✅ Resolved</option>
                    </select>
                </td>
                <td>2025-06-11</td>
                <td>2025-06-13</td>
                <td>
                    <textarea placeholder="Add your remarks here...">Developer team assigned. Investigating memory allocation issues...</textarea>
                </td>
                <td>
                    <div class="action-buttons">
                        <button class="btn btn-update" onclick="updateComplaint(2)">
                            ✏️ Update
                        </button>
                        <button class="btn btn-delete" onclick="deleteComplaint(2)">
                            🗑️ Delete
                        </button>
                    </div>
                </td>
            </tr>

            <tr>
                <td><strong>003</strong></td>
                <td>
                    <div style="font-weight: 600; color: #1e3c72;">nimal456</div>
                </td>
                <td>
                    <div style="font-weight: 500;">🐌 Slow Performance</div>
                </td>
                <td>Dashboard takes too long to load user data and reports.</td>
                <td>
                    <select class="status-select">
                        <option value="PENDING">⏳ Pending</option>
                        <option value="IN_PROGRESS">🔄 In Progress</option>
                        <option value="RESOLVED" selected>✅ Resolved</option>
                    </select>
                </td>
                <td>2025-06-08</td>
                <td>2025-06-14</td>
                <td>
                    <textarea placeholder="Add your remarks here...">Database optimization completed. Performance improved by 75%.</textarea>
                </td>
                <td>
                    <div class="action-buttons">
                        <button class="btn btn-update" onclick="updateComplaint(3)">
                            ✏️ Update
                        </button>
                        <button class="btn btn-delete" onclick="deleteComplaint(3)">
                            🗑️ Delete
                        </button>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Add ripple effect to buttons
        const buttons = document.querySelectorAll('.btn');
        buttons.forEach(button => {
            button.addEventListener('click', function(e) {
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;

                ripple.style.cssText = `
                        position: absolute;
                        width: ${size}px;
                        height: ${size}px;
                        left: ${x}px;
                        top: ${y}px;
                        background: rgba(255, 255, 255, 0.6);
                        border-radius: 50%;
                        transform: scale(0);
                        animation: ripple 0.6s linear;
                        pointer-events: none;
                        z-index: 1000;
                    `;

                this.appendChild(ripple);

                setTimeout(() => {
                    ripple.remove();
                }, 600);
            });
        });

        // Add CSS for ripple animation
        const style = document.createElement('style');
        style.textContent = `
                @keyframes ripple {
                    to {
                        transform: scale(4);
                        opacity: 0;
                    }
                }
            `;
        document.head.appendChild(style);

        // Animate table rows on scroll
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.animation = 'slideInFromLeft 0.6s ease-out';
                }
            });
        });

        document.querySelectorAll('tbody tr').forEach(row => {
            observer.observe(row);
        });

        // Add slideInFromLeft animation
        const animationStyle = document.createElement('style');
        animationStyle.textContent = `
                @keyframes slideInFromLeft {
                    from {
                        opacity: 0;
                        transform: translateX(-30px);
                    }
                    to {
                        opacity: 1;
                        transform: translateX(0);
                    }
                }
            `;
        document.head.appendChild(animationStyle);
    });

    function updateComplaint(id) {
        // Add loading state
        const button = event.target;
        const originalText = button.innerHTML;
        button.innerHTML = '<div class="loading-spinner"></div>Updating...';
        button.disabled = true;

        // Simulate API call
        setTimeout(() => {
            button.innerHTML = originalText;
            button.disabled = false;

            // Show success message
            showNotification('✅ Complaint updated successfully!', 'success');
        }, 1500);

        // Here you would typically make an AJAX call to your servlet
        console.log('Updating complaint ID:', id);
    }

    function deleteComplaint(id) {
        if (confirm('🤔 Are you sure you want to delete this complaint? This action cannot be undone.')) {
            const button = event.target;
            const originalText = button.innerHTML;
            button.innerHTML = '<div class="loading-spinner"></div>Deleting...';
            button.disabled = true;

            // Simulate API call
            setTimeout(() => {
                // Remove the row with animation
                const row = button.closest('tr');
                row.style.animation = 'slideOutRight 0.5s ease-in';

                setTimeout(() => {
                    row.remove();
                    showNotification('🗑️ Complaint deleted successfully!', 'success');
                }, 500);
            }, 1000);

            // Here you would typically make an AJAX call to your servlet
            console.log('Deleting complaint ID:', id);
        }
    }

    function showNotification(message, type) {
        const notification = document.createElement('div');
        notification.style.cssText = `
                position: fixed;
                top: 20px;
                right: 20px;
                background: ${type == 'success' ? 'linear-gradient(45deg, #28a745, #20c997)' : 'linear-gradient(45deg, #dc3545, #c82333)'};
                color: white;
                padding: 15px 25px;
                border-radius: 10px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
                z-index: 10000;
                font-weight: 600;
                animation: slideInRight 0.5s ease-out;
            `;
        notification.textContent = message;

        document.body.appendChild(notification);

        setTimeout(() => {
            notification.style.animation = 'slideOutRight 0.5s ease-in';
            setTimeout(() => {
                notification.remove();
            }, 500);
        }, 3000);
    }

    // Add slide animations for notifications
    const notificationStyle = document.createElement('style');
    notificationStyle.textContent = `
            @keyframes slideInRight {
                from {
                    opacity: 0;
                    transform: translateX(100px);
                }
                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }

            @keyframes slideOutRight {
                from {
                    opacity: 1;
                    transform: translateX(0);
                }
                to {
                    opacity: 0;
                    transform: translateX(100px);
                }
            }

            @keyframes slideOutRight {
                from {
                    opacity: 1;
                    transform: translateX(0);
                }
                to {
                    opacity: 0;
                    transform: translateX(100px);
                }
            }
        `;
    document.head.appendChild(notificationStyle);
</script>
</body>
</html>