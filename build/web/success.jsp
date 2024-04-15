<%@ page import="model.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <title>Đặt hàng thành công</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="assets/css/cart.css">
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
        <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">

            <div class="container">
                <div class="row justify-content-center mt-5">
                    <div class="col-md-8">
                        <div class="card rounded">
                            <div class="card-header bg-dark text-white text-center">
                                <h2>Đặt hàng thành công</h2>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <p class="card-text">Cảm ơn bạn đã đặt hàng. Đơn hàng của bạn đã được xác nhận và đang được xử lý.</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-12">
                                        
                                                <h4>Thông tin đơn hàng:</h4>
                                                
                                                
                                                <p class="card-text">Danh sách sản phẩm:</p>
                                                <c:forEach var="item" items="${order.items}">
                                            <input type="hidden" name="modelid[]" value="${item.model.modelid}">
                                            
                                            <textarea class="form-control" id="items" name="name" rows="1" readonly>${item.model.name}</textarea>
                                            
                                            đơn giá :<a type="text" class= "bor" name = "price" required >${item.model.price}$<a>
                                                    
                                                    số lượng :<a class= "bor" type="text"  name = "quantity[]" value="" >${item.quantity}<a>
                                                    
                                                    tổng : <a class= "bor" type="text"  name = "total[]" value="" >${item.model.price * item.quantity}$<a>
                                                            <td style="text-align: center">
                                                              <!--  <a >
                                                                    <form action="deletecs" method="post">
                                                                        <input type="hidden" name="id" value="${item.model.modelid}">
                                                                        <input type="submit" value="DELETE">
                                                                    </form>
                                                                </a>-->
                        
                                                </c:forEach>
                                                            
                                                            
                                                <ul class="list-group">
                                                    <!-- Placeholder for list items -->
                                                    <c:forEach var="item" items="${order.items}">
                                                        <c:set var="itemTotalPrice" value="${item.model.price * item.quantity}" />
                                                        <c:set var="totalPrice" value="${totalPrice + itemTotalPrice}" />
                                                        <!-- Các dòng mã HTML để hiển thị thông tin mặt hàng ở đây -->
                                                    </c:forEach>
                                                </ul>
                                                <p class="card-text total-amount">Tổng số tiền: <strong>${totalPrice} $</strong></p>
                                                </div>
                                                </div>
                                                <div class="text-center mt-4">
                                                    <a href="HomePage" class="btn btn-primary rounded-pill px-4">
                                                        <i class="fas fa-shopping-cart mr-2"></i> Tiếp tục mua hàng
                                                    </a>
                                                </div>
                                                </div>
                                                </div>
                                                </div>
                                                </div>
                                                </div>




                                                </div>
                                                </body>
                                                </html>

