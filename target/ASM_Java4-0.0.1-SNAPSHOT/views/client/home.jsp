<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
.td-text {
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<jsp:include page="layout/header.jsp" />

		<div class="row my-3 row-cols-2 row-cols-sm-4">
			<c:forEach var="video" varStatus="loop" items="${listVideo}">
				<div class="col">
					<div class="card p-2">
						<img src="https://i.ytimg.com/vi/${video.id }/hq720.jpg"
							class="card-img card-content-img" />
						<div class="card-body">
							<a href="${pageContext.request.contextPath}/videoDetail"
								class="card-text stretched-link text-decoration-none td-text">${video.title }</a>
							<div class="mt-3">
								<a href="#" class="btn btn-primary">Like</a> <a href="#"
									class="btn btn-success">Share</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- <nav aria-label="Page navigation example mb-3">
            <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link">First</a>
            </li>
            <li class="page-item"><a class="page-link" href="#"><<</a></li>
            <li class="page-item"><a class="page-link" href="#">>></a></li>
            <li class="page-item">
                <a class="page-link" href="#">Last</a>
            </li>
            </ul>
        </nav> -->
		<jsp:include page="layout/footer.jsp" />
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>