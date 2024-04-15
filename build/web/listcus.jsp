<%-- 
    Document   : listcus
    Created on : Mar 18, 2024, 2:28:37 PM
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
        <h1 class="text-align-center" style = "color: red ">List Model</h1>
        <!-- thong bao da dang nhap -->
        <h5 class="text-align-center" style = "color : #97CBE6 ">${tbdn}</h5>

        <hr>   

        
        



        <!--   <button class="right-button">mức giá giảm dần</button> -->


        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>EMAIL</th> 
                    <th>ADDRESS</th>
                    <th>LOGINID</th>
                    


                    <c:if test ="${admin != null}">
                        <th>Update</th>
                        <th>Delete</th>
                        </c:if>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customerList}">
                    <tr>
                        <td>${customer.customerid}</td>
                        <td>${customer.name}</td>
                        <td>${customer.email}</td>
                        <td>${customer.address}</td>
                        <td>${customer.loginid}</td>
                        
                       
                            <td style="text-align: center">
                                <form action="showname" method="get">
                                    <input type="hidden" name="customerid" value="${customer.customerid}">
                                    <input type="submit" value="🖊️">
                                </form>
                            </td>
                            

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
