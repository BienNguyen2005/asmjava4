<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <i class="fas fa-shield-alt text-primary me-2"></i>
            <span class="fw-bold">Admin Dashboard</span>
        </a>
        
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">
                        <i class="fas fa-home me-2"></i>Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin">
                        <i class="fas fa-video me-2"></i>Videos
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/userManager">
                        <i class="fas fa-users me-2"></i>Users
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/reportFavorites">
                        <i class="fas fa-chart-bar me-2"></i>Reports
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<style>
.navbar {
    background-color: #ffffff;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    padding: 1rem;
}

.navbar-brand {
    font-size: 1.4rem;
    color: #2c3e50;
}

.navbar-brand i {
    font-size: 1.6rem;
}

.nav-link {
    color: #6c757d;
    font-weight: 500;
    padding: 0.5rem 1rem;
    border-radius: 8px;
    transition: all 0.3s ease;
    margin: 0 0.2rem;
}

.nav-link:hover {
    color: #0d6efd;
    background-color: #f8f9fa;
}

.nav-link.active {
    color: #0d6efd;
    background-color: #e7f1ff;
}

.nav-link i {
    width: 20px;
    text-align: center;
}

.navbar-toggler:focus {
    box-shadow: none;
}

@media (max-width: 991.98px) {
    .navbar-nav {
        padding: 1rem 0;
    }
    
    .nav-link {
        padding: 0.8rem 1rem;
        margin: 0.2rem 0;
    }
}
</style>