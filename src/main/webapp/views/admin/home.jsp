<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .table {
            margin-bottom: 0;
        }
        .table thead th {
            background-color: #f8f9fa;
            border-bottom: none;
        }
        .btn-action {
            padding: 0.375rem 1rem;
            border-radius: 5px;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #0d6efd;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container">
        <jsp:include page="layout/header.jsp" />
        
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-white py-3">
                        <h5 class="card-title mb-0">
                            <i class="fas fa-video me-2"></i>Video Management
                        </h5>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="id" name="id" placeholder="id" required value="${video.id}">
                                        <label for="id">Youtube ID</label>
                                        <span class="text-danger small">${messError}</span>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="title" name="title" placeholder="title" required value="${video.title}">
                                        <label for="title">Video Title</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="poster" name="poster" placeholder="poster" required value="${video.poster}">
                                        <label for="poster">Video Poster URL</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input type="number" step="1" min="0" name="views" class="form-control" id="views" placeholder="views" required value="${video.views}">
                                        <label for="views">View Count</label>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Status</label>
                                        <div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" ${!video.active ? 'checked' : ''} name="active" id="inlineRadio2" value="false">
                                                <label class="form-check-label" for="inlineRadio2">Inactive</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" ${video.active ? 'checked' : ''} name="active" id="inlineRadio1" value="true">
                                                <label class="form-check-label" for="inlineRadio1">Active</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="description" class="form-label">Description</label>
                                        <textarea class="form-control" name="description" id="description" rows="3">${video.description}</textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="text-success mb-3">${messSuccess}</div>
                            
                            <div class="d-flex gap-2">
                                <button formaction="${pageContext.request.contextPath}/admin/videoManager/create" formmethod="post" class="btn btn-primary" type="submit">
                                    <i class="fas fa-plus me-1"></i> Create
                                </button>
                                <button formaction="${pageContext.request.contextPath}/admin/videoManager/update" formmethod="post" class="btn btn-warning" type="submit">
                                    <i class="fas fa-edit me-1"></i> Update
                                </button>
                                <button formaction="${pageContext.request.contextPath}/admin/videoManager/delete" formmethod="post" class="btn btn-danger" type="submit">
                                    <i class="fas fa-trash me-1"></i> Delete
                                </button>
                                <button formaction="${pageContext.request.contextPath}/admin" class="btn btn-light border" type="submit">
                                    <i class="fas fa-redo me-1"></i> Reset
                                </button>
                            </div>
                        </form>

                        <div class="table-responsive mt-4">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">Youtube ID</th>
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
                                            <td>${video.views}</td>
                                            <td>
                                                <span class="badge ${video.active ? 'bg-success' : 'bg-danger'}">
                                                    ${video.active ? "Active" : "Inactive"}
                                                </span>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/admin/videoManager/update?id=${video.id}" 
                                                   class="btn btn-sm btn-outline-primary">
                                                    <i class="fas fa-edit"></i> Edit
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
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