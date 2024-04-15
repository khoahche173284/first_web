<%-- 
    Document   : updatemd
    Created on : Feb 11, 2024, 12:42:39 PM
    Author     : congkhoa2723
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title >Update </title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <hr>
        <h1 style = "color : red">Update Model</h1>
      
        <form action="updatemd" method="post">
            <input type="hidden" name="modelid" value="${model.modelid}">
            Name: <input type="text" name="name" value= "${model.name}" />
            <br/><!-- comment -->
            Price: <input type="text" name="price" value="${model.price}" />
            <br>
            quantity:  <input type="text" name="quantity" value="${model.quantity}" />
            <br>
            Date release: <input type="text" name="releasedate" value= "${model.releasedate}"/>
            <br/>
            Character (chọn lại) :  <select name="characterid">
                <c:forEach var="nhanvat" items="${nhanvatList}">
                    <option value="${nhanvat.characterid}">${nhanvat.name}</option>
                </c:forEach>
            </select>
            <br/>
            Img link: <input type="text" name="img" value= "${model.img}"/>
            <input type="submit" value="update" />
        </form>
    </body>
</html>
