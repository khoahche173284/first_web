<%-- 
    Document   : listorder
    Created on : Feb 20, 2024, 10:57:46 PM
    Author     : congkhoa2723
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Page</title>
    </head>
    <body>

        <%@include file="header.jsp" %>
        <h1 class="text-align-center" style = "color: red ">Orders</h1>
            

        <table border="1">
            <thead>
                <tr>
                    
                    <th>CUSTOMER</th>
                    
                    <th>TOTAL AMOUNT</th>
                  
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="orders" items="${orderList}">
                    
                    <tr>
                        
                        <td>${orders.name}</td>
                        
                        
                        <td>${orders.totalamount}$</td>

                    
                        <td style="text-align: center">
                            <form action="listitem" method="get">
                                <input type="hidden" name="orderid" value="${orders.orderid}">
                                <input type="submit" value="xem chi tiết👁️️">
                            </form>
                        </td>
                        <td style="text-align: center">
                           
                                <input type="submit" value="update">
                            
                        </td>
                        <td style="text-align: center">
                           
                                <input type="submit" value="X">
                            
                        </td>
                        
                    </tr>
                    
              </c:forEach>
               <!--      

              -->

            </tbody>
        </table>

        <p style = "color : grey" >${successMsg}</p>
        <c:set var="namel" value="${null}" scope ="session"></c:set>
        <p style="color : red">${msg}</p>
        <c:set var="msg" value="${null}" scope ="session"></c:set>
    </body>
</html>
