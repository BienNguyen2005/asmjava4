<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${video.title}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #0f0f0f;
            color: #ffffff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .main-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
        }
        .video-section {
            background: #1a1a1a;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            margin-bottom: 30px;
        }
        .video-player {
            position: relative;
            padding-top: 56.25%;
            width: 100%;
            background: #000;
        }
        .video-player iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: none;
        }
        .video-info {
            padding: 20px;
        }
        .video-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 15px;
            color: #ffffff;
        }
        .video-stats {
            display: flex;
            align-items: center;
            gap: 20px;
            color: #aaaaaa;
            font-size: 0.9rem;
            margin-bottom: 15px;
        }
        .video-description {
            color: #dddddd;
            line-height: 1.6;
            margin-bottom: 20px;
            padding: 15px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
        }
        .action-buttons {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }
        .btn-action {
            padding: 10px 20px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
            border: none;
        }
        .btn-like {
            background: linear-gradient(45deg, #ff4081, #ff6e40);
            color: white;
        }
        .btn-unlike {
            background: linear-gradient(45deg, #7c4dff, #448aff);
            color: white;
        }
        .btn-share {
            background: linear-gradient(45deg, #00bcd4, #1de9b6);
            color: white;
        }
        .btn-action:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        .related-videos {
            background: #1a1a1a;
            border-radius: 15px;
            padding: 20px;
            height: 100%;
        }
        .related-video-item {
            display: flex;
            gap: 15px;
            padding: 15px;
            border-radius: 10px;
            transition: all 0.3s ease;
            text-decoration: none;
            margin-bottom: 15px;
            background: rgba(255, 255, 255, 0.05);
        }
        .related-video-item:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateX(5px);
        }
        .related-thumbnail {
            width: 168px;
            height: 94px;
            border-radius: 8px;
            overflow: hidden;
            flex-shrink: 0;
        }
        .related-thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .related-info {
            flex: 1;
        }
        .related-title {
            color: #ffffff;
            font-size: 0.9rem;
            margin-bottom: 8px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        .related-views {
            color: #aaaaaa;
            font-size: 0.8rem;
        }
        .modal-content {
            background: #1a1a1a;
            color: #ffffff;
            border-radius: 15px;
        }
        .modal-header {
            border-bottom: 1px solid #333;
        }
        .modal-footer {
            border-top: 1px solid #333;
        }
        .form-control {
            background: #2a2a2a;
            border: 1px solid #333;
            color: #ffffff;
        }
        .form-control:focus {
            background: #2a2a2a;
            border-color: #00bcd4;
            color: #ffffff;
            box-shadow: 0 0 0 0.25rem rgba(0, 188, 212, 0.25);
        }
    </style>
</head>
<body>
    <div class="main-container">
        <jsp:include page="layout/header.jsp" />

        <div class="row">
            <div class="col-12 col-lg-8">
                <div class="video-section">
                    <div class="video-player">
                        <iframe src="https://www.youtube.com/embed/${video.id}"
                                title="YouTube video player" allowfullscreen></iframe>
                    </div>
                    <div class="video-info">
                        <h1 class="video-title">${video.title}</h1>
                        <div class="video-stats">
                            <span><i class="fas fa-eye me-2"></i>${video.views} lượt xem</span>
                        </div>
                        <div class="video-description">
                            <i class="fas fa-info-circle me-2"></i>${video.description}
                        </div>
                        <c:if test="${not empty sessionScope.currentUser}">
                            <div class="action-buttons">
                                <a href="${pageContext.request.contextPath}/likeVideo?id=${video.id}" 
                                   class="btn btn-action btn-like ${likedVideo?'d-none':''}">
                                    <i class="fas fa-heart"></i>Thích
                                </a>
                                <a href="${pageContext.request.contextPath}/likeVideo?id=${video.id}" 
                                   class="btn btn-action btn-unlike ${likedVideo?'':'d-none'}">
                                    <i class="fas fa-heart-broken"></i>Bỏ thích
                                </a>
                                <button class="btn btn-action btn-share" data-idVideo="${video.id}" 
                                        data-bs-toggle="modal" data-bs-target="#modalShareVideo">
                                    <i class="fas fa-share"></i>Chia sẻ
                                </button>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-4">
                <div class="related-videos">
                    <h5 class="mb-4"><i class="fas fa-film me-2"></i>Video liên quan</h5>
                    <c:forEach var="video" items="${listVideoRandom}">
                        <a href="${pageContext.request.contextPath}/videoDetail?id=${video.id}" 
                           class="related-video-item">
                            <div class="related-thumbnail">
                                <img src="https://i.ytimg.com/vi/${video.id}/hq720.jpg" 
                                     alt="${video.title}">
                            </div>
                            <div class="related-info">
                                <h6 class="related-title">${video.title}</h6>
                                <span class="related-views">
                                    <i class="fas fa-eye me-1"></i>${video.views} lượt xem
                                </span>
                            </div>
                        </a>
                    </c:forEach>
                </div>
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
                        <button type="button" class="btn-close btn-close-white" 
                                data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/shareVideo" method="post">
                            <div class="mb-3">
                                <label class="form-label">Email người nhận</label>
                                <input type="email" class="form-control" name="email" 
                                       placeholder="friend@example.com" required>
                                <span class="text-success d-none" id="successMessage">
                                    <i class="fas fa-check-circle me-1"></i>Chia sẻ thành công
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