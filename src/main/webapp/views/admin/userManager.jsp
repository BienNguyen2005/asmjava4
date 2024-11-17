<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý user</title>
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

		<div class="mx-auto mt-3" style="width: 600px;">
			<form>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="id" placeholder="id" name="id"
						required value="${user.id }">
					<label for="id">Username</label>
					<span class="text-danger">${messError }</span>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="password"
						placeholder="password" name="password" required value="${user.password }">
					<label for="password">Password</label>
				</div>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="fullname"
						placeholder="fullname" name="fullname" required value="${user.fullname }">
					<label for="fullname">Fullname</label>
				</div>
				<div class="form-floating mb-3">
					<input type="email" class="form-control" name="email" id="email" placeholder="email"
						required value="${user.email }">
					<label for="email">Email</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" ${user.admin ? 'checked' : ''}
						name="admin" id="inlineRadio1" value="true">
					<label class="form-check-label" for="inlineRadio1">Admin</label>
				</div>
				<div class="form-check form-check-inline mb-3">
					<input class="form-check-input" type="radio" name="admin"
						${!user.admin ? 'checked' : ''} id="inlineRadio2" value="false">
					<label class="form-check-label" for="inlineRadio2">User</label>
				</div>
				<span class="text-success">${messSuccess }</span>
				<div class="">
					<button
						formaction="${pageContext.request.contextPath}/admin/userManager/create"
						formmethod="post" class="btn btn-primary mb-2" type="submit">Create</button>
					<button
						formaction="${pageContext.request.contextPath}/admin/userManager/update"
						formmethod="post" class="btn btn-warning mb-2" type="submit">Update</button>
					<button
						formaction="${pageContext.request.contextPath}/admin/userManager/delete"
						formmethod="post" class="btn btn-danger mb-2" type="submit">Delete</button>
					<button class="btn btn-light border  mb-2" type="submit">Reset</button>
				</div>
			</form>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Username</th>
						<th scope="col">Password</th>
						<th scope="col">Fullname</th>
						<th scope="col">Role</th>
						<th scope="col">Email Address</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" varStatus="loop" items="${listUsers}">
						<tr>
							<td>${user.id }</td>
							<td>${user.password }</td>
							<td>${user.fullname }</td>
							<td>${user.admin?"Admin":"User" }</td>
							<td>${user.email }</td>
							<td>
								<a
									href="${pageContext.request.contextPath}/admin/userManager/update?id=${user.id}">Edit</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<jsp:include page="layout/footer.jsp" />
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>