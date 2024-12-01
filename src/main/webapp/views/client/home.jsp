<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Entertainment</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .video-grid {
            margin: 30px 0;
        }
        .video-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .video-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
        }
        .video-thumbnail {
            position: relative;
            overflow: hidden;
            padding-top: 56.25%; /* 16:9 Aspect Ratio */
        }
        .video-thumbnail img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        .video-card:hover .video-thumbnail img {
            transform: scale(1.05);
        }
        .video-info {
            padding: 15px;
        }
        .video-title {
            color: #1a1a1a;
            font-weight: 600;
            font-size: 1.1em;
            margin-bottom: 10px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
            height: 2.8em;
        }
        .video-actions {
            display: flex;
            gap: 10px;
            padding: 10px 15px;
            border-top: 1px solid #eee;
        }
        .btn-action {
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 0.9em;
            font-weight: 500;
            transition: all 0.3s ease;
            flex: 1;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }
        .btn-like {
            background: linear-gradient(45deg, #2196F3, #4CAF50);
            color: white;
            border: none;
        }
        .btn-unlike {
            background: linear-gradient(45deg, #f44336, #ff5252);
            color: white;
            border: none;
        }
        .btn-share {
            background: linear-gradient(45deg, #9C27B0, #673AB7);
            color: white;
            border: none;
        }
        .btn-action:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            color: white;
        }
        .modal-content {
            border-radius: 15px;
        }
        .modal-header {
            background: linear-gradient(45deg, #9C27B0, #673AB7);
            color: white;
            border-radius: 15px 15px 0 0;
        }
        .modal-body {
            padding: 25px;
        }
        .form-control {
            border: 2px solid #e2e8f0;
            padding: 12px;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: #9C27B0;
            box-shadow: 0 0 0 0.25rem rgba(156, 39, 176, 0.25);
        }
        .success-message {
            color: #4CAF50;
            display: flex;
            align-items: center;
            gap: 5px;
            margin-top: 10px;
        }
        .pagination {
            margin-top: 30px;
            justify-content: center;
        }
        .page-link {
            padding: 10px 20px;
            color: #673AB7;
            border: none;
            margin: 0 5px;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        .page-link:hover {
            background: linear-gradient(45deg, #9C27B0, #673AB7);
            color: white;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="container">
        <jsp:include page="layout/header.jsp" />

        <div class="video-grid">
            <div class="row g-4">
                <c:forEach var="video" varStatus="loop" items="${listVideo}">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                        <div class="video-card">
                            <div class="video-thumbnail">
                                <img src="https://i.ytimg.com/vi/${video.id}/hq720.jpg" alt="${video.title}"/>
                            </div>
                            <div class="video-info">
                                <a href="${pageContext.request.contextPath}/videoDetail?id=${video.id}"
                                   class="text-decoration-none">
                                    <div class="video-title">${video.title}</div>
                                </a>
                            </div>
                            <c:if test="${not empty sessionScope.currentUser}">
                                <div class="video-actions">
                                    <a href="${pageContext.request.contextPath}/likeVideo?id=${video.id}" 
                                       class="btn-action btn-like ${listLiked.contains(video.id)?'d-none':''}">
                                        <i class="fas fa-heart"></i> Like
                                    </a>
                                    <a href="${pageContext.request.contextPath}/likeVideo?id=${video.id}" 
                                       class="btn-action btn-unlike ${listLiked.contains(video.id)?'':'d-none'}">
                                        <i class="fas fa-heart-broken"></i> Unlike
                                    </a>
                                    <button class="btn-action btn-share" data-idVideo="${video.id}" 
                                            data-bs-toggle="modal" data-bs-target="#modalShareVideo">
                                        <i class="fas fa-share"></i> Share
                                    </button>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Share Modal -->
        <div class="modal fade" id="modalShareVideo" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            <i class="fas fa-share-alt me-2"></i>Chia sẻ video với bạn bè
                        </h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/shareVideo" method="post">
                            <div class="mb-3">
                                <label class="form-label">Email người nhận</label>
                                <input type="email" class="form-control" name="email" 
                                       placeholder="friend@example.com" required>
                                <span class="success-message d-none" id="successMessage">
                                    <i class="fas fa-check-circle"></i> Chia sẻ thành công
                                </span>
                                <input type="hidden" id="videoIdInput" name="videoId"/>
                            </div>
                            <div class="text-end">
                                <button type="submit" class="btn btn-action btn-share">
                                    <i class="fas fa-paper-plane"></i> Gửi
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="layout/footer.jsp" />
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const shareButtons = document.querySelectorAll("button[data-idVideo]");
            const videoIdInput = document.getElementById("videoIdInput");
            
            shareButtons.forEach((button) => {
                button.addEventListener("click", () => {
                    const videoId = button.getAttribute("data-idVideo");
                    videoIdInput.value = videoId;
                });
            });

            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get("modal") === "true") {
                const modal = new bootstrap.Modal(document.getElementById("modalShareVideo"));
                modal.show();
                const successMessage = document.getElementById("successMessage");
                if (successMessage) {
                    successMessage.classList.remove("d-none");
                }
            }
        });
    </script>
</body>
</html>