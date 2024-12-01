<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đổi Mật Khẩu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .main-container {
            flex: 1;
        }
        .change-password-section {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            max-width: 500px;
            margin: 40px auto;
            transition: transform 0.3s ease;
        }
        .change-password-section:hover {
            transform: translateY(-5px);
        }
        .section-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .section-header h2 {
            color: #2d3748;
            font-weight: 600;
            margin-bottom: 10px;
            font-size: 28px;
        }
        .section-header p {
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
        }
        .form-floating input:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.25rem rgba(102, 126, 234, 0.25);
        }
        .form-floating label {
            padding: 1rem;
            color: #718096;
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
        .btn-change {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            color: white;
            padding: 15px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 20px;
        }
        .btn-change:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
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
        }
        .form-icon {
            color: #667eea;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <jsp:include page="layout/header.jsp" />

        <div class="change-password-section">
            <div class="section-header">
                <h2><i class="fas fa-lock me-2"></i>Đổi Mật Khẩu</h2>
                <p>Cập nhật mật khẩu mới cho tài khoản của bạn</p>
            </div>

            <form action="${pageContext.request.contextPath}/changePassword" method="post">
                <input type="hidden" name="id" value="${user.id}">
                
                <div class="form-floating password-field">
                    <input type="password" class="form-control" value="${password}" 
                           name="password" id="currentPassword" placeholder="Current Password" required>
                    <label for="currentPassword">
                        <i class="fas fa-key form-icon me-2"></i>Mật khẩu hiện tại
                    </label>
                    <i class="toggle-password fas fa-eye" onclick="togglePassword('currentPassword')"></i>
                    <span class="error-message">
                        <c:if test="${not empty errorPassword}">
                            <i class="fas fa-exclamation-circle"></i>${errorPassword}
                        </c:if>
                    </span>
                </div>

                <div class="form-floating password-field">
                    <input type="password" class="form-control" value="${newPassword}" 
                           name="newPassword" id="newPassword" placeholder="New Password" required>
                    <label for="newPassword">
                        <i class="fas fa-lock form-icon me-2"></i>Mật khẩu mới
                    </label>
                    <i class="toggle-password fas fa-eye" onclick="togglePassword('newPassword')"></i>
                </div>

                <div class="form-floating password-field">
                    <input type="password" class="form-control" name="confirmNewPassword" 
                           value="${confirmNewPassword}" id="confirmNewPassword" 
                           placeholder="Confirm New Password" required>
                    <label for="confirmNewPassword">
                        <i class="fas fa-check-circle form-icon me-2"></i>Xác nhận mật khẩu mới
                    </label>
                    <i class="toggle-password fas fa-eye" onclick="togglePassword('confirmNewPassword')"></i>
                    <span class="error-message">
                        <c:if test="${not empty errorConfirmNewPassword}">
                            <i class="fas fa-exclamation-circle"></i>${errorConfirmNewPassword}
                        </c:if>
                    </span>
                </div>

                <c:if test="${not empty success}">
                    <div class="success-message">
                        <i class="fas fa-check-circle"></i>${success}
                    </div>
                </c:if>

                <button class="btn btn-change" type="submit">
                    <i class="fas fa-sync-alt me-2"></i>Cập Nhật Mật Khẩu
                </button>
            </form>
        </div>

        <jsp:include page="layout/footer.jsp" />
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function togglePassword(inputId) {
            const input = document.getElementById(inputId);
            const icon = input.parentElement.querySelector('.toggle-password');
            
            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                input.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>