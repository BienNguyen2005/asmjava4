<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Báo Cáo Chia Sẻ Video</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .report-section {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            margin-top: 30px;
        }
        .nav-pills .nav-link {
            color: #495057;
            font-weight: 500;
            padding: 12px 20px;
            transition: all 0.3s ease;
            border-radius: 10px;
            margin: 0 5px;
        }
        .nav-pills .nav-link:hover {
            background-color: #e9ecef;
            transform: translateY(-2px);
        }
        .nav-pills .nav-link.active {
            background: linear-gradient(45deg, #198754, #20c997);
            color: white;
            box-shadow: 0 4px 15px rgba(25, 135, 84, 0.2);
        }
        .video-select {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        .form-select {
            padding: 12px;
            border-radius: 8px;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }
        .form-select:focus {
            border-color: #198754;
            box-shadow: 0 0 0 0.25rem rgba(25, 135, 84, 0.25);
        }
        .table {
            margin-top: 20px;
            border-collapse: separate;
            border-spacing: 0;
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }
        .table thead th {
            background: linear-gradient(45deg, #f8f9fa, #e9ecef);
            padding: 15px;
            font-weight: 600;
            color: #495057;
            border: none;
        }
        .table tbody td {
            padding: 15px;
            vertical-align: middle;
            border-bottom: 1px solid #dee2e6;
        }
        .table tbody tr:hover {
            background-color: #f8f9fa;
            transform: scale(1.01);
            transition: transform 0.2s ease;
        }
        .report-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .report-header h2 {
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 10px;
        }
        .report-header p {
            color: #6c757d;
            font-size: 1.1em;
        }
        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .user-avatar {
            width: 40px;
            height: 40px;
            background: #e9ecef;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #6c757d;
        }
        .date-badge {
            background: #e9ecef;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.9em;
            color: #495057;
        }
        .email-cell {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .email-icon {
            color: #6c757d;
        }
        .empty-message {
            text-align: center;
            padding: 40px;
            color: #6c757d;
            font-style: italic;
        }
        .share-info {
            display: flex;
            align-items: center;
            gap: 5px;
            color: #198754;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <jsp:include page="layout/header.jsp" />

        <div class="report-section">
            <div class="report-header">
                <h2><i class="fas fa-share-alt me-2"></i>Báo Cáo Chia Sẻ Video</h2>
                <p>Thống kê chi tiết lượt chia sẻ video đến bạn bè</p>
            </div>

            <nav class="nav nav-pills flex-column flex-sm-row mb-4">
                <a class="flex-sm-fill text-sm-center nav-link"
                    href="${pageContext.request.contextPath}/admin/reportFavorites">
                    <i class="fas fa-heart me-2"></i>Favorites
                </a>
                <a class="flex-sm-fill text-sm-center nav-link"
                    href="${pageContext.request.contextPath}/admin/reportFavoriteUser">
                    <i class="fas fa-users me-2"></i>Favorites Users
                </a>
                <a class="flex-sm-fill text-sm-center nav-link active"
                    href="${pageContext.request.contextPath}/admin/reportShareFriend">
                    <i class="fas fa-share-alt me-2"></i>Shared Friends
                </a>
            </nav>

            <div class="video-select">
                <form id="videoForm" action="${pageContext.request.contextPath}/admin/reportShareFriend" 
                      method="post" class="mb-3">
                    <select class="form-select" aria-label="Default select example" 
                            name="id" onchange="submitForm()">
                        <option selected disabled>Chọn video để xem thống kê chia sẻ</option>
                        <c:forEach var="item" varStatus="loop" items="${listVideo}">
                            <option ${video.id == item.id ? 'selected': '' } 
                                    value="${item.id}">${item.title}</option>
                        </c:forEach>
                    </select>
                </form>
            </div>

            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col"><i class="fas fa-user me-2"></i>Sender Name</th>
                            <th scope="col"><i class="fas fa-envelope me-2"></i>Sender Email</th>
                            <th scope="col"><i class="fas fa-paper-plane me-2"></i>Receiver Email</th>
                            <th scope="col"><i class="fas fa-heart me-2"></i>Favorite Date</th>
                            <th scope="col"><i class="fas fa-share me-2"></i>Sent Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty listReportFavoriteUser}">
                                <c:forEach var="item" varStatus="loop" items="${listReportFavoriteUser}">
                                    <tr>
                                        <td>
                                            <div class="user-info">
                                                <div class="user-avatar">
                                                    <i class="fas fa-user"></i>
                                                </div>
                                                ${item.fullname}
                                            </div>
                                        </td>
                                        <td>
                                            <div class="email-cell">
                                                <i class="fas fa-envelope email-icon"></i>
                                                ${item.email}
                                            </div>
                                        </td>
                                        <td>
                                            <div class="share-info">
                                                <i class="fas fa-paper-plane"></i>
                                                ${item.receiverEmail}
                                            </div>
                                        </td>
                                        <td>
                                            <span class="date-badge">
                                                <i class="fas fa-heart me-1"></i>
                                                <fmt:formatDate pattern="dd-MM-yyyy" value="${item.favoriteDate}" />
                                            </span>
                                        </td>
                                        <td>
                                            <span class="date-badge">
                                                <i class="fas fa-share me-1"></i>
                                                <fmt:formatDate pattern="dd-MM-yyyy" value="${item.sentDate}" />
                                            </span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5" class="empty-message">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Không có dữ liệu chia sẻ để hiển thị
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>

        <jsp:include page="layout/footer.jsp" />
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function submitForm() {
            document.getElementById("videoForm").submit();
        }
    </script>
</body>
</html>