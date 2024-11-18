<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        
        .card-header {
            background-color: transparent;
            border-bottom: none;
            padding: 25px;
        }
        
        .form-floating {
            margin-bottom: 1.5rem;
        }
        
        .form-control {
            border-radius: 10px;
            padding: 1rem;
            border: 2px solid #e9ecef;
        }
        
        .form-control:focus {
            border-color: #0d6efd;
            box-shadow: none;
        }
        
        .form-floating label {
            padding-left: 1rem;
        }
        
        .form-floating>.form-control:focus~label {
            color: #0d6efd;
        }
        
        .btn-change {
            padding: 0.8rem;
            border-radius: 10px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }
        
        .btn-change:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(13, 110, 253, 0.3);
        }
        
        .password-icon {
            color: #6c757d;
            cursor: pointer;
        }
        
        .input-group-text {
            background: transparent;
            border: none;
            position: absolute;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            z-index: 4;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container">
        <jsp:include page="layout/header.jsp" />
        
        <div class="row justify-content-center mt-5">
            <div class="col-md-6 col-lg-5">
                <div class="card">
                    <div class="card-header text-center">
                        <h4 class="mb-0">
                            <i class="fas fa-lock text-primary me-2"></i>
                            Change Password
                        </h4>
                    </div>
                    <div class="card-body p-4">
                        <form>
                            <div class="form-floating position-relative">
                                <input type="text" class="form-control" id="username" placeholder="Username" required>
                                <label for="username"><i class="fas fa-user me-2"></i>Username</label>
                            </div>
                            
                            <div class="form-floating position-relative">
                                <input type="password" class="form-control" id="currentPassword" placeholder="Current Password" required>
                                <label for="currentPassword"><i class="fas fa-key me-2"></i>Current Password</label>
                                <span class="input-group-text password-icon">
                                    <i class="far fa-eye-slash"></i>
                                </span>
                            </div>
                            
                            <div class="form-floating position-relative">
                                <input type="password" class="form-control" id="newPassword" placeholder="New Password" required>
                                <label for="newPassword"><i class="fas fa-lock me-2"></i>New Password</label>
                                <span class="input-group-text password-icon">
                                    <i class="far fa-eye-slash"></i>
                                </span>
                            </div>
                            
                            <div class="form-floating position-relative">
                                <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password" required>
                                <label for="confirmPassword"><i class="fas fa-lock me-2"></i>Confirm Password</label>
                                <span class="input-group-text password-icon">
                                    <i class="far fa-eye-slash"></i>
                                </span>
                            </div>
                            
                            <button type="submit" class="btn btn-primary w-100 btn-change mt-3">
                                <i class="fas fa-sync-alt me-2"></i>Change Password
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="layout/footer.jsp" />
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Toggle password visibility
        document.querySelectorAll('.password-icon').forEach(icon => {
            icon.addEventListener('click', function() {
                const input = this.parentElement.previousElementSibling;
                const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
                input.setAttribute('type', type);
                this.querySelector('i').classList.toggle('fa-eye');
                this.querySelector('i').classList.toggle('fa-eye-slash');
            });
        });
    </script>
</body>
</html>