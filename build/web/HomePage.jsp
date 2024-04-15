<%-- 
    Document   : HomePage
    Created on : Feb 6, 2024, 10:19:54 AM
    Author     : congkhoa2723
--%>
<!-- index.jsp -->

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

        <title>Hexashop Ecommerce HTML CSS Template</title>


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
        <style>
            /* Styling cho thông báo */
            #eye-catching-message {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #999999; /* Màu nền */
                color: #fff; /* Màu chữ */
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Bóng đổ */
                text-align: center;
                font-size: 24px;
                font-weight: bold;
                font-family: 'Montserrat', sans-serif; /* Sử dụng font Montserrat */
                z-index: 999; /* Đảm bảo thông báo hiển thị trên mọi phần tử khác */
            }

        .search-container {
            margin-top: 160px;
            text-align: center; /* Đặt văn bản ở trung tâm */
        }
        .search-box {
            width: 50%; /* Độ rộng của ô tìm kiếm */
            padding: 10px; /* Khoảng cách bên trong của ô tìm kiếm */
            border: 1px solid #ccc; /* Xóa viền */
            border-radius: 20px; /* Làm tròn góc */
            outline: 1px; /* Loại bỏ đường viền xung quanh ô khi được chọn */
        }
        .search-button {
            background-color: #2A2A2A; /* Màu nền của nút tìm kiếm */
            color: white; /* Màu chữ */
            border: 1px; /* Xóa viền */
            border-radius: 20px; /* Làm tròn góc */
            padding: 10px 20px; /* Kích thước của nút */
            cursor: pointer; /* Biến con trỏ thành bàn tay khi di chuột qua */
        }
            </style>
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
                                    <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
                                    <li class="scroll-to-section"><a href="#men">Dragonball</a></li>
                                    <li class="scroll-to-section"><a href="#women">OnePice</a></li>
                                    <li class="scroll-to-section"><a href="#kids">Naruto</a></li>
                                    <li class="submenu">
                                        <a href="javascript:;">Pages</a>
                                        <ul>
                                            <li><a href="about.html">About Us</a></li>
                                            <li><a href="products">Products</a></li>

                                            <li><a href="contact.html">Contact Us</a></li>
                                        </ul>
                                    </li>

                                    <li class="scroll-to-section"><a href="#explore">Explore</a></li>
                                    <li class="submenu">
                                        <a href="javascript:;">Account</a>
                                        <ul>
                                            <c:if test ="${admin != null}">
                                                <li><a href="header.jsp" >Admin</a></li>
                                                </c:if>   
                                            <li><a href="cart.jsp">Đơn Mua</a></li>
                                            <li><a href="success">Đơn Đã Mua</a></li>
                                            <li><a href="login.jsp">Đăng xuất</a></li>
                                            <li><a rel="nofollow" href="https://templatemo.com/page/4" target="_blank">Template Page 4</a></li>
                                        </ul>
                                    </li>
                                   
                                </ul>        
                                <a class='menu-trigger'>
                                     <div class="search-container">
                
            </div>
                                </a>
                                <!-- ***** Menu End ***** -->
                            </nav>
                        </div>
                    </div>
                </div>
            </header>

             
           <div class="search-container">
        <form action="searchcustomer" method="post" >
            <input type="text" placeholder="Search model.." id="name" name = "name" class="search-box" required autofocus>
            <button type="submit" class="search-button">Search</button>
            
        </form>
    </div> 
            

            <!-- từ checkout.java-->
            <c:if test="${message != null}">
                <h5 id="eye-catching-message">${message}</h5>
            </c:if>


            <!-- ***** Main Banner Area Start ***** -->
            <div class="main-banner" style="padding-top: 50px " id="top">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="left-content">
                                <div class="thumb">
                                    <div class="inner-content">
                                        <h4>We Are Hexashop</h4>
                                        <span>Awesome, clean &amp; creative HTML5 Template</span>
                                        <div class="main-border-button">
                                            <a href="#">Purchase Now!</a>
                                        </div>
                                    </div>
                                    <img src="https://content.pancake.vn/1/s1400x1400/41/35/ce/d3/636e9d2d1a0cad92e57420f8a2daa4f1a7b25181f4493c30a0c79859.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-content">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="right-first-image">
                                            <div class="thumb">
                                                <div class="inner-content">
                                                    <h4>OnePice</h4>
                                                    <span>Best For OnePice</span>
                                                </div>
                                                <div class="hover-content">
                                                    <div class="inner">
                                                        <h4>OnePice</h4>
                                                        <p>Lorem ipsum dolor sit amet, conservisii ctetur adipiscing elit incid.</p>
                                                        <div class="main-border-button">
                                                            <a href="#">Discover More</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <img src="https://down-vn.img.susercontent.com/file/0b09557936884948b4370fc00f94f3b1">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="right-first-image">
                                            <div class="thumb">
                                                <div class="inner-content">
                                                    <h4>Dragonball</h4>
                                                    <span>Best For Dragonball </span>
                                                </div>
                                                <div class="hover-content">
                                                    <div class="inner">
                                                        <h4>Dragonball</h4>
                                                        <p>Lorem ipsum dolor sit amet, conservisii ctetur adipiscing elit incid.</p>
                                                        <div class="main-border-button">
                                                            <a href="#">Discover More</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <img src="https://cf.shopee.vn/file/d02e4cf55b4daa9fb85c792303686c50">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="right-first-image">
                                            <div class="thumb">
                                                <div class="inner-content">
                                                    <h4>Naruto</h4>
                                                    <span>Best For Naruto</span>
                                                </div>
                                                <div class="hover-content">
                                                    <div class="inner">
                                                        <h4>Naruto</h4>
                                                        <p>Lorem ipsum dolor sit amet, conservisii ctetur adipiscing elit incid.</p>
                                                        <div class="main-border-button">
                                                            <a href="#">Discover More</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <img src="https://bizweb.dktcdn.net/100/418/981/products/z4662270808216-170eee1386eaae49a183f95f70a73fdf.jpg?v=1693883236803">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="right-first-image">
                                            <div class="thumb">
                                                <div class="inner-content">
                                                    <h4>Accessories</h4>
                                                    <span>Best Trend Accessories</span>
                                                </div>
                                                <div class="hover-content">
                                                    <div class="inner">
                                                        <h4>Accessories</h4>
                                                        <p>Lorem ipsum dolor sit amet, conservisii ctetur adipiscing elit incid.</p>
                                                        <div class="main-border-button">
                                                            <a href="#">Discover More</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <img src="https://img.ws.mms.shopee.vn/ab31cb2888397dc35289e0ed8e75ac74">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ***** Main Banner Area End ***** -->

            <!-- ***** Men Area Starts ***** -->
            <section class="section" id="men">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="section-heading">
                                <h2>Dragon Ball's Latest</h2>
                                <span>Details to details is what makes Hexashop different from the other themes.</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="men-item-carousel">
                                <div class="owl-men-item owl-carousel">
                                    <% ArrayList<Model> modelList = (ArrayList<Model>) request.getAttribute("modelList");
                                           if (modelList != null  ) {
                                           for (int i = 0; i <modelList.size() ; i++) {
                                           Model model = modelList.get(i); 
                                   if (model.getAnimeid().equals("Dragon Ball"))    {%> 
                                    <div class="item">
                                        <div class="thumb">
                                            <div class="hover-content">
                                                <ul>
                                                    <li style="display: inline-block;">
                                                        <form action="single" method="get">
                                                            <input type="hidden" name="modelid" value="<%= model.getModelid()%>">
                                                            <input type="submit" value="️👁️‍️">
                                                        </form>
                                                    </li>
                                                    <li style="display: inline-block;">
                                                        <form action="Addtocart" method="get">
                                                            <input type="hidden" name="modelid" value="<%= model.getModelid()%>">
                                                            <input type="submit" value="🛒">
                                                        </form>
                                                    </li>
                                                </ul>

                                            </div>
                                            <img src="<%= model.getImg()%> " alt="">
                                        </div>

                                        <div class="down-content">
                                            <h4><%= model.getName() %></h4>
                                            <span><%= model.getPrice() %> $</span>
                                            <span>Character: <%= model.getCharacterid() %> </span>
                                            <ul class="stars">
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <%
           }      }
               }
                                    %>    

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ***** Men Area Ends ***** -->

            <!-- ***** Women Area Starts ***** -->
            <section class="section" id="women">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="section-heading">
                                <h2>OnePice's Latest</h2>
                                <span>Details to details is what makes Hexashop different from the other themes.</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12">
                            <div class="women-item-carousel">
                                <div class="owl-women-item owl-carousel">

                                    <%

   
            if (modelList != null  ) {
      
            
                         for (int i = 0; i <modelList.size() ; i++) {
                             Model model = modelList.get(i); 
                        if (model.getAnimeid().equals("One Piece")){
                                    %>    
                                    <div class="item">
                                        <div class="thumb">
                                            <div class="hover-content">
                                                <ul>
                                                    <li style="display: inline-block;">
                                                        <form action="single" method="get">
                                                            <input type="hidden" name="modelid" value="<%= model.getModelid()%>">
                                                            <input type="submit" value="️👁️‍️">
                                                        </form>
                                                    </li>
                                                    <li style="display: inline-block;">
                                                        <form action="Addtocart" method="get">
                                                            <input type="hidden" name="modelid" value="<%= model.getModelid()%>">
                                                            <input type="submit" value="🛒">
                                                        </form>
                                                    </li>
                                                </ul>
                                            </div>
                                            <img src="<%= model.getImg()%> " alt="">
                                        </div>

                                        <div class="down-content">
                                            <h4><%= model.getName() %></h4>
                                            <span><%= model.getPrice() %> $</span>
                                            <span>Character: <%= model.getCharacterid() %> </span>
                                            <ul class="stars">
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <%
    }      }
    }
                                    %>                   
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <!-- ***** Women Area Ends ***** -->

            <!-- ***** Kids Area Starts ***** -->

            <section class="section" id="kids">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="section-heading">
                                <h2>Naruto's Latest</h2>
                                <span>Details to details is what makes Hexashop different from the other themes.</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="kid-item-carousel">
                                <div class="owl-kid-item owl-carousel">
                                    <%

  
   
    if (modelList != null  ) {
      
            
                for (int i = 0; i <modelList.size() ; i++) {
                    Model model = modelList.get(i); 
               if (model.getAnimeid().equals("Naruto")){
                                    %>
                                    <div class="item">
                                        <div class="thumb">
                                            <div class="hover-content">
                                                <ul>
                                                    <li style="display: inline-block;">
                                                        <form action="single" method="get">
                                                            <input type="hidden" name="modelid" value="<%= model.getModelid()%>">
                                                            <input type="submit" value="️👁️‍️">
                                                        </form>
                                                    </li>
                                                    <li style="display: inline-block;">
                                                        <form action="Addtocart" method="get">
                                                            <input type="hidden" name="modelid" value="<%= model.getModelid()%>">
                                                            <input type="submit" value="🛒">
                                                        </form>
                                                    </li>
                                                </ul>
                                            </div>
                                            <img src="<%= model.getImg()%> " alt="">                                   
                                        </div>
                                        <div class="down-content">
                                            <h4><%= model.getName() %> </h4>
                                            <span><%= model.getPrice() %> $</span>
                                            <span>Character: <%= model.getCharacterid() %> </span>

                                            <ul class="stars">
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <%
    }      }
    }
                                    %> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ***** Kids Area Ends ***** -->

            <!-- ***** Explore Area Starts ***** -->
            <section class="section" id="explore">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="left-content">
                                <h2>Explore Our Products</h2>
                                <span>"Dragon Ball" is one of the most famous manga and anime series of all time, created by Akira Toriyama. This series has created a global cultural phenomenon since its debut in the 1980s and continues to be an icon for multiple generations of fans.</span>
                                <div class="quote">
                                    <i class="fa fa-quote-left"></i><p>In "Dragon Ball," we witness the strength and development of characters through exciting battles, as well as profound human values ​​such as friendship, courage, and unity.</p>
                                </div>
                                <p>"Dragon Ball" tells the story of Goku  of Dragon Balls, each of which allows the holder to summon a "Shenron Dragon" to grant one wish.</p>
                                <p>The series is divided into several parts, including Dragon Ball, Dragon Ball Z, Dragon Ball GT, and Dragon Ball Super, each focusing on a specific period in Goku's life and his allies. <a rel="nofollow" href="https://paypal.me/templatemo" target="_blank">support us</a> a little via PayPal. Please also tell your friends about our great website. Thank you.</p>
                                <div class="main-border-button">
                                    <a href="products.html">Discover More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-content">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="leather">
                                            <h4>High Broly</h4>
                                            <span>Latest Collection</span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="first-image">
                                            <img src="https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lf1crwamxq4q48" alt="">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="second-image">
                                            <img src="https://salt.tikicdn.com/ts/tmp/35/25/96/57109b1a08757dcf5d77f59d7f68cd68.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="types">
                                            <h4>Son Goku </h4>
                                            <span>Over 304 Products</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ***** Explore Area Ends ***** -->

            <!-- ***** Social Area Starts ***** -->
            <section class="section" id="social">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-heading">
                                <h2>Social Media</h2>
                                <span>Details to details is what makes Hexashop different from the other themes.</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row images">
                        <div class="col-2">
                            <div class="thumb">
                                <div class="icon">
                                    <a href="http://instagram.com">
                                        <h6>Fashion</h6>
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </div>
                                <img src="https://cf.shopee.vn/file/093ee3efe7d244af7499135709c02b7e_tn" alt="">
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="thumb">
                                <div class="icon">
                                    <a href="http://instagram.com">
                                        <h6>New</h6>
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </div>
                                <img src="https://down-vn.img.susercontent.com/file/8ee1fdb8fdcd55f3a634d9965d6dcf3b" alt="">
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="thumb">
                                <div class="icon">
                                    <a href="http://instagram.com">
                                        <h6>Brand</h6>
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </div>
                                <img src="https://salt.tikicdn.com/ts/product/30/3c/e1/46e00ef7dfdd90ebf72616ce1d48a044.jpg" alt="">
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="thumb">
                                <div class="icon">
                                    <a href="http://instagram.com">
                                        <h6>Makeup</h6>
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </div>
                                <img src="https://caysenda.vn/resources/upload/O1CN01QYXdSL1mZqqrA1mUB_!!2506204969-0-cib.jpg" alt="">
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="thumb">
                                <div class="icon">
                                    <a href="http://instagram.com">
                                        <h6>Leather</h6>
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </div>
                                <img src="https://down-vn.img.susercontent.com/file/7f185001963a3f6bc37ee5daae46310c" alt="">
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="thumb">
                                <div class="icon">
                                    <a href="http://instagram.com">
                                        <h6>Bag</h6>
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </div>
                                <img src="https://minitech.vn/wp-content/uploads/2022/11/Screenshot_1-7.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ***** Social Area Ends ***** -->

            <!-- ***** Subscribe Area Starts ***** -->
            <div class="subscribe">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="section-heading">
                                <h2>By Subscribing To Our Newsletter You Can Get 30% Off</h2>
                                <span>Details to details is what makes Hexashop different from the other themes.</span>
                            </div>
                            <form id="subscribe" action="" method="get">
                                <div class="row">
                                    <div class="col-lg-5">
                                        <fieldset>
                                            <input name="name" type="text" id="name" placeholder="Your Name" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-5">
                                        <fieldset>
                                            <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your Email Address" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-2">
                                        <fieldset>
                                            <button type="submit" id="form-submit" class="main-dark-button"><i class="fa fa-paper-plane"></i></button>
                                        </fieldset>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-4">
                            <div class="row">
                                <div class="col-6">
                                    <ul>
                                        <li>Store Location:<br><span>Sunny Isles Beach, FL 33160, United States</span></li>
                                        <li>Phone:<br><span>010-020-0340</span></li>
                                        <li>Office Location:<br><span>North Miami Beach</span></li>
                                    </ul>
                                </div>
                                <div class="col-6">
                                    <ul>
                                        <li>Work Hours:<br><span>07:30 AM - 9:30 PM Daily</span></li>
                                        <li>Email:<br><span>info@company.com</span></li>
                                        <li>Social Media:<br><span><a href="#">Facebook</a>, <a href="#">Instagram</a>, <a href="#">Behance</a>, <a href="#">Linkedin</a></span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ***** Subscribe Area Ends ***** -->

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