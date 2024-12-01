<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký Tài Khoản</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #7F7FD5 0%, #86A8E7 50%, #91EAE4 100%);
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
        .register-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            max-width: 600px;
            width: 100%;
            position: relative;
            overflow: hidden;
        }
        .register-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 200%;
            height: 4px;
            background: linear-gradient(90deg, #7F7FD5, #86A8E7, #91EAE4);
            animation: loading 2s linear infinite;
        }
        @keyframes loading {
            to {
                transform: translateX(50%);
            }
        }
        .register-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .register-header h2 {
            color: #2d3748;
            font-weight: 600;
            margin-bottom: 10px;
            font-size: 28px;
        }
        .register-header p {
            color: #718096;
            font-size: 1em;
        }
        .form-floating {
            margin-bottom: 20px;
            position: relative;
        }
        .form-floating input {
            border: 2px solid #e2e8f0;
            padding: 15px;
            height: 60px;
            transition: all 0.3s ease;
            font-size: 1em;
        }
        .form-floating input:focus {
            border-color: #7F7FD5;
            box-shadow: 0 0 0 0.25rem rgba(127, 127, 213, 0.25);
        }
        .form-floating label {
            padding: 1rem;
            color: #718096;
        }
        .form-icon {
            color: #7F7FD5;
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
        .btn-register {
            background: linear-gradient(135deg, #7F7FD5 0%, #86A8E7 50%, #91EAE4 100%);
            border: none;
            color: white;
            padding: 15px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 20px;
            border-radius: 10px;
        }
        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(127, 127, 213, 0.4);
        }
        .error-message {
            color: #e53e3e;
            font-size: 0.875em;
            margin-top: 5px;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .success-message {
            color: #38a169;
            font-size: 0.875em;
            margin-top: 5px;
            display: flex;
            align-items: center;
            gap: 5px;
            justify-content: center;
        }
        .input-group {
            position: relative;
            margin-bottom: 25px;
        }
        .validation-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            z-index: 10;
        }
        .validation-icon.valid {
            color: #38a169;
        }
        .validation-icon.invalid {
            color: #e53e3e;
        }
        .terms {
            text-align: center;
            margin-top: 20px;
            color: #718096;
            font-size: 0.9em;
        }
        .terms a {
            color: #7F7FD5;
            text-decoration: none;
            font-weight: 500;
        }
        .terms a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="register-container">
            <div class="register-header">
                <h2><i class="fas fa-user-plus me-2"></i>Đăng Ký Tài Khoản</h2>
                <p>Tạo tài khoản mới để trải nghiệm dịch vụ của chúng tôi</p>
            </div>

            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="input-group">
                    <div class="form-floating">
                        <input type="text" class="form-control" name="id" id="Username" 
                               value="${user.id}" placeholder="Username" required>
                        <label for="Username">
                            <i class="fas fa-user form-icon me-2"></i>Tên đăng nhập
                        </label>
                    </div>
                    <c:if test="${not empty errorUsername}">
                        <div class="error-message">
                            <i class="fas fa-exclamation-circle"></i>${errorUsername}
                        </div>
                    </c:if>
                </div>

                <div class="input-group">
                    <div class="form-floating password-field">
                        <input type="password" class="form-control" name="password" 
                               id="password" value="${user.password}" placeholder="Password" required>
                        <label for="password">
                            <i class="fas fa-lock form-icon me-2"></i>Mật khẩu
                        </label>
                        <i class="toggle-password fas fa-eye" onclick="togglePassword('password')"></i>
                    </div>
                </div>

                <div class="input-group">
                    <div class="form-floating">
                        <input type="text" class="form-control" name="fullname" 
                               id="fullname" value="${user.fullname}" placeholder="Fullname" required>
                        <label for="fullname">
                            <i class="fas fa-id-card form-icon me-2"></i>Họ và tên
                        </label>
                    </div>
                </div>

                <div class="input-group">
                    <div class="form-floating">
                        <input type="email" class="form-control" name="email" 
                               id="email" value="${user.email}" placeholder="Email" required>
                        <label for="email">
                            <i class="fas fa-envelope form-icon me-2"></i>Email
                        </label>
                    </div>
                    <c:if test="${not empty errorEmail}">
                        <div class="error-message">
                            <i class="fas fa-exclamation-circle"></i>${errorEmail}
                        </div>
                    </c:if>
                </div>

                <c:if test="${not empty success}">
                    <div class="success-message">
                        <i class="fas fa-check-circle"></i>${success}
                    </div>
                </c:if>

                <button class="btn btn-register" type="submit">
                    <i class="fas fa-user-plus me-2"></i>Đăng Ký
                </button>

                <div class="terms">
                    Bằng cách đăng ký, bạn đồng ý với 
                    <a href="#">Điều khoản dịch vụ</a> và 
                    <a href="#">Chính sách bảo mật</a> của chúng tôi
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function togglePassword(inputId) {
            const passwordInput = document.getElementById(inputId);
            const toggleIcon = passwordInput.nextElementSibling.nextElementSibling;
            
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