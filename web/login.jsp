<%-- 
    Document   : login
    Created on : Jan 29, 2024, 2:20:51 AM
    Author     : congkhoa2723
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap Simple Login Form</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url(https://c.wallhere.com/photos/ed/e2/Shonen_Jump_anime_boys_manga_monochrome_Dragon_Ball_Vegeta_Dragon_Ball_Heroes_looking_at_viewer-2270876.jpg!d);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-form {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .login-form h2 {
            color: #333;
            font-size: 24px;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-control {
            min-height: 45px;
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
        }
        .btn {
            background-color: #6c757d;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #495057;
        }
        .forgot-password-link,
        .create-account-link {
            color: #495057;
            text-decoration: none;
        }
        .error-message {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="login-form">
                    <h2>Log in</h2>
                    <form action="login" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Username" required="required" name="username">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Password" required="required" name="password">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-block">Log in</button>
                        </div>
                        <div class="form-group clearfix">
                            <label class="form-check-label float-left">
                                <input type="checkbox"> Remember me
                            </label>
                            <a href="passwordreset.jsp" class="forgot-password-link float-right">Forgot Password?</a>
                        </div>
                    </form>
                    <p class="text-center"><a href="register.jsp" class="create-account-link">Create an Account</a></p>
                    <p class="error-message">${msg}</p>
                    <c:set var="msg" value="${null}" scope="session"></c:set>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
