<%-- 
    Document   : cart
    Created on : Feb 22, 2024, 9:40:56 PM
    Author     : congkhoa2723
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Cart</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <!-- ***** Preloader Start ***** -->

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
                                    <a href="javascript:;">tài khoản</a>
                                    <ul>
                                        <li><a href="#">Tài Khoản Của Tôi</a></li>
                                        <li><a href="cart.jsp">Đơn Mua</a></li>
                                        <li><a href="login.jsp">Đăng xuất</a></li>
                                        <li><a rel="nofollow" href="https://templatemo.com/page/4" target="_blank">Template Page 4</a></li>
                                    </ul>
                                </li>
                            </ul>        

                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>

        <div class="container">
            <div class="container px-3 my-5 clearfix">
                <!-- Shopping cart table -->
                <div class="card">
                    <div class="card-header">
                        <h2>Shopping Cart</h2>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered m-0">
                                <thead>
                                    <tr>
                                        <th class="text-center py-3 px-4" style="min-width: 400px;">Product Name &amp; Details</th>
                                        <th class="text-right py-3 px-4" style="width: 100px;">Price </th>
                                        <th class="text-center py-3 px-4" style="width: 120px;">Quantity </th>
                                        <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
                                        <th class="text-right py-3 px-4" style="width: 100px;">Delete</th>

                                    </tr>
                                </thead>
                                <tbody>
                                <form action="deleteall" method="get">
                                        <button type="submit" >Delete All</button>
                                    </form>
                                    

                                    <c:forEach var="item" items="${order.items}">
                                        <tr>
                                            <td class="p-4" style="vertical-align: middle;">
                                                <div class="media align-items-center">
                                                    <img src="${item.model.img}" class="d-block ui-w-40 mr-4" alt="" style="border-radius: 10px;">
                                                    <div class="media-body">
                                                        <h3 style="font-family: 'Arial', sans-serif; color: #808080; margin-bottom: 0;">${item.model.name}</h3>
                                                        <c:choose>
                                                            <c:when test="${item.model.quantity > 0}">
                                                                <span style="color: green;">In Stock</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span style="color: red;">Out Stock</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-right font-weight-semibold align-middle p-4">${item.model.price}$</td>
                                            <td class="align-middle p-4" style="vertical-align: middle;">
                                                <form action="updatecart" method="get" style="text-align: center;">
                                                    <input type="hidden" name="modelid" value="${item.model.modelid}">
                                                    <input type="number" class="form-control text-center" name="quantity" value="${item.quantity}" min="1" max="${item.model.quantity}">
                                                    <input type ="submit" class>
                                                </form>
                                            </td>
                                            <td class="text-right font-weight-semibold align-middle p-4">${item.model.price * item.quantity}$</td>
                                            <td class="text-center align-middle px-0" style="vertical-align: middle;">
                                                <form action="deletecart" method="get">
                                                    <input type="hidden" name="modelid" value="${item.model.modelid}">
                                                    <button type="submit" class="btn btn-danger"><i class="fas fa-times"></i> Delete</button>
                                                </form>
                                            </td>



                                        </c:forEach>
                                        <c:set var="totalPrice" value="0" />
                                        <c:forEach var="item" items="${order.items}">
                                            <c:set var="itemTotalPrice" value="${item.model.price * item.quantity}" />
                                            <c:set var="totalPrice" value="${totalPrice + itemTotalPrice}" />
                                            <!-- Các dòng mã HTML để hiển thị thông tin mặt hàng ở đây -->

                                        </c:forEach>
                                <div style="background-color: grey; padding: 10px; border-radius: 5px;">
                                    <marquee style="color : white" behavior="scroll" direction="right">${errorquantity}</marquee>
                                </div>
                                <!-- Phần hiển thị tổng tiền -->
                                <div style="background-color: #f5f5f5; padding: 15px; margin-top: 20px; border-radius: 5px; text-align: center;">
                                    <h4 style="font-size: 18px; color: #333;">Total Price: <span style="font-size: 24px; color: #ff6600; font-weight: bold;">${totalPrice}$</span></h4>
                                </div>
                              
                               
                                <div style="position: fixed; bottom: 20px; left: 50%; transform: translateX(-50%);">
                                    <form id="checkoutForm" action="checkout" method="get">
                                        <button type="submit" class="btn btn-success btn-lg"><i class="fas fa-shopping-cart"></i> Checkout</button>
                                    </form>
                                </div>

                                 <script>
                                     // JavaScript để xác nhận khi người dùng nhấn vào nút Checkout
                                     document.getElementById("checkoutForm").addEventListener("submit", function (event) {
                                         var confirmCheckout = confirm("ban muon check out chu");
                                         if (!confirmCheckout) {
                                             event.preventDefault(); // Ngăn chặn gửi yêu cầu checkout nếu người dùng không xác nhận
                                         }
                                     });
                                 </script>







                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- / Shopping cart table -->

                    <!-- Add other components like Promocode, Discount, Total price, Back to shopping, Checkout buttons here -->
                </div>
            </div>
        </div>

    </body>
</html>
