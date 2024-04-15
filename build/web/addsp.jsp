<%-- 
    Document   : add
    Created on : Jan 23, 2024, 10:09:45 AM
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
        <h1 style = "color : red ">Thêm Nhân Vật</h1>

        <form action="addsp" method="post" > 
            Name: <input type="text" name="name" required />
            <br/>

            Anime: 
            <select name="title">
                <c:forEach var="anime" items="${animeList}">
                    <option value="${anime.animeid}">${anime.title}</option>
                </c:forEach>
            </select>
            <br/>
            <br/><!-- button -->
           
            <br/>

            <input type="submit" value="Add" />


        </form>

        <p>${error}</p>
    </body>
</html>
