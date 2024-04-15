<%-- 
    Document   : product
    Created on : Feb 15, 2024, 6:49:49 PM
    Author     : congkhoa2723
--%>
<%@page import="model.Model" %>
<%@page import="dao.ModelDAO" %>
<%@page import="dao.NhanvatDAO" %>
<%@page import="model.Nhanvat" %>
<%@page import="controller.products" %>
<%@page import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>Hexashop - Product Detail Page</title>


        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

        <link rel="stylesheet" href="assets/css/owl-carousel.css">

        <link rel="stylesheet" href="assets/css/lightbox.css">
        <!--
        
        TemplateMo 571 Hexashop
        
        https://templatemo.com/tm-571-hexashop
        
        -->
    </head>

    <body>

        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>  
        <!-- ***** Preloader End ***** -->


        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <a href="HomePage" class="logo">
                                <img src="assets/images/logo.png">
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li class="scroll-to-section"><a href="HomePage" class="active">Home</a></li>
                                <li class="scroll-to-section"><a href="HomePage">Dragonball</a></li>
                                <li class="scroll-to-section"><a href="HomePage">OnePice</a></li>
                                <li class="scroll-to-section"><a href="HomePage">Naruto</a></li>
                                <li class="submenu">
                                    <a href="javascript:;">Pages</a>
                                    <ul>
                                        <li><a href="about.html">About Us</a></li>
                                        <li><a href="products">Products</a></li>

                                        <li><a href="contact">Contact Us</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:;">tài khoản</a>
                                    <ul>
                                        <li><a href="#">Tài Khoản Của Tôi</a></li>
                                        <li><a href="#">Đơn Mua</a></li>
                                        <li><a href="login.jsp">Đăng xuất</a></li>
                                        <li><a rel="nofollow" href="https://templatemo.com/page/4" target="_blank">Template Page 4</a></li>
                                    </ul>
                                </li>
                                <li class="scroll-to-section"><a href="HomePage">Explore</a></li>
                            </ul>        
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- ***** Header Area End ***** -->

        <!-- ***** Main Banner Area Start ***** -->
        <div class="page-heading" id="top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="inner-content">
                            <h2>Mô Hình Chính Hãng</h2>
                            <span>figure chính hãng nhập khẩu từ nhật bản </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->


        <!-- ***** Product Area Starts ***** -->

        <section class="section" id="product">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="left-images">
                            <img name="img" src="${model.img}" alt="">

                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="right-content">
                            <h4 name="name" >${model.name}</h4>
                            <span class="price" name="price" >${model.price} $</span>
                            <ul class="stars">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>
                            <span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod kon tempor incididunt ut labore.</span>
                            <div class="quote">



                                <h1 class="fa fa-quote-left" name="characterid" >  ${model.characterid} </h1>

                            </div>
                            <div class="quantity-content">
                                <div class="left-content">

                                    <h6 name="quantity" >${model.quantity}  products available</h6>

                                </div>
                                <br>
                                <br>
                                <hr/>

                                <div class="left-content">

                                    <h6>No. of Orders</h6>
                                </div>
                                <div class="right-content">
                                   <div class="quantity buttons_added">
                                        <input type="button" value="-" class="minus"><input type="number" step="1" min="1" max="${model.quantity}  "  name="quantity" value="1" title="Qty" class="input-text qty text" size="4" pattern="" inputmode=""><input type="button" value="+" class="plus">
                                    </div> 
                                </div>
                            </div>
                            <div class="total">
                                <h4 name="price">Total Pice <span id="totalPrice"></span></h4>
                                <form action="Addtocart" method = "get">
                                <input type="hidden" name="modelid" value="${model.modelid}">
                                <div class="main-border-button"><input type= "submit" value="Add To Cart"></a></div>
                                </form>
                                
                            </div>
                            
                            <script>
                                document.addEventListener("DOMContentLoaded", function () {
                                    const quantityInput = document.querySelector('input[name="quantity"]');
                                    const totalPriceElement = document.getElementById('totalPrice');
                                    const numberOfOrdersElement = document.getElementById('numberOfOrders');
                                    const unitPrice = ${model.price}; // Giá tiền mỗi sản phẩm

                                    // Function to update total price and number of orders
                                    function updateTotalPrice() {
                                        const quantity = parseInt(quantityInput.value);
                                        const totalPrice = unitPrice * quantity;
                                        totalPriceElement.textContent = totalPrice.toFixed(2); // Format totalPrice to 2 decimal places
                                        numberOfOrdersElement.textContent = quantity; // Update numberOfOrders directly with quantity
                                    }

                                    // Event listener for + and - buttons
                                    document.addEventListener('click', function () {
                                        updateTotalPrice();
                                    });

                                    document.addEventListener('click', function () {
                                        updateTotalPrice();
                                    });

                                    // Event listener for quantity change
                                    quantityInput.addEventListener('change', updateTotalPrice); // Use 'change' event instead of 'input'

                                    // Update total price and number of orders initially
                                    updateTotalPrice();
                                });


                            </script>   

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ***** Product Area Ends ***** -->

        <!-- ***** Footer Start ***** -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="first-item">
                            <div class="logo">
                                <img src="assets/images/white-logo.png" alt="hexashop ecommerce templatemo">
                            </div>
                            <ul>
                                <li><a href="#">16501 Collins Ave, Sunny Isles Beach, FL 33160, United States</a></li>
                                <li><a href="#">hexashop@company.com</a></li>
                                <li><a href="#">010-020-0340</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <h4>Shopping &amp; Categories</h4>
                        <ul>
                            <li><a href="#">Men’s Shopping</a></li>
                            <li><a href="#">Women’s Shopping</a></li>
                            <li><a href="#">Kid's Shopping</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><a href="#">Homepage</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Help</a></li>
                            <li><a href="#">Contact Us</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Help &amp; Information</h4>
                        <ul>
                            <li><a href="#">Help</a></li>
                            <li><a href="#">FAQ's</a></li>
                            <li><a href="#">Shipping</a></li>
                            <li><a href="#">Tracking ID</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-12">
                        <div class="under-footer">
                            <p>Copyright © 2022 HexaShop Co., Ltd. All Rights Reserved. 

                                <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a>

                                <br>Distributed By: <a href="https://themewagon.com" target="_blank" title="free & premium responsive templates">ThemeWagon</a></p>
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-behance"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>


        <!-- jQuery -->
        <script src="assets/js/jquery-2.1.0.min.js"></script>

        <!-- Bootstrap -->
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Plugins -->
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/accordions.js"></script>
        <script src="assets/js/datepicker.js"></script>
        <script src="assets/js/scrollreveal.min.js"></script>
        <script src="assets/js/waypoints.min.js"></script>
        <script src="assets/js/jquery.counterup.min.js"></script>
        <script src="assets/js/imgfix.min.js"></script> 
        <script src="assets/js/slick.js"></script> 
        <script src="assets/js/lightbox.js"></script> 
        <script src="assets/js/isotope.js"></script> 
        <script src="assets/js/quantity.js"></script>

        <!-- Global Init -->
        <script src="assets/js/custom.js"></script>

        <script>

                                $(function () {
                                    var selectedClass = "";
                                    $("p").click(function () {
                                        selectedClass = $(this).attr("data-rel");
                                        $("#portfolio").fadeTo(50, 0.1);
                                        $("#portfolio div").not("." + selectedClass).fadeOut();
                                        setTimeout(function () {
                                            $("." + selectedClass).fadeIn();
                                            $("#portfolio").fadeTo(50, 1);
                                        }, 500);

                                    });
                                });

        </script>

    </body>

</html>
