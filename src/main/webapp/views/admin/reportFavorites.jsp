<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reports Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .nav-pills .nav-link {
            color: #6c757d;
            border-radius: 10px;
            padding: 10px 20px;
            margin: 0 5px;
            transition: all 0.3s;
        }
        .nav-pills .nav-link:hover {
            background-color: #f8f9fa;
        }
        .nav-pills .nav-link.active {
            background-color: #0d6efd;
            color: white;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .table {
            margin-bottom: 0;
        }
        .table thead th {
            background-color: #f8f9fa;
            border-bottom: none;
            padding: 15px;
            font-weight: 600;
        }
        .table tbody td {
            padding: 15px;
            vertical-align: middle;
        }
        .badge-count {
            background-color: #0d6efd;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 14px;
        }
        .date-badge {
            background-color: #e9ecef;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 13px;
            color: #495057;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container">
        <jsp:include page="layout/header.jsp" />

        <div class="row mt-4">
            <div class="col-12">
                <div class="card">
                    <div class="card-header bg-white py-3">
                        <h5 class="card-title mb-0">
                            <i class="fas fa-chart-line me-2 text-primary"></i>Video Analytics
                        </h5>
                    </div>
                    <div class="card-body">
                        <nav class="nav nav-pills flex-column flex-sm-row mb-4 justify-content-center">
                            <a class="flex-sm-fill text-sm-center nav-link active" href="${pageContext.request.contextPath}/admin/reportFavorites">
                                <i class="fas fa-heart me-2"></i>Favorites
                            </a>
                            <a class="flex-sm-fill text-sm-center nav-link" href="${pageContext.request.contextPath}/admin/reportFavoriteUser">
                                <i class="fas fa-users me-2"></i>Favorite Users
                            </a>
                            <a class="flex-sm-fill text-sm-center nav-link" href="${pageContext.request.contextPath}/admin/reportShareFriend">
                                <i class="fas fa-share-alt me-2"></i>Shared Friends
                            </a>
                        </nav>

                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">Video Title</th>
                                        <th scope="col" class="text-center">Favorites</th>
                                        <th scope="col" class="text-center">Latest Date</th>
                                        <th scope="col" class="text-center">Oldest Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-video me-2 text-primary"></i>
                                                <span>Lâu ghê mới gặp</span>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <span class="badge-count">100</span>
                                        </td>
                                        <td class="text-center">
                                            <span class="date-badge">
                                                <i class="far fa-calendar-alt me-1"></i>31/12/2023
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <span class="date-badge">
                                                <i class="far fa-calendar-alt me-1"></i>10/11/2022
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-video me-2 text-primary"></i>
                                                <span>Buổi chiều tà</span>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <span class="badge-count">150</span>
                                        </td>
                                        <td class="text-center">
                                            <span class="date-badge">
                                                <i class="far fa-calendar-alt me-1"></i>15/11/2024
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <span class="date-badge">
                                                <i class="far fa-calendar-alt me-1"></i>05/11/2022
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="layout/footer.jsp" />
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>