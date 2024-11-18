<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
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
        
        .profile-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: #e9ecef;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 2.5rem;
            color: #6c757d;
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
        
        .btn-update {
            padding: 0.8rem;
            border-radius: 10px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }
        
        .btn-update:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(13, 110, 253, 0.3);
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
                        <div class="profile-avatar">
                            <i class="fas fa-user"></i>
                        </div>
                        <h4 class="mb-0">Edit Profile</h4>
                        <p class="text-muted small mb-0">Update your personal information</p>
                    </div>
                    <div class="card-body p-4">
                        <form>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="username" placeholder="Username" required>
                                <label for="username">
                                    <i class="fas fa-user me-2"></i>Username
                                </label>
                            </div>
                            
                            <div class="form-floating">
                                <input type="text" class="form-control" id="fullname" placeholder="Full Name" required>
                                <label for="fullname">
                                    <i class="fas fa-id-card me-2"></i>Full Name
                                </label>
                            </div>
                            
                            <div class="form-floating">
                                <input type="email" class="form-control" id="email" placeholder="Email Address" required>
                                <label for="email">
                                    <i class="fas fa-envelope me-2"></i>Email Address
                                </label>
                            </div>
                            
                            <button type="submit" class="btn btn-primary w-100 btn-update mt-3">
                                <i class="fas fa-save me-2"></i>Update Profile
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="layout/footer.jsp" />
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>