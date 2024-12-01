<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Người Dùng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .user-section {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            margin-top: 30px;
        }
        .form-section {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        .form-floating {
            margin-bottom: 20px;
        }
        .form-floating input {
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }
        .form-floating input:focus {
            border-color: #6610f2;
            box-shadow: 0 0 0 0.25rem rgba(102, 16, 242, 0.25);
        }
        .role-section {
            background: white;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .form-check-input:checked {
            background-color: #6610f2;
            border-color: #6610f2;
        }
        .btn-group {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        .btn {
            padding: 10px 20px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
        }
        .btn:hover {
            transform: translateY(-2px);
        }
        .btn-primary {
            background: linear-gradient(45deg, #6610f2, #7c3aed);
            border: none;
        }
        .btn-warning {
            background: linear-gradient(45deg, #ffc107, #ffcd39);
            border: none;
        }
        .btn-danger {
            background: linear-gradient(45deg, #dc3545, #ff4d5b);
            border: none;
        }
        .table {
            margin-top: 20px;
            border-collapse: separate;
            border-spacing: 0;
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }
        .table thead th {
            background: linear-gradient(45deg, #f8f9fa, #e9ecef);
            padding: 15px;
            font-weight: 600;
            color: #495057;
            border: none;
        }
        .table tbody td {
            padding: 15px;
            vertical-align: middle;
            border-bottom: 1px solid #dee2e6;
        }
        .table tbody tr:hover {
            background-color: #f8f9fa;
            transform: scale(1.01);
            transition: transform 0.2s ease;
        }
        .user-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .user-header h2 {
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 10px;
        }
        .user-header p {
            color: #6c757d;
            font-size: 1.1em;
        }
        .role-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.85em;
            font-weight: 500;
        }
        .role-admin {
            background-color: #e9ecef;
            color: #6610f2;
        }
        .role-user {
            background-color: #e9ecef;
            color: #6c757d;
        }
        .edit-link {
            color: #6610f2;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            transition: all 0.3s ease;
        }
        .edit-link:hover {
            color: #7c3aed;
            transform: translateX(3px);
        }
    </style>
</head>
<body>
    <div class="main-container">
        <jsp:include page="layout/header.jsp" />

        <div class="user-section">
            <div class="user-header">
                <h2><i class="fas fa-users-cog me-2"></i>Quản Lý Người Dùng</h2>
                <p>Quản lý thông tin và phân quyền người dùng</p>
            </div>

            <div class="form-section">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="id" name="id" 
                                       placeholder="id" required value="${user.id}">
                                <label for="id"><i class="fas fa-user me-2"></i>Username</label>
                                <span class="text-danger">${messError}</span>
                            </div>
                            <div class="form-floating">
                                <input type="password" class="form-control" id="password" 
                                       name="password" placeholder="password" required value="${user.password}">
                                <label for="password"><i class="fas fa-lock me-2"></i>Password</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="fullname" 
                                       name="fullname" placeholder="fullname" required value="${user.fullname}">
                                <label for="fullname"><i class="fas fa-id-card me-2"></i>Fullname</label>
                            </div>
                            <div class="form-floating">
                                <input type="email" class="form-control" name="email" 
                                       id="email" placeholder="email" required value="${user.email}">
                                <label for="email"><i class="fas fa-envelope me-2"></i>Email</label>
                            </div>
                        </div>
                    </div>

                    <div class="role-section">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" ${user.admin ? 'checked' : ''}
                                name="admin" id="inlineRadio1" value="true">
                            <label class="form-check-label" for="inlineRadio1">
                                <i class="fas fa-user-shield me-1"></i>Admin
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="admin"
                                ${!user.admin ? 'checked' : ''} id="inlineRadio2" value="false">
                            <label class="form-check-label" for="inlineRadio2">
                                <i class="fas fa-user me-1"></i>User
                            </label>
                        </div>
                    </div>

                    <span class="text-success">${messSuccess}</span>

                    <div class="btn-group">
                        <button formaction="${pageContext.request.contextPath}/admin/userManager/create"
                            formmethod="post" class="btn btn-primary" type="submit">
                            <i class="fas fa-plus"></i>Create
                        </button>
                        <button formaction="${pageContext.request.contextPath}/admin/userManager/update"
                            formmethod="post" class="btn btn-warning" type="submit">
                            <i class="fas fa-edit"></i>Update
                        </button>
                        <button formaction="${pageContext.request.contextPath}/admin/userManager/delete"
                            formmethod="post" class="btn btn-danger" type="submit">
                            <i class="fas fa-trash"></i>Delete
                        </button>
                        <button class="btn btn-light border" type="submit">
                            <i class="fas fa-redo"></i>Reset
                        </button>
                    </div>
                </form>
            </div>

            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col"><i class="fas fa-user me-2"></i>Username</th>
                            <th scope="col"><i class="fas fa-key me-2"></i>Password</th>
                            <th scope="col"><i class="fas fa-id-card me-2"></i>Fullname</th>
                            <th scope="col"><i class="fas fa-user-tag me-2"></i>Role</th>
                            <th scope="col"><i class="fas fa-envelope me-2"></i>Email</th>
                            <th scope="col"><i class="fas fa-cog me-2"></i>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" varStatus="loop" items="${listUsers}">
                            <tr>
                                <td>${user.id}</td>
                                <td>******</td>
                                <td>${user.fullname}</td>
                                <td>
                                    <span class="role-badge ${user.admin ? 'role-admin' : 'role-user'}">
                                        <i class="fas ${user.admin ? 'fa-user-shield' : 'fa-user'} me-1"></i>
                                        ${user.admin ? "Admin" : "User"}
                                    </span>
                                </td>
                                <td>${user.email}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/userManager/update?id=${user.id}"
                                       class="edit-link">
                                        <i class="fas fa-edit"></i>Edit
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <jsp:include page="layout/footer.jsp" />
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>