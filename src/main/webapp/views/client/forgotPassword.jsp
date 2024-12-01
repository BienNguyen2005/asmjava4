<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên Mật Khẩu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .main-container {
            flex: 1;
        }
        .forgot-password-section {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            max-width: 500px;
            margin: 40px auto;
            transition: transform 0.3s ease;
        }
        .forgot-password-section:hover {
            transform: translateY(-5px);
        }
        .section-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .section-header h2 {
            color: #2d3748;
            font-weight: 600;
            margin-bottom: 15px;
            font-size: 28px;
        }
        .section-header p {
            color: #718096;
            font-size: 1em;
            line-height: 1.6;
            max-width: 400px;
            margin: 0 auto;
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
            border-color: #6a11cb;
            box-shadow: 0 0 0 0.25rem rgba(106, 17, 203, 0.25);
        }
        .form-floating label {
            padding: 1rem;
            color: #718096;
        }
        .form-icon {
            color: #6a11cb;
            font-size: 1.2em;
        }
        .btn-retrieve {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            border: none;
            color: white;
            padding: 15px 25px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 20px;
            border-radius: 10px;
        }
        .btn-retrieve:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
        }
        .error-message {
            color: #e53e3e;
            font-size: 0.875em;
            margin: 8px 0;
            display: flex;
            align-items: center;
            gap: 5px;
            justify-content: center;
        }
        .success-message {
            color: #38a169;
            font-size: 0.875em;
            margin: 8px 0;
            display: flex;
            align-items: center;
            gap: 5px;
            justify-content: center;
        }
        .back-to-login {
            text-align: center;
            margin-top: 20px;
        }
        .back-to-login a {
            color: #6a11cb;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .back-to-login a:hover {
            color: #2575fc;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <jsp:include page="layout/header.jsp" />

        <div class="forgot-password-section">
            <div class="section-header">
                <h2><i class="fas fa-key me-2"></i>Quên Mật Khẩu?</h2>
                <p>Đừng lo lắng! Hãy nhập tên đăng nhập và email của bạn để khôi phục mật khẩu.</p>
            </div>

            <form action="${pageContext.request.contextPath}/forgotPassword" method="post">
                <div class="form-floating">
                    <input type="text" class="form-control" value="${user.id}" 
                           name="id" id="Username" placeholder="Username" required>
                    <label for="Username">
                        <i class="fas fa-user form-icon me-2"></i>Tên đăng nhập
                    </label>
                </div>

                <div class="form-floating">
                    <input type="email" class="form-control" value="${user.email}" 
                           name="email" id="Email" placeholder="Email" required>
                    <label for="Email">
                        <i class="fas fa-envelope form-icon me-2"></i>Email
                    </label>
                </div>

                <c:if test="${not empty errorMessage}">
                    <div class="error-message">
                        <i class="fas fa-exclamation-circle"></i>${errorMessage}
                    </div>
                </c:if>

                <c:if test="${not empty successMessage}">
                    <div class="success-message">
                        <i class="fas fa-check-circle"></i>${successMessage}
                    </div>
                </c:if>

                <button class="btn btn-retrieve" type="submit">
                    <i class="fas fa-paper-plane me-2"></i>Khôi Phục Mật Khẩu
                </button>

                <div class="back-to-login">
                    <a href="${pageContext.request.contextPath}/signin">
                        <i class="fas fa-arrow-left me-1"></i>Quay lại đăng nhập
                    </a>
                </div>
            </form>
        </div>

        <jsp:include page="layout/footer.jsp" />
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>