<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Share Friends Report</title>
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
        .select-video {
            border-radius: 10px;
            padding: 12px;
            border: 2px solid #e9ecef;
        }
        .select-video:focus {
            border-color: #0d6efd;
            box-shadow: none;
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
        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .user-avatar {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }
        .date-badge {
            background-color: #e9ecef;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 13px;
            color: #495057;
        }
        .email-badge {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #6c757d;
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
                            <i class="fas fa-share-alt me-2 text-primary"></i>Share Analysis
                        </h5>
                    </div>
                    <div class="card-body">
                        <nav class="nav nav-pills flex-column flex-sm-row mb-4 justify-content-center">
                            <a class="flex-sm-fill text-sm-center nav-link" href="${pageContext.request.contextPath}/admin/reportFavorites">
                                <i class="fas fa-heart me-2"></i>Favorites
                            </a>
                            <a class="flex-sm-fill text-sm-center nav-link" href="${pageContext.request.contextPath}/admin/reportFavoriteUser">
                                <i class="fas fa-users me-2"></i>Favorite Users
                            </a>
                            <a class="flex-sm-fill text-sm-center nav-link active" href="${pageContext.request.contextPath}/admin/reportShareFriend">
                                <i class="fas fa-share-alt me-2"></i>Shared Friends
                            </a>
                        </nav>

                        <div class="row justify-content-center mb-4">
                            <div class="col-md-6">
                                <select class="form-select select-video">
                                    <option selected>Select video to analyze</option>
                                    <option value="1">Lâu ghê mới gặp</option>
                                    <option value="2">Buổi chiều tà</option>
                                    <option value="3">Chuyện của mùa đông</option>
                                </select>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Sender</th>
                                        <th>Sender Email</th>
                                        <th>Receiver Email</th>
                                        <th>Favorite Date</th>
                                        <th>Sent Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="user-info">
                                                <div class="user-avatar bg-primary">
                                                    <i class="fas fa-user"></i>
                                                </div>
                                                <span>Nguyễn Văn Tèo</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="email-badge">
                                                <i class="fas fa-envelope"></i>
                                                teo@gmail.com
                                            </div>
                                        </td>
                                        <td>
                                            <div class="email-badge">
                                                <i class="fas fa-envelope"></i>
                                                abc@gmail.com
                                            </div>
                                        </td>
                                        <td>
                                            <span class="date-badge">
                                                <i class="far fa-calendar-alt me-1"></i>
                                                10/11/2024
                                            </span>
                                        </td>
                                        <td>
                                            <span class="date-badge">
                                                <i class="far fa-calendar-alt me-1"></i>
                                                5/12/2024
                                            </span>
                                        </td>
                                    </tr>
                                    <!-- Repeat similar structure for other rows -->
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