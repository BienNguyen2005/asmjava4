<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Video Yêu Thích</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #1e2a78 0%, #ff3366 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #ffffff;
        }
        .main-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
        }
        .page-header {
            text-align: center;
            margin: 30px 0;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            backdrop-filter: blur(10px);
        }
        .page-header h2 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
            background: linear-gradient(45deg, #ff3366, #ff9933);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .video-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            padding: 20px 0;
        }
        .video-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            overflow: hidden;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .video-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            border-color: rgba(255, 255, 255, 0.2);
        }
        .video-thumbnail {
            position: relative;
            padding-top: 56.25%;
            overflow: hidden;
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
            padding: 20px;
        }
        .video-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 15px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            color: #ffffff;
            text-decoration: none;
        }
        .video-title:hover {
            color: #ff3366;
        }
        .video-actions {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }
        .btn-action {
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
            border: none;
            flex: 1;
            justify-content: center;
        }
        .btn-unlike {
            background: linear-gradient(45deg, #ff3366, #ff5c33);
            color: white;
        }
        .btn-share {
            background: linear-gradient(45deg, #33ccff, #3366ff);
            color: white;
        }
        .btn-action:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .modal-content {
            background: #1e2a78;
            color: white;
        }
        .modal-header {
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        .modal-footer {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }
        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
        }
        .form-control:focus {
            background: rgba(255, 255, 255, 0.15);
            border-color: #ff3366;
            color: white;
            box-shadow: 0 0 0 0.25rem rgba(255, 51, 102, 0.25);
        }
        .success-message {
            color: #00ff99;
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <jsp:include page="layout/header.jsp" />

        <div class="page-header">
            <h2><i class="fas fa-heart me-2"></i>Video Yêu Thích</h2>
            <p>Danh sách những video bạn đã thích</p>
        </div>

        <div class="video-grid">
            <c:forEach var="video" items="${listVideFavorite}">
                <div class="video-card">
                    <div class="video-thumbnail">
                        <img src="https://i.ytimg.com/vi/${video.id}/hq720.jpg" alt="${video.title}">
                    </div>
                    <div class="video-info">
                        <a href="${pageContext.request.contextPath}/videoDetail?id=${video.id}" 
                           class="video-title">${video.title}</a>
                        
                        <c:if test="${not empty sessionScope.currentUser}">
                            <div class="video-actions">
                                <a href="${pageContext.request.contextPath}/likeVideo?id=${video.id}" 
                                   class="btn btn-action btn-unlike">
                                    <i class="fas fa-heart-broken"></i>Bỏ thích
                                </a>
                                <button class="btn btn-action btn-share" 
                                        data-idVideo="${video.id}" 
                                        data-bs-toggle="modal" 
                                        data-bs-target="#modalShareVideo">
                                    <i class="fas fa-share"></i>Chia sẻ
                                </button>
                            </div>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Share Modal -->
        <div class="modal fade" id="modalShareVideo" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            <i class="fas fa-share-alt me-2"></i>Chia sẻ video với bạn bè
                        </h5>
                        <button type="button" class="btn-close btn-close-white" 
                                data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/shareVideo" method="post">
                            <div class="mb-3">
                                <label class="form-label">Email người nhận</label>
                                <input type="email" class="form-control" name="email" 
                                       placeholder="friend@example.com" required>
                                <span class="success-message d-none" id="successMessage">
                                    <i class="fas fa-check-circle"></i>Chia sẻ thành công
                                </span>
                                <input type="hidden" id="videoIdInput" name="videoId"/>
                            </div>
                            <div class="text-end">
                                <button type="submit" class="btn btn-action btn-share">
                                    <i class="fas fa-paper-plane me-2"></i>Gửi
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