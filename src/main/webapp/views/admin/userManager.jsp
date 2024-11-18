<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .form-control:focus {
            border-color: #0d6efd;
            box-shadow: none;
        }
        .btn-action {
            padding: 8px 20px;
            border-radius: 8px;
            transition: all 0.3s;
        }
        .btn-action:hover {
            transform: translateY(-2px);
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
        .role-badge {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        .role-admin {
            background-color: #e7f3ff;
            color: #0d6efd;
        }
        .role-user {
            background-color: #e9ecef;
            color: #495057;
        }
        .edit-link {
            color: #0d6efd;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        .edit-link:hover {
            color: #0a58ca;
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
                            <i class="fas fa-users me-2 text-primary"></i>User Management
                        </h5>
                    </div>
                    <div class="card-body">
                        <form class="row g-4">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="id" name="id" required value="${user.id}">
                                    <label for="id"><i class="fas fa-user me-2"></i>Username</label>
                                </div>
                                <span class="text-danger small">${messError}</span>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="password" class="form-control" id="password" name="password" required value="${user.password}">
                                    <label for="password"><i class="fas fa-lock me-2"></i>Password</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="fullname" name="fullname" required value="${user.fullname}">
                                    <label for="fullname"><i class="fas fa-id-card me-2"></i>Fullname</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="email" class="form-control" id="email" name="email" required value="${user.email}">
                                    <label for="email"><i class="fas fa-envelope me-2"></i>Email</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="d-flex align-items-center gap-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" ${user.admin ? 'checked' : ''} name="admin" id="adminRole" value="true">
                                        <label class="form-check-label" for="adminRole">
                                            <i class="fas fa-shield-alt me-1"></i>Admin
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" ${!user.admin ? 'checked' : ''} name="admin" id="userRole" value="false">
                                        <label class="form-check-label" for="userRole">
                                            <i class="fas fa-user me-1"></i>User
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <span class="text-success">${messSuccess}</span>
                            </div>

                            <div class="col-12">
                                <div class="d-flex gap-2">
                                    <button formaction="${pageContext.request.contextPath}/admin/userManager/create" 
                                            formmethod="post" class="btn btn-primary btn-action">
                                        <i class="fas fa-plus me-2"></i>Create
                                    </button>
                                    <button formaction="${pageContext.request.contextPath}/admin/userManager/update" 
                                            formmethod="post" class="btn btn-warning btn-action">
                                        <i class="fas fa-edit me-2"></i>Update
                                    </button>
                                    <button formaction="${pageContext.request.contextPath}/admin/userManager/delete" 
                                            formmethod="post" class="btn btn-danger btn-action">
                                        <i class="fas fa-trash me-2"></i>Delete
                                    </button>
                                    <button class="btn btn-light border btn-action">
                                        <i class="fas fa-redo me-2"></i>Reset
                                    </button>
                                </div>
                            </div>
                        </form>

                        <div class="table-responsive mt-4">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>Password</th>
                                        <th>Fullname</th>
                                        <th>Role</th>
                                        <th>Email</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" items="${listUsers}">
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <i class="fas fa-user-circle me-2 text-primary"></i>
                                                    ${user.id}
                                                </div>
                                            </td>
                                            <td>${user.password}</td>
                                            <td>${user.fullname}</td>
                                            <td>
                                                <span class="role-badge ${user.admin ? 'role-admin' : 'role-user'}">
                                                    ${user.admin ? "Admin" : "User"}
                                                </span>
                                            </td>
                                            <td>${user.email}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/admin/userManager/update?id=${user.id}" 
                                                   class="edit-link">
                                                    <i class="fas fa-edit"></i>
                                                    Edit
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