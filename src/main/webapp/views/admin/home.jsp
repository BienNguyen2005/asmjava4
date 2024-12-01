<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý video</title>
    <!-- Add Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .form-section {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        .table-section {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .form-floating {
            margin-bottom: 20px;
        }
        .btn-group {
            gap: 10px;
            margin: 20px 0;
        }
        .table {
            margin-top: 20px;
        }
        .table thead {
            background-color: #f8f9fa;
        }
        .edit-link {
            color: #0d6efd;
            text-decoration: none;
        }
        .edit-link:hover {
            text-decoration: underline;
        }
        .status-badge {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 0.85em;
        }
        .status-active {
            background-color: #d4edda;
            color: #155724;
        }
        .status-inactive {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <jsp:include page="layout/header.jsp" />

        <div class="form-section">
            <h3 class="mb-4 text-center">Quản Lý Video</h3>
            <form>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="id" name="id" placeholder="id"
                                required value="${video.id}">
                            <label for="id"><i class="fas fa-key me-2"></i>Youtube ID</label>
                            <span class="text-danger">${messError}</span>
                        </div>
                        <div class="form-floating">
                            <input type="text" class="form-control" id="title" name="title"
                                placeholder="title" required value="${video.title}">
                            <label for="title"><i class="fas fa-heading me-2"></i>Video Title</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="poster" name="poster"
                                placeholder="poster" required value="${video.poster}">
                            <label for="poster"><i class="fas fa-image me-2"></i>Video Poster</label>
                        </div>
                        <div class="form-floating">
                            <input type="number" step="1" min="0" name="views" class="form-control"
                                id="views" placeholder="views" required value="${video.views}">
                            <label for="views"><i class="fas fa-eye me-2"></i>View Count</label>
                        </div>
                    </div>
                </div>

                <div class="mt-3 mb-3">
                    <label class="form-label">Trạng thái:</label>
                    <div class="form-check form-check-inline ms-2">
                        <input class="form-check-input" type="radio"
                            ${!video.active ? 'checked' : ''} name="active" id="inlineRadio2"
                            value="false">
                        <label class="form-check-label" for="inlineRadio2">Inactive</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"
                            ${video.active ? 'checked' : ''} name="active" id="inlineRadio1"
                            value="true">
                        <label class="form-check-label" for="inlineRadio1">Active</label>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label"><i class="fas fa-align-left me-2"></i>Description</label>
                    <textarea class="form-control" name="description" id="description" rows="3">${video.description}</textarea>
                </div>

                <span class="text-success">${messSuccess}</span>

                <div class="d-flex btn-group">
                    <button formaction="${pageContext.request.contextPath}/admin/videoManager/create"
                        formmethod="post" class="btn btn-primary" type="submit">
                        <i class="fas fa-plus me-2"></i>Create
                    </button>
                    <button formaction="${pageContext.request.contextPath}/admin/videoManager/update"
                        formmethod="post" class="btn btn-warning" type="submit">
                        <i class="fas fa-edit me-2"></i>Update
                    </button>
                    <button formaction="${pageContext.request.contextPath}/admin/videoManager/delete"
                        formmethod="post" class="btn btn-danger" type="submit">
                        <i class="fas fa-trash me-2"></i>Delete
                    </button>
                    <button formaction="${pageContext.request.contextPath}/admin"
                        class="btn btn-light border" type="submit">
                        <i class="fas fa-redo me-2"></i>Reset
                    </button>
                </div>
            </form>
        </div>

        <div class="table-section">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Youtube Id</th>
                        <th scope="col">Video Title</th>
                        <th scope="col">View Count</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="video" varStatus="loop" items="${listVideo}">
                        <tr>
                            <td>${video.id}</td>
                            <td>${video.title}</td>
                            <td><i class="fas fa-eye me-1"></i>${video.views}</td>
                            <td>
                                <span class="status-badge ${video.active ? 'status-active' : 'status-inactive'}">
                                    ${video.active ? "Active" : "Inactive"}
                                </span>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/videoManager/update?id=${video.id}"
                                   class="edit-link">
                                   <i class="fas fa-edit me-1"></i>Edit
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <jsp:include page="layout/footer.jsp" />
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>