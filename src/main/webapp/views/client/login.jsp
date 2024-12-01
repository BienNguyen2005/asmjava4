<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #FF6B6B 0%, #4ECDC4 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .main-container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .login-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            max-width: 500px;
            width: 100%;
            position: relative;
            overflow: hidden;
        }
        .login-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 200%;
            height: 4px;
            background: linear-gradient(90deg, #FF6B6B, #4ECDC4, #FF6B6B);
            animation: loading 2s linear infinite;
        }
        @keyframes loading {
            to {
                transform: translateX(50%);
            }
        }
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .login-header h2 {
            color: #2d3748;
            font-weight: 600;
            margin-bottom: 10px;
            font-size: 28px;
        }
        .login-header p {
            color: #718096;
            font-size: 1em;
        }
        .form-floating {
            margin-bottom: 20px;
        }
        .form-floating input {
            border: 2px solid #e2e8f0;
            padding: 15px;
            height: 60px;
            transition: all 0.3s ease;
            font-size: 1em;
        }
        .form-floating input:focus {
            border-color: #4ECDC4;
            box-shadow: 0 0 0 0.25rem rgba(78, 205, 196, 0.25);
        }
        .form-floating label {
            padding: 1rem;
            color: #718096;
        }
        .form-icon {
            color: #4ECDC4;
            font-size: 1.2em;
        }
        .password-field {
            position: relative;
        }
        .toggle-password {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #718096;
            z-index: 10;
        }
        .btn-login {
            background: linear-gradient(135deg, #FF6B6B 0%, #4ECDC4 100%);
            border: none;
            color: white;
            padding: 15px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(78, 205, 196, 0.4);
        }
        .forgot-password {
            text-align: center;
            margin-top: 15px;
        }
        .forgot-password a {
            color: #4ECDC4;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .forgot-password a:hover {
            color: #FF6B6B;
            text-decoration: underline;
        }
        .error-message {
            color: #FF6B6B;
            font-size: 0.875em;
            margin-top: 5px;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .social-login {
            margin-top: 25px;
            text-align: center;
        }
        .social-login p {
            color: #718096;
            margin-bottom: 15px;
        }
        .social-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
        }
        .social-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            transition: all 0.3s ease;
        }
        .social-btn:hover {
            transform: translateY(-3px);
        }
        .google {
            background: #DB4437;
        }
        .facebook {
            background: #4267B2;
        }
        .twitter {
            background: #1DA1F2;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="login-container">
            <div class="login-header">
                <h2><i class="fas fa-user-circle me-2"></i>Đăng Nhập</h2>
                <p>Chào mừng bạn trở lại! Vui lòng đăng nhập để tiếp tục.</p>
            </div>

            <form action="${pageContext.request.contextPath}/signin" method="post">
                <div class="form-floating">
                    <input type="text" class="form-control" name="id" id="Username" 
                           value="${user.id}" placeholder="Username" required>
                    <label for="Username">
                        <i class="fas fa-user form-icon me-2"></i>Tên đăng nhập
                    </label>
                </div>

                <div class="form-floating password-field">
                    <input type="password" class="form-control" name="password" 
                           id="password" value="${user.password}" placeholder="Password" required>
                    <label for="password">
                        <i class="fas fa-lock form-icon me-2"></i>Mật khẩu
                    </label>
                    <i class="toggle-password fas fa-eye" onclick="togglePassword()"></i>
                </div>

                <c:if test="${not empty errorMessage}">
                    <div class="error-message">
                        <i class="fas fa-exclamation-circle"></i>${errorMessage}
                    </div>
                </c:if>

                <div class="d-grid">
                    <button class="btn btn-login btn-lg text-uppercase fw-bold mb-2" type="submit">
                        <i class="fas fa-sign-in-alt me-2"></i>Đăng Nhập
                    </button>
                </div>

                <div class="forgot-password">
                    <a href="${pageContext.request.contextPath}/forgotPassword">
                        <i class="fas fa-key me-1"></i>Quên mật khẩu?
                    </a>
                </div>

                <div class="social-login">
                    <p>Hoặc đăng nhập với</p>
                    <div class="social-buttons">
                        <a href="#" class="social-btn google">
                            <i class="fab fa-google"></i>
                        </a>
                        <a href="#" class="social-btn facebook">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="social-btn twitter">
                            <i class="fab fa-twitter"></i>
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const toggleIcon = document.querySelector('.toggle-password');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>