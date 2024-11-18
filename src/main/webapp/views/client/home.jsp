<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .video-card {
            border: none;
            border-radius: 15px;
            transition: transform 0.3s ease;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            overflow: hidden;
        }
        
        .video-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
        }
        
        .video-thumbnail {
            position: relative;
            overflow: hidden;
            border-radius: 10px;
        }
        
        .video-thumbnail img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        
        .video-card:hover .video-thumbnail img {
            transform: scale(1.05);
        }
        
        .video-duration {
            position: absolute;
            bottom: 10px;
            right: 10px;
            background: rgba(0,0,0,0.7);
            color: white;
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 0.8rem;
        }
        
        .video-title {
            font-size: 1rem;
            font-weight: 500;
            color: #2c3e50;
            margin: 10px 0;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            height: 48px;
        }
        
        .video-actions {
            display: flex;
            gap: 10px;
        }
        
        .btn-action {
            flex: 1;
            padding: 8px;
            border-radius: 8px;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            transition: all 0.3s ease;
        }
        
        .btn-like {
            background-color: #e7f1ff;
            color: #0d6efd;
            border: none;
        }
        
        .btn-like:hover {
            background-color: #0d6efd;
            color: white;
        }
        
        .btn-share {
            background-color: #e7f9ed;
            color: #198754;
            border: none;
        }
        
        .btn-share:hover {
            background-color: #198754;
            color: white;
        }
        
        .pagination {
            margin-top: 2rem;
            margin-bottom: 2rem;
        }
        
        .page-link {
            border: none;
            padding: 0.5rem 1rem;
            margin: 0 5px;
            border-radius: 8px;
            color: #6c757d;
            transition: all 0.3s ease;
        }
        
        .page-link:hover {
            background-color: #0d6efd;
            color: white;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container">
        <jsp:include page="layout/header.jsp" />

        <div class="row g-4 my-4">
            <c:forEach var="video" varStatus="loop" items="${listVideo}">
                <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="video-card">
                        <div class="video-thumbnail">
                            <img src="https://i.ytimg.com/vi/${video.id}/hq720.jpg" alt="${video.title}">
                            <span class="video-duration">3:45</span>
                        </div>
                        <div class="p-3">
                            <a href="${pageContext.request.contextPath}/videoDetail" 
                               class="text-decoration-none">
                                <h3 class="video-title">${video.title}</h3>
                            </a>
                            <div class="video-actions">
                                <button class="btn-action btn-like">
                                    <i class="fas fa-heart"></i>
                                    Like
                                </button>
                                <button class="btn-action btn-share">
                                    <i class="fas fa-share"></i>
                                    Share
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <nav aria-label="Page navigation" class="my-4">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#"><i class="fas fa-angle-double-left"></i></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#"><i class="fas fa-angle-left"></i></a>
                </li>
                <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#"><i class="fas fa-angle-right"></i></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#"><i class="fas fa-angle-double-right"></i></a>
                </li>
            </ul>
        </nav>

        <jsp:include page="layout/footer.jsp" />
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>