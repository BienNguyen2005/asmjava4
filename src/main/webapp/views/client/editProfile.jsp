<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Hồ Sơ</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #00b09b 0%, #96c93d 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .main-container {
            flex: 1;
        }
        .profile-section {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            max-width: 600px;
            margin: 40px auto;
            transition: transform 0.3s ease;
        }
        .profile-section:hover {
            transform: translateY(-5px);
        }
        .section-header {
            text-align: center;
            margin-bottom: 30px;
            position: relative;
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
        .avatar-container {
            width: 120px;
            height: 120px;
            margin: 0 auto 30px;
            position: relative;
        }
        .avatar {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background: #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3em;
            color: #00b09b;
            border: 4px solid #fff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
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
            border-color: #00b09b;
            box-shadow: 0 0 0 0.25rem rgba(0, 176, 155, 0.25);
        }
        .form-floating label {
            padding: 1rem;
            color: #718096;
        }
        .form-icon {
            color: #00b09b;
            font-size: 1.2em;
        }
        .btn-update {
            background: linear-gradient(135deg, #00b09b 0%, #96c93d 100%);
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
        .btn-update:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 176, 155, 0.4);
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
    </style>
</head>
<body>
    <div class="main-container">
        <jsp:include page="layout/header.jsp" />

        <div class="profile-section">
            <div class="section-header">
                <div class="avatar-container">
                    <div class="avatar">
                        <i class="fas fa-user"></i>
                    </div>
                </div>
                <h2><i class="fas fa-user-edit me-2"></i>Chỉnh Sửa Hồ Sơ</h2>
                <p>Cập nhật thông tin cá nhân của bạn</p>
            </div>

            <form action="${pageContext.request.contextPath}/editProfile" method="post">
                <input type="hidden" value="${user.id}" name="id">

                <div class="input-group">
                    <div class="form-floating">
                        <input type="text" class="form-control" value="${user.fullname}" 
                               name="fullname" id="fullname" placeholder="Họ và tên" required>
                        <label for="fullname">
                            <i class="fas fa-user form-icon me-2"></i>Họ và tên
                        </label>
                    </div>
                </div>

                <div class="input-group">
                    <div class="form-floating">
                        <input type="email" class="form-control" value="${user.email}" 
                               name="email" id="email" placeholder="Email" required>
                        <label for="email">
                            <i class="fas fa-envelope form-icon me-2"></i>Email
                        </label>
                    </div>
                    <span class="error-message">
                        <c:if test="${not empty errorEmail}">
                            <i class="fas fa-exclamation-circle"></i>${errorEmail}
                        </c:if>
                    </span>
                </div>

                <c:if test="${not empty success}">
                    <div class="success-message">
                        <i class="fas fa-check-circle"></i>${success}
                    </div>
                </c:if>

                <button class="btn btn-update" type="submit">
                    <i class="fas fa-save me-2"></i>Cập Nhật Thông Tin
                </button>
            </form>
        </div>

        <jsp:include page="layout/footer.jsp" />
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>