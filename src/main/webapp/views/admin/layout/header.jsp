<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="navbar navbar-expand-lg bg-dark rounded">
            <div class="container-fluid">
              <a class="navbar-brand fw-bold text-white" href="#">ADMINISTRATION TOOL</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a class="nav-link fw-bold text-primary" href="${pageContext.request.contextPath}/">Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link fw-bold text-primary" href="${pageContext.request.contextPath}/admin">Videos</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link fw-bold text-primary" href="${pageContext.request.contextPath}/admin/userManager">User</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link fw-bold text-primary" href="${pageContext.request.contextPath}/admin/reportFavorites">Reports</a>
                  </li>
                </ul>
              </div>
            </div>
        </nav>