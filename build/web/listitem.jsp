<%-- 
    Document   : listitem
    Created on : Mar 19, 2024, 3:57:35 PM
    Author     : congkhoa2723
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <body>
        <%@include file="header.jsp" %>
        <h1 class="text-align-center" style = "color: red ">Order Detail</h1>
        <!-- thong bao da dang nhap -->
        <h5 class="text-align-center" style = "color : #97CBE6 ">${tbdn}</h5>

        <hr>   

        
        



        <!--   <button class="right-button">mức giá giảm dần</button> -->


        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Product</th>
                    <th>Quantity</th> 
                    <th>Unit Price</th>
                    <th>Total</th>
                    


                 
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="o" items="${orderItems}">
                    <tr>
                        <td>${o.orderitemid}</td>
                        <td>${o.name}</td>
                        <td>${o.quantity}</td>
                        <td>${o.price}$</td>
                        <td>${o.total}$</td>
                     
                        

                        

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
    
</html>
