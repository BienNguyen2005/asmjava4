<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="navbar navbar-expand-lg bg-white shadow-sm sticky-top">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/">
            <i class="fas fa-play-circle text-primary me-2"></i>
            <span class="fw-bold">FoxTube</span>
        </a>
        
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item me-3">
                    <a class="nav-link d-flex align-items-center" href="${pageContext.request.contextPath}/admin">
                        <i class="fas fa-shield-alt me-1"></i>
                        <span>Admin</span>
                    </a>
                </li>
                
                <li class="nav-item me-3">
                    <a class="nav-link d-flex align-items-center" href="${pageContext.request.contextPath}/videoFavorite">
                        <i class="fas fa-heart me-1"></i>
                        <span>My Favorites</span>
                    </a>
                </li>
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" 
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user-circle me-1"></i>
                        <span>My Account</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end border-0 shadow-sm">
                        <li>
                            <a class="dropdown-item py-2" href="${pageContext.request.contextPath}/signin">
                                <i class="fas fa-sign-in-alt me-2"></i>Login
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item py-2" href="${pageContext.request.contextPath}/forgotPassword">
                                <i class="fas fa-key me-2"></i>Forgot Password
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item py-2" href="${pageContext.request.contextPath}/register">
                                <i class="fas fa-user-plus me-2"></i>Registration
                            </a>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item py-2" href="#">
                                <i class="fas fa-sign-out-alt me-2"></i>Logout
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item py-2" href="${pageContext.request.contextPath}/changePassword">
                                <i class="fas fa-lock me-2"></i>Change Password
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item py-2" href="${pageContext.request.contextPath}/editProfile">
                                <i class="fas fa-user-edit me-2"></i>Edit Profile
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<style>
.navbar {
    padding-top: 1rem;
    padding-bottom: 1rem;
}

.navbar-brand {
    font-size: 1.5rem;
}

.nav-link {
    color: #6c757d;
    font-weight: 500;
    transition: color 0.3s ease;
}

.nav-link:hover {
    color: #0d6efd;
}

.dropdown-item {
    color: #6c757d;
    transition: all 0.3s ease;
}

.dropdown-item:hover {
    color: #0d6efd;
    background-color: #f8f9fa;
}

.dropdown-menu {
    border-radius: 10px;
    margin-top: 10px;
}

.navbar-toggler:focus {
    box-shadow: none;
}

.sticky-top {
    backdrop-filter: blur(10px);
    background-color: rgba(255, 255, 255, 0.95);
}
</style>