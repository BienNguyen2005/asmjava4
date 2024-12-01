<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Báo Cáo Lượt Thích</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
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
        }
        .nav-pills .nav-link.active {
            background-color: #0d6efd;
            color: white;
            box-shadow: 0 4px 6px rgba(13, 110, 253, 0.2);
        }
        .table {
            margin-top: 25px;
            border-collapse: separate;
            border-spacing: 0;
        }
        .table thead th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            padding: 15px;
            font-weight: 600;
            color: #495057;
        }
        .table tbody td {
            padding: 15px;
            vertical-align: middle;
            border-bottom: 1px solid #dee2e6;
        }
        .table tbody tr:hover {
            background-color: #f8f9fa;
        }
        .favorite-count {
            font-weight: bold;
            color: #0d6efd;
        }
        .date-cell {
            color: #6c757d;
        }
        .title-cell {
            max-width: 300px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
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
    </style>
</head>
<body>
    <div class="main-container">
        <jsp:include page="layout/header.jsp" />

        <div class="report-section">
            <div class="report-header">
                <h2><i class="fas fa-chart-bar me-2"></i>Báo Cáo Thống Kê</h2>
                <p>Phân tích chi tiết lượt thích video</p>
            </div>

            <nav class="nav nav-pills flex-column flex-sm-row mb-4">
                <a class="flex-sm-fill text-sm-center nav-link active"
                    href="${pageContext.request.contextPath}/admin/reportFavorites">
                    <i class="fas fa-heart me-2"></i>Favorites
                </a>
                <a class="flex-sm-fill text-sm-center nav-link"
                    href="${pageContext.request.contextPath}/admin/reportFavoriteUser">
                    <i class="fas fa-users me-2"></i>Favorites Users
                </a>
                <a class="flex-sm-fill text-sm-center nav-link"
                    href="${pageContext.request.contextPath}/admin/reportShareFriend">
                    <i class="fas fa-share-alt me-2"></i>Shared Friends
                </a>
            </nav>

            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col" style="width: 40%">
                                <i class="fas fa-film me-2"></i>Video Title
                            </th>
                            <th scope="col" style="width: 20%">
                                <i class="fas fa-heart me-2"></i>Favorite Count
                            </th>
                            <th scope="col" style="width: 20%">
                                <i class="fas fa-calendar-plus me-2"></i>Latest Date
                            </th>
                            <th scope="col" style="width: 20%">
                                <i class="fas fa-calendar-minus me-2"></i>Oldest Date
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" varStatus="loop" items="${listReportFavorites}">
                            <tr>
                                <td class="title-cell">
                                    <i class="fas fa-play-circle me-2"></i>${item.title}
                                </td>
                                <td class="favorite-count">
                                    <span class="badge bg-primary">
                                        <i class="fas fa-heart me-1"></i>${item.favoriteCount}
                                    </span>
                                </td>
                                <td class="date-cell">
                                    <fmt:formatDate pattern="dd-MM-yyyy" value="${item.latestDate}" />
                                </td>
                                <td class="date-cell">
                                    <fmt:formatDate pattern="dd-MM-yyyy" value="${item.oldestate}" />
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <jsp:include page="layout/footer.jsp" />
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>