<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.DangNhap" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="assets/css/cart.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

<link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

<link rel="stylesheet" href="assets/css/owl-carousel.css">

<link rel="stylesheet" href="assets/css/lightbox.css">
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .checkout-container {
                margin-top: 100px;
                max-width: 500px;
                margin-left: auto;
                margin-right: auto;
                background-color: #fff;
                border-radius: 10px;
                padding: 30px;
                box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            }
            .checkout-header {
                border-bottom: 1px solid #dee2e6;
                padding-bottom: 15px;
                margin-bottom: 20px;
            }
            .checkout-header h2 {
                margin-top: 0;
                font-weight: bold;
                color: #333;
            }
            .checkout-btn {
                width: 100%;
                margin-top: 20px;
            }
            .confirmation-message {
                margin-top: 30px;
                font-size: 18px;
                text-align: center;
            }
            .bor{
                border  :none;
                width: 100px;
            }
        </style>
    </head>
    <body>
        <header class="header-area header-sticky">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- Logo -->
                            <a href="HomePage" class="logo">
                                <img src="assets/images/logo.png" alt="Logo">
                            </a>
                            <!-- Menu -->
                            <ul class="nav">
                                <li class="scroll-to-section"><a href="HomePage" class="active">Home</a></li>
                                <li class="submenu">
                                    <a href="javascript:;">Pages</a>
                                    <ul>
                                        <li><a href="about.html">About Us</a></li>
                                        <li><a href="products">Products</a></li>
                                        <li><a href="single">Single Product</a></li>
                                        <li><a href="contact.html">Contact Us</a></li>
                                    </ul>
                                </li>
                                <li class="scroll-to-section"><a href="#explore">Explore</a></li>
                                <li class="submenu">
                                    <a href="javascript:;">Tài khoản</a>
                                    <ul>
                                        <li><a href="#">Tài Khoản Của Tôi</a></li>
                                        <li><a href="cart.jsp">Đơn Mua</a></li>
                                        <li><a href="login.jsp">Đăng xuất</a></li>
                                        <li><a rel="nofollow" href="https://templatemo.com/page/4" target="_blank">Template Page 4</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <div class="container" padding="100px">
            <div class="checkout-container" padding="100px" border="100px">
                <div class="checkout-header">
                    <h2>Checkout</h2>
                </div>
                <form action="checkout" method="post" id="checkoutForm">
                    <div class="form-group">
                        <label for="name">ID</label>
                        <input type="text" class="form-control" id="name" name="customerid" required>
                    </div>
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <%
                        DangNhap dangnhap = new DangNhap(); // Lấy đối tượng dangnhap từ nơi nào đó trong ứng dụng
                        request.setAttribute("dangnhap", dangnhap); // hoặc session.setAttribute("dangnhap", dangnhap);
                    %>

                    <script>
                        const emailInput = document.getElementById('email');

                        emailInput.addEventListener('blur', function () {
                            if (!this.value.includes('@') && this.value.trim() !== '') {
                                this.value += '@gmail.com';
                            }
                        });
                    </script>

                    <div class="form-group">
                        <label for="address">Address</label>
                        <textarea class="form-control" id="address" name="address" required></textarea>
                    </div>




                    <c:forEach var="item" items="${order.items}">
                        <c:set var="itemTotalPrice" value="${item.model.price * item.quantity}" />
                        <c:set var="totalPrice" value="${totalPrice + itemTotalPrice}" />
                    </c:forEach>

                    <div class="form-group">
                        <label for="items">Items</label>

                        <c:forEach var="item" items="${order.items}">
                            <input type="hidden" name="modelid[]" value="${item.model.modelid}">
                            <textarea class="form-control" id="items" name="name" rows="1" readonly>${item.model.name}</textarea>
                            đơn giá :<a type="text"  name = "price" required >${item.model.price}<a>$
                                    <br>
                                    số lượng :<input class= "bor" type="text"  name = "quantity[]" value="${item.quantity}" readonly>
                                    <br>
                                    tổng : <input class= "bor" type="text"  name = "total[]" value="${item.model.price * item.quantity}" readonly>$  

                                </c:forEach>

                                </div>


                                <div class="form-group">
                                    <label for="total">Total : </label>
                                    <input class= "bor" name="totalamount" style="font-family: Arial, sans-serif; color: orangered; font-size: 24px;" value="${totalPrice}" readonly>$</h1>

                                </div>
                                <button  type="submit" class="btn btn-primary checkout-btn">Proceed to Payment</button>
                                </form>
                                </div>
                                </div>
                                <!-- Bootstrap JS and jQuery -->

                                </body>
                                </html>