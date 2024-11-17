<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Favorite Videos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .td-text {
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        .card-content-img {
            border-radius: 10px;
        }
        .btn-action {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <jsp:include page="layout/header.jsp" />

        <h2 class="text-center my-4">Your Favorite Videos</h2>
        
        <div class="row my-3 row-cols-2 row-cols-sm-4 g-4">
            <c:forEach var="video" items="${favoriteVideos}">
                <div class="col">
                    <div class="card p-2">
                        <img src="${video.thumbnailUrl}" class="card-img card-content-img" alt="${video.title}" />
                        <div class="card-body">
                            <a class="card-text stretched-link text-decoration-none td-text" href="${pageContext.request.contextPath}/videoDetail?id=${video.id}">${video.title}</a>
                            <div class="mt-3">
                                <a href="#" class="btn btn-primary">Unlike</a>
                                <a href="#" class="btn btn-success">Share</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <jsp:include page="layout/footer.jsp" />
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>