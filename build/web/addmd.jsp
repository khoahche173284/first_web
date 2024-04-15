<%-- 
    Document   : addmd
    Created on : Feb 11, 2024, 11:05:54 AM
    Author     : congkhoa2723
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add char</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <hr>
        <!-- tittle -->
        <h1 style = "color : red ">Thêm Sản Phẩm</h1>

        <form action="addmd" method="post" > 
            Character: 
            <select name="characterid">
                <c:forEach var="nhanvat" items="${nhanvatList}">
                    <option value="${nhanvat.characterid}">${nhanvat.name}</option>
                </c:forEach>
            </select>
            <br><!-- comment -->
            Name: <input type="text" name="name" required />
            <br/>
            
            Price: <input type="text" name="price" required />
            <br><!-- comment -->
            Quantity:  <input type="text" name="quantity" required />
            <br><!-- comment -->
            Date: <input type="date" name="releasedate" required />
            Img : <input type="text" name="img" required />

            
            
            <br/>
            <br/><!-- button -->
           
            <br/>

            <input type="submit" value="Add" />


        </form>

        <p>${error}</p>
    </body>
</html>
