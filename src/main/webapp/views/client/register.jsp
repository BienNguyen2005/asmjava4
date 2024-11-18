<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .register-container {
            max-width: 500px;
            margin: auto;
            padding: 2rem;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .form-floating {
            margin-bottom: 1.5rem;
        }
        .btn-signup {
            padding: 0.8rem;
            border-radius: 10px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }
        .btn-signup:hover {
            background-color: #0056b3;
            box-shadow: 0 5px 15px rgba(0, 86, 179, 0.3);
        }
    </style>
</head>
<body>
    <div class="container">
        <jsp:include page="layout/header.jsp" />
        
        <div class="register-container my-5">
            <h2 class="text-center mb-4">Sign Up</h2>
            <form>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="Username" required>
                    <label for="floatingInput">Username</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" required>
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingFullname" placeholder="Fullname" required>
                    <label for="floatingFullname">Fullname</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="floatingEmail" placeholder="Email" required>
                    <label for="floatingEmail">Email</label>
                </div>

                <div class="d-grid">
                    <button class="btn btn-lg btn-primary btn-signup text-uppercase fw-bold mb-2" type="submit">Sign Up</button>
                </div>
            </form>
        </div>

        <jsp:include page="layout/footer.jsp" />
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>